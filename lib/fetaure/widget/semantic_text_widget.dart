import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_accessibility_helper/flutter_accessibility_helper.dart';
import '../constants/app_text_styles.dart';


/// Универсальный текстовый виджет с семантикой для screen readers
/// 
/// Этот виджет обеспечивает доступность для пользователей с нарушениями зрения,
/// предоставляя правильную семантическую информацию для screen readers.
class SemanticTextWidget extends StatelessWidget {
  /// Текст для отображения
  final String text;
  
  /// Стиль текста из AppTextStyles
  final TextStyle? style;
  
  /// Семантическая роль текста (alert, status и т.д.)
  final SemanticsRole? role;
  
  /// Семантическая метка для screen reader (если отличается от отображаемого текста)
  final String? semanticLabel;
  
  /// Является ли текст заголовком
  final bool isHeading;
  
  /// Уровень заголовка (1-6, только если isHeading = true)
  final int? headingLevel;
  
  /// Является ли текст кнопкой
  final bool isButton;
  
  /// Является ли текст ссылкой
  final bool isLink;
  
  /// Дополнительная семантическая информация
  final String? hint;
  
  /// Выравнивание текста
  final TextAlign? textAlign;
  
  /// Максимальное количество строк
  final int? maxLines;
  
  /// Переполнение текста
  final TextOverflow? overflow;
  
  /// Отступы
  final EdgeInsets? padding;
  
  /// Маржины
  final EdgeInsets? margin;

  const SemanticTextWidget({
    super.key,
    required this.text,
    this.style,
    this.role,
    this.semanticLabel,
    this.isHeading = false,
    this.headingLevel,
    this.isButton = false,
    this.isLink = false,
    this.hint,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.padding,
    this.margin,
  }) : assert(
          !isHeading || (headingLevel != null && headingLevel >= 1 && headingLevel <= 6),
          'headingLevel должен быть от 1 до 6, если isHeading = true',
        );

  @override
  Widget build(BuildContext context) {
    // Создаем базовый текстовый виджет
    Widget textWidget = Text(
      text,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );

    // Применяем семантику в зависимости от типа элемента
    if (isButton) {
      textWidget = Semantics(
        label: semanticLabel ?? text,
        hint: hint,
        button: true,
        child: textWidget,
      );
    } else if (isLink) {
      textWidget = Semantics(
        label: semanticLabel ?? text,
        hint: hint,
        link: true,
        child: textWidget,
      );
    } else if (isHeading) {
      // Для заголовков используем специальную семантику
      textWidget = Semantics(
        label: semanticLabel ?? text,
        hint: hint,
        header: true,
        child: textWidget,
      );
    } else {
      // Обычный текст с базовой семантикой
      textWidget = Semantics(
        label: semanticLabel ?? text,
        hint: hint,
        child: textWidget,
      );
    }

    // Добавляем отступы если нужно
    if (padding != null || margin != null) {
      textWidget = Container(
        padding: padding,
        margin: margin,
        child: textWidget,
      );
    }

    return textWidget;
  }

  /// Объявляет текст для screen reader
  void announceToScreenReader() {
    if (AccessibilityHelper.isAccessibilityEnabled) {
      AccessibilityHelper.announceToScreenReader(semanticLabel ?? text);
    }
  }
}

/// Предустановленные варианты SemanticTextWidget для частых случаев использования
class SemanticTextPresets {
  /// Заголовок страницы
  static Widget pageTitle(String text, {TextStyle? style, EdgeInsets? padding}) {
    return SemanticTextWidget(
      text: text,
      style: style ?? AppTextStyles.sectionHeader,
      isHeading: true,
      headingLevel: 1,
      padding: padding,
    );
  }

  /// Подзаголовок
  static Widget subtitle(String text, {TextStyle? style, EdgeInsets? padding}) {
    return SemanticTextWidget(
      text: text,
      style: style ?? AppTextStyles.contactSubtitle,
      isHeading: true,
      headingLevel: 2,
      padding: padding,
    );
  }

  /// Обычный текст
  static Widget body(String text, {TextStyle? style, EdgeInsets? padding}) {
    return SemanticTextWidget(
      text: text,
      style: style ?? AppTextStyles.mobileAppInfo,
      padding: padding,
    );
  }

  /// Текст кнопки
  static Widget button(String text, {TextStyle? style, EdgeInsets? padding}) {
    return SemanticTextWidget(
      text: text,
      style: style ?? AppTextStyles.buttonPrimaryText,
      isButton: true,
      padding: padding,
    );
  }

  /// Текст ссылки
  static Widget link(String text, {TextStyle? style, EdgeInsets? padding}) {
    return SemanticTextWidget(
      text: text,
      style: style ?? AppTextStyles.appBarNavItem,
      isLink: true,
      padding: padding,
    );
  }

  /// Текст с подсказкой
  static Widget hint(String text, {TextStyle? style, EdgeInsets? padding}) {
    return SemanticTextWidget(
      text: text,
      style: style ?? AppTextStyles.contactConsentText,
      hint: 'Подсказка: $text',
      padding: padding,
    );
  }

  /// Текст ошибки
  static Widget error(String text, {TextStyle? style, EdgeInsets? padding}) {
    return SemanticTextWidget(
      text: text,
      style: style ?? AppTextStyles.logoErrorTitle.copyWith(color: Colors.red),
      role: SemanticsRole.alert,
      padding: padding,
    );
  }

  /// Текст успеха
  static Widget success(String text, {TextStyle? style, EdgeInsets? padding}) {
    return SemanticTextWidget(
      text: text,
      style: style ?? AppTextStyles.logoErrorTitle.copyWith(color: Colors.green),
      role: SemanticsRole.status,
      padding: padding,
    );
  }

  /// Интерактивная кнопка с действием
  static Widget interactiveButton(
    String text, {
    required VoidCallback? onPressed,
    TextStyle? style,
    EdgeInsets? padding,
    String? hint,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Semantics(
        label: text,
        hint: hint ?? 'Нажмите для выполнения действия',
        button: true,
        child: Container(
          padding: padding,
          child: Text(
            text,
            style: style ?? AppTextStyles.buttonPrimaryText,
          ),
        ),
      ),
    );
  }

  /// Интерактивная ссылка с действием
  static Widget interactiveLink(
    String text, {
    required VoidCallback? onTap,
    TextStyle? style,
    EdgeInsets? padding,
    String? hint,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Semantics(
        label: text,
        hint: hint ?? 'Нажмите для перехода',
        link: true,
        child: Container(
          padding: padding,
          child: Text(
            text,
            style: style ?? AppTextStyles.appBarNavItem,
          ),
        ),
      ),
    );
  }
}

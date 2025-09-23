import 'dart:html' as html;
import 'package:flutter/foundation.dart';

/// Helper для объявлений screen reader'у через aria-live регион
/// 
/// Этот класс создает скрытый div с aria-live="polite" для динамических
/// объявлений, которые не поддерживаются стандартными Flutter Semantics на Web.
class AnnounceHelper {
  static html.DivElement? _liveRegion;
  static bool _initialized = false;

  /// Инициализирует aria-live регион
  static void initialize() {
    if (kIsWeb && !_initialized) {
      _liveRegion = html.DivElement()
        ..style.position = 'absolute'
        ..style.width = '1px'
        ..style.height = '1px'
        ..style.overflow = 'hidden'
        ..style.left = '-9999px'
        ..style.top = '-9999px'
        ..style.clip = 'rect(0, 0, 0, 0)'
        ..setAttribute('aria-live', 'polite')
        ..setAttribute('aria-atomic', 'true')
        ..setAttribute('role', 'status');

      html.document.body?.append(_liveRegion!);
      _initialized = true;
    }
  }

  /// Объявляет сообщение screen reader'у
  /// 
  /// [message] - текст для объявления
  /// [priority] - приоритет объявления ('polite' или 'assertive')
  static void announce(String message, {String priority = 'polite'}) {
    if (kIsWeb && _liveRegion != null) {
      // Очищаем предыдущее сообщение
      _liveRegion!.text = '';
      
      // Устанавливаем приоритет
      _liveRegion!.setAttribute('aria-live', priority);
      
      // Добавляем новое сообщение
      _liveRegion!.text = message;
      
      // Для надежности, очищаем и снова устанавливаем через небольшую задержку
      Future.delayed(const Duration(milliseconds: 100), () {
        if (_liveRegion != null) {
          _liveRegion!.text = '';
          _liveRegion!.text = message;
        }
      });
    }
  }

  /// Объявляет критическое сообщение (assertive)
  static void announceUrgent(String message) {
    announce(message, priority: 'assertive');
  }

  /// Объявляет обычное сообщение (polite)
  static void announcePolite(String message) {
    announce(message, priority: 'polite');
  }

  /// Очищает aria-live регион
  static void clear() {
    if (kIsWeb && _liveRegion != null) {
      _liveRegion!.text = '';
    }
  }

  /// Уничтожает aria-live регион
  static void dispose() {
    if (kIsWeb && _liveRegion != null) {
      _liveRegion!.remove();
      _liveRegion = null;
      _initialized = false;
    }
  }
}


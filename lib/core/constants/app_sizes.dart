import 'package:flutter/material.dart';

class AppSizes {
  // Базовые отступы
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
  
  // Размеры компонентов согласно дизайну
  static const double appBarHeight = 125.0;
  static const double appBarHeightMobile = 70.0; // Уменьшенная высота для мобильного
  static const double appBarWidth = 1230.0;
  static const double appBarTopPadding = 24.0;
  static const double appBarLeftPadding = 101.0;
  
  // Отступы для логотипа на десктопе
  static const double logoTopOffset = 10.0;
  static const double logoLeftOffset = 110.0;
  static const double drawerWidth = 280.0;
  static const double buttonHeight = 48.0;
  static const double buttonHeightMobile = 56.0;
  
  // Размеры переключателя языка
  static const double languageSwitchWidth = 76.0;
  static const double languageSwitchHeight = 51.0;
  static const double languageSwitchTopOffset = 55.0;
  static const double languageSwitchLeftOffset = 1255.0;
  
  // Брейкпоинты для адаптивности
  static const double mobileBreakpoint = 768.0;
  static const double tabletBreakpoint = 1024.0;
  static const double desktopBreakpoint = 1200.0;
  
  // Адаптивные размеры AppBar
  static double getAppBarHeight(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < mobileBreakpoint) {
      return appBarHeightMobile;
    }
    return appBarHeight;
  }
  
  // Адаптивные отступы
  static EdgeInsets getResponsivePadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < mobileBreakpoint) {
      return const EdgeInsets.all(md);
    } else if (width < tabletBreakpoint) {
      return const EdgeInsets.all(lg);
    } else {
      return const EdgeInsets.all(xl);
    }
  }
  
  // Адаптивные горизонтальные отступы
  static EdgeInsets getResponsiveHorizontalPadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < mobileBreakpoint) {
      return const EdgeInsets.symmetric(horizontal: md);
    } else if (width < tabletBreakpoint) {
      return const EdgeInsets.symmetric(horizontal: lg);
    } else {
      return const EdgeInsets.symmetric(horizontal: xl);
    }
  }
  
  // Адаптивные отступы для контента
  static EdgeInsets getContentPadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < mobileBreakpoint) {
      return const EdgeInsets.all(md);
    } else if (width < tabletBreakpoint) {
      return const EdgeInsets.symmetric(horizontal: lg, vertical: md);
    } else {
      return const EdgeInsets.symmetric(horizontal: xxl, vertical: lg);
    }
  }
}

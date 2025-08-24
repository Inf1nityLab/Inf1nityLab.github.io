import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Заголовки
  static const TextStyle h1 = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.2,
  );
  
  static const TextStyle h2 = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.3,
  );
  
  static const TextStyle h3 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.4,
  );
  
  // Навигация согласно дизайну
  static const TextStyle navigation = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.0,
    // fontFamily: 'Instrument Sans', // Временно отключено
  );
  
  static const TextStyle navigationSelected = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.0,
    // fontFamily: 'Instrument Sans', // Временно отключено
  );
  
  static const TextStyle navigationMobile = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.5,
  );
  
  // Основной текст
  static const TextStyle body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.6,
  );
  
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.6,
  );
  
  // Кнопки
  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.background,
    height: 1.0,
  );
  
  // Адаптивные стили для разных размеров экранов
  static TextStyle getResponsiveH1(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 768) {
      return h1.copyWith(fontSize: 32);
    } else if (width < 1024) {
      return h1.copyWith(fontSize: 40);
    }
    return h1;
  }
  
  static TextStyle getResponsiveH2(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 768) {
      return h2.copyWith(fontSize: 28);
    } else if (width < 1024) {
      return h2.copyWith(fontSize: 32);
    }
    return h2;
  }
}

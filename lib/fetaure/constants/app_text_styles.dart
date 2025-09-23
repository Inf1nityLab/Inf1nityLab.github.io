import 'package:flutter/material.dart';

class AppTextStyles {
  // Цвета
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color gray600 = Color(0xFF64748B);
  static const Color gray200 = Color(0xFFE2E8F0);
  static const Color brandBlue = Color(0xFF00367D);

  // Стили для HomeScreen
  static const TextStyle homeTitle = TextStyle(
    fontFamily: 'Instrument Sans',
    fontWeight: FontWeight.w700,
    fontSize: 24,
    height: 1.0,
    letterSpacing: 0,
    color: white,
  );

  static const TextStyle homeSubtitle = TextStyle(
    fontFamily: 'Instrument Sans',
    fontWeight: FontWeight.w700,
    fontSize: 12,
    height: 1.5,
    letterSpacing: 0,
    color: white,
  );

  // Стили для Footer
  static const TextStyle footerBody = TextStyle(
    fontFamily: 'Instrument Sans',
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 1.0,
    color: black,
  );

  static const TextStyle footerBold = TextStyle(
    fontFamily: 'Instrument Sans',
    fontWeight: FontWeight.w700,
    fontSize: 12,
    height: 1.0,
    color: black,
  );

  // Стили для ошибок логотипов
  static const TextStyle logoErrorTitle = TextStyle(
    color: gray600,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  static const TextStyle logoErrorSubtitle = TextStyle(
    color: gray600,
    fontWeight: FontWeight.bold,
    fontSize: 12,
  );

  // Стили для ContactScreen
  static const TextStyle contactTitle = TextStyle(
    fontFamily: 'Instrument Sans',
    fontWeight: FontWeight.w700,
    fontSize: 24,
    height: 1.0,
    color: white,
  );

  static const TextStyle contactTitleMobile = TextStyle(
    fontFamily: 'Instrument Sans',
    fontWeight: FontWeight.w700,
    fontSize: 20,
    height: 1.0,
    color: white,
  );

  static const TextStyle contactSubtitle = TextStyle(
    fontFamily: 'Instrument Sans',
    fontWeight: FontWeight.w700,
    fontSize: 14,
    height: 1.0,
    color: white,
  );

  static const TextStyle contactSubtitleMobile = TextStyle(
    fontFamily: 'Instrument Sans',
    fontWeight: FontWeight.w700,
    fontSize: 12,
    height: 1.0,
    color: white,
  );

  static const TextStyle contactFieldLabel = TextStyle(
    fontFamily: 'Instrument Sans',
    fontWeight: FontWeight.w600,
    fontSize: 14,
    height: 1.0,
    color: white,
  );

  static const TextStyle contactFieldLabelMobile = TextStyle(
    fontFamily: 'Instrument Sans',
    fontWeight: FontWeight.w600,
    fontSize: 12,
    height: 1.0,
    color: white,
  );

  static const TextStyle contactConsentText = TextStyle(
    fontFamily: 'Instrument Sans',
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 1.0,
    color: white,
  );

  static const TextStyle contactConsentTextMobile = TextStyle(
    fontFamily: 'Instrument Sans',
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 1.0,
    color: white,
  );

  static const TextStyle contactButton = TextStyle(
    fontFamily: 'Instrument Sans',
    fontWeight: FontWeight.w700,
    fontSize: 16,
    height: 1.0,
  );

  static const TextStyle contactButtonMobile = TextStyle(
    fontFamily: 'Instrument Sans',
    fontWeight: FontWeight.w700,
    fontSize: 14,
    height: 1.0,
  );

  static const TextStyle socialButton = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    height: 1.0,
  );

  static const TextStyle socialTitle = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 24,
    height: 1.0,
    color: black,
  );

  static const TextStyle socialTitleMobile = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 20,
    height: 1.0,
    color: black,
  );

  // Цвета для ContactScreen
  static const Color contactBackground = Color(0xFF00367D);
  static const Color contactAccent = Color(0xFF58B9CF);
  static const Color contactFieldBackground = white;
  static const Color contactFieldBorder = white;

  // Стили для заголовков секций
  static const TextStyle sectionHeader = TextStyle(
    fontFamily: 'Instrument Sans',
    fontWeight: FontWeight.w700,
    fontSize: 24,
    height: 1.0,
    letterSpacing: 0,
    color: brandBlue,
  );

  // Стили для карточек мобильных приложений
  static const TextStyle mobileAppInfo = TextStyle(
    fontFamily: 'Instrument Sans',
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 1.4,
    color: black,
  );

  static const Color cardBorderColor = Color(0xFF949494);

  // AppBar навигация
  static const TextStyle appBarNavItem = TextStyle(
    fontFamily: 'Instrument Sans',
    fontWeight: FontWeight.w400,
    fontSize: 15,
    height: 1.0,
    letterSpacing: 0,
    color: black,
  );

  static const TextStyle appBarNavItemSelected = TextStyle(
    fontFamily: 'Instrument Sans',
    fontWeight: FontWeight.w700,
    fontSize: 15,
    height: 1.0,
    letterSpacing: 0,
    color: black,
  );

  // Языковая кнопка (LanguageButton)
  static const TextStyle languageButtonText = TextStyle(
    fontFamily: 'Instrument Sans',
    fontWeight: FontWeight.w500,
    fontSize: 15,
    height: 1.0,
    letterSpacing: 0,
    color: black,
  );

  // Карточка FeaturesGrid
  static const TextStyle featureCardTitle = TextStyle(
    fontFamily: 'Instrument Sans',
    fontWeight: FontWeight.w800,
    fontSize: 16,
    height: 1.1,
    color: Colors.black87,
  );

  static const TextStyle featureCardBody = TextStyle(
    fontFamily: 'Instrument Sans',
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 1.35,
    color: Colors.black87,
  );

  // Кнопки
  static const Color buttonPrimaryBg = brandBlue;
  static const Color buttonPrimaryFg = white;
  static const TextStyle buttonPrimaryText = TextStyle(
    fontFamily: 'Instrument Sans',
    fontWeight: FontWeight.w700,
    fontSize: 16,
    height: 1.0,
    letterSpacing: 0,
    color: white,
  );

  // Карточки (CardWidget)
  static const TextStyle cardTitle = TextStyle(
    fontFamily: 'Instrument Sans',
    fontWeight: FontWeight.w700,
    fontSize: 18,
    height: 1.1,
    color: Colors.black87,
  );

  static const TextStyle cardSubtitle = TextStyle(
    fontFamily: 'Instrument Sans',
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 1.35,
    color: Colors.black54,
  );

  static const TextStyle cardPoint = TextStyle(
    fontFamily: 'Instrument Sans',
    fontWeight: FontWeight.w400,
    fontSize: 15,
    height: 1.4,
    color: Colors.black87,
  );

  // Стили для LogoWidget
  static const TextStyle logoText = TextStyle(
    fontFamily: 'Instrument Sans',
    fontWeight: FontWeight.w700,
    fontSize: 24,
    height: 1.0,
    letterSpacing: 0,
    color: black,
  );

  static const TextStyle logoDefault = TextStyle(
    fontFamily: 'Instrument Sans',
    fontWeight: FontWeight.w700,
    fontSize: 24,
    height: 1.0,
    letterSpacing: 0,
    color: black,
  );

  // Стили для NumberedItemWidget
  static const TextStyle numberedItemNumber = TextStyle(
    fontFamily: 'Instrument Sans',
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: brandBlue,
  );

  static const TextStyle numberedItemText = TextStyle(
    fontFamily: 'Instrument Sans',
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 1.4,
    letterSpacing: 0,
    color: white,
  );

  // Стили для TinyBadge
  static const TextStyle tinyBadgeText = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 13,
  );
}

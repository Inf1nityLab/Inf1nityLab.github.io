import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider with ChangeNotifier {
  Locale _currentLocale = const Locale('ru');
  bool _isInitialized = false;

  Locale get currentLocale => _currentLocale;
  bool get isInitialized => _isInitialized;

  // Поддерживаемые локали
  static const List<Locale> supportedLocales = [
    Locale('ru'),
    Locale('ky'),
  ];

  // Локализация Flutter
  static const List<LocalizationsDelegate> localizationsDelegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  // Получить название языка для отображения
  String getLanguageName(Locale locale) {
    switch (locale.languageCode) {
      case 'ru':
        return 'Рус';
      case 'ky':
        return 'Кыр';
      default:
        return 'Рус';
    }
  }

  // Получить следующий язык для переключения
  Locale getNextLocale() {
    final currentIndex = supportedLocales.indexOf(_currentLocale);
    final nextIndex = (currentIndex + 1) % supportedLocales.length;
    return supportedLocales[nextIndex];
  }

  // Переключить язык
  Future<void> toggleLanguage() async {
    final nextLocale = getNextLocale();
    await setLocale(nextLocale);
  }

  // Установить конкретный язык
  Future<void> setLocale(Locale locale) async {
    if (supportedLocales.contains(locale)) {
      _currentLocale = locale;
      await _saveLocaleToPrefs(locale);
      notifyListeners();
    }
  }

  // Инициализация - загрузка сохраненного языка
  Future<void> initialize() async {
    if (_isInitialized) return;
    
    final savedLocale = await _loadLocaleFromPrefs();
    if (savedLocale != null && supportedLocales.contains(savedLocale)) {
      _currentLocale = savedLocale;
    }
    _isInitialized = true;
    notifyListeners();
  }

  // Сохранение языка в SharedPreferences
  Future<void> _saveLocaleToPrefs(Locale locale) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('selected_locale', locale.languageCode);
    } catch (e) {
      debugPrint('Ошибка сохранения языка: $e');
    }
  }

  // Загрузка языка из SharedPreferences
  Future<Locale?> _loadLocaleFromPrefs() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final languageCode = prefs.getString('selected_locale');
      if (languageCode != null) {
        return Locale(languageCode);
      }
    } catch (e) {
      debugPrint('Ошибка загрузки языка: $e');
    }
    return null;
  }

  // Проверить, является ли текущий язык русским
  bool get isRussian => _currentLocale.languageCode == 'ru';

  // Проверить, является ли текущий язык кыргызским
  bool get isKyrgyz => _currentLocale.languageCode == 'ky';
}

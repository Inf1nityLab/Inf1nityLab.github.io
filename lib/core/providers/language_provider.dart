import 'package:flutter/material.dart';

enum Language { ru, en }

class LanguageProvider extends ChangeNotifier {
  Language _currentLanguage = Language.ru;
  
  Language get currentLanguage => _currentLanguage;
  
  String get currentLanguageCode => _currentLanguage.name;
  
  String get currentLanguageDisplayName {
    switch (_currentLanguage) {
      case Language.ru:
        return 'RU';
      case Language.en:
        return 'EN';
    }
  }
  
  String get currentLanguageFullName {
    switch (_currentLanguage) {
      case Language.ru:
        return 'Русский';
      case Language.en:
        return 'English';
    }
  }
  
  void toggleLanguage() {
    _currentLanguage = _currentLanguage == Language.ru 
        ? Language.en 
        : Language.ru;
    notifyListeners();
  }
  
  void setLanguage(Language language) {
    if (_currentLanguage != language) {
      _currentLanguage = language;
      notifyListeners();
    }
  }
  
  // Локализованные строки
  String getLocalizedString(String key) {
    switch (_currentLanguage) {
      case Language.ru:
        return _russianStrings[key] ?? key;
      case Language.en:
        return _englishStrings[key] ?? key;
    }
  }
  
  // Навигационные пункты
  List<Map<String, String>> get navigationItems {
    return [
      {
        'title': getLocalizedString('home'),
        'key': 'home',
      },
      {
        'title': getLocalizedString('mobile_apps'),
        'key': 'mobile_apps',
      },
      {
        'title': getLocalizedString('about'),
        'key': 'about',
      },
      {
        'title': getLocalizedString('contact'),
        'key': 'contact',
      },
    ];
  }
  
  // Русские строки
  static const Map<String, String> _russianStrings = {
    'home': 'Главная',
    'mobile_apps': 'Мобильные приложения',
    'about': 'О проекте',
    'contact': 'Обратная связь',
    'welcome': 'Добро пожаловать',
    'description': 'Описание страницы',
  };
  
  // Английские строки
  static const Map<String, String> _englishStrings = {
    'home': 'Home',
    'mobile_apps': 'Mobile Apps',
    'about': 'About Project',
    'contact': 'Feedback',
    'welcome': 'Welcome',
    'description': 'Page description',
  };
}

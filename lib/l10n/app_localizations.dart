import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ky.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ky'),
    Locale('ru'),
  ];

  /// Кнопка переключения языка
  ///
  /// In ru, this message translates to:
  /// **'Рус'**
  String get languageButton;

  /// No description provided for @navigationHome.
  ///
  /// In ru, this message translates to:
  /// **'Главная'**
  String get navigationHome;

  /// No description provided for @navigationMobileApps.
  ///
  /// In ru, this message translates to:
  /// **'Мобильные приложения'**
  String get navigationMobileApps;

  /// No description provided for @navigationAbout.
  ///
  /// In ru, this message translates to:
  /// **'О проекте'**
  String get navigationAbout;

  /// No description provided for @navigationContact.
  ///
  /// In ru, this message translates to:
  /// **'Обратная связь'**
  String get navigationContact;

  /// No description provided for @aboutTitle.
  ///
  /// In ru, this message translates to:
  /// **'О проекте'**
  String get aboutTitle;

  /// No description provided for @aboutItem1.
  ///
  /// In ru, this message translates to:
  /// **'\"Поводырь\" — это сайт, объединяющий цифровые решения для незрячих и слабовидящих людей, которые помогают ориентироваться в пространстве, вести активный образ жизни и быть самостоятельными в повседневной жизни.'**
  String get aboutItem1;

  /// No description provided for @aboutItem2.
  ///
  /// In ru, this message translates to:
  /// **'Этот сайт не является официальным ресурсом мобильных приложений и не связан с их разработчиками. Все названия, логотипы, товарные знаки и прочие обозначения, упомянутые на сайте, принадлежат их соответствующим правообладателям. Информация, размещённая на сайте, предоставляется исключительно в ознакомительных целях и основана на личном опыте использования приложения.'**
  String get aboutItem2;

  /// No description provided for @aboutItem3.
  ///
  /// In ru, this message translates to:
  /// **'Цель проекта — облегчить доступ к проверенным и полезным цифровым инструментам, которые действительно работают и учитывают потребности незрячих пользователей.'**
  String get aboutItem3;

  /// No description provided for @aboutItem4.
  ///
  /// In ru, this message translates to:
  /// **'Если вы являетесь владельцем прав на материалы, размещённые на сайте, и считаете, что они используются ненадлежащим образом, пожалуйста, свяжитесь с нами для оперативного урегулирования вопроса.'**
  String get aboutItem4;

  /// No description provided for @contactTitle.
  ///
  /// In ru, this message translates to:
  /// **'Связаться с нами'**
  String get contactTitle;

  /// No description provided for @contactSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Оставьте сообщение, и мы свяжемся с вами в ближайшее время'**
  String get contactSubtitle;

  /// No description provided for @contactNameLabel.
  ///
  /// In ru, this message translates to:
  /// **'Имя'**
  String get contactNameLabel;

  /// No description provided for @contactEmailLabel.
  ///
  /// In ru, this message translates to:
  /// **'Email'**
  String get contactEmailLabel;

  /// No description provided for @contactMessageLabel.
  ///
  /// In ru, this message translates to:
  /// **'Сообщение'**
  String get contactMessageLabel;

  /// No description provided for @contactConsentText.
  ///
  /// In ru, this message translates to:
  /// **'Я согласен на обработку персональных данных'**
  String get contactConsentText;

  /// No description provided for @contactSendButton.
  ///
  /// In ru, this message translates to:
  /// **'Отправить'**
  String get contactSendButton;

  /// No description provided for @contactSocialTitle.
  ///
  /// In ru, this message translates to:
  /// **'Подписывайтесь на нас!'**
  String get contactSocialTitle;

  /// No description provided for @beMyEyesInfoText.
  ///
  /// In ru, this message translates to:
  /// **'Be My Eyes — это бесплатное мобильное приложение, которое соединяет незрячих и слабовидящих людей с волонтёрами со всего мира для получения зрительной помощи через видеозвонок. Пользователь запускает приложение, и волонтёр в режиме реального времени помогает ему, например, прочитать надпись, распознать предмет или найти нужную вещь.'**
  String get beMyEyesInfoText;

  /// No description provided for @beMyEyesTitle.
  ///
  /// In ru, this message translates to:
  /// **'Be My Eyes — это бесплатное мобильное приложение, созданное для поддержки незрячих и слабовидящих людей.'**
  String get beMyEyesTitle;

  /// No description provided for @beMyEyesSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Оно работает по принципу видеосвязи, соединяя пользователей с волонтёрами или сотрудниками компаний, чтобы помочь в решении визуальных задач в реальном времени'**
  String get beMyEyesSubtitle;

  /// No description provided for @beMyEyesBadge1.
  ///
  /// In ru, this message translates to:
  /// **'Помощь волонтёров'**
  String get beMyEyesBadge1;

  /// No description provided for @beMyEyesBadge2.
  ///
  /// In ru, this message translates to:
  /// **'Специализированная поддержка'**
  String get beMyEyesBadge2;

  /// No description provided for @beMyEyesBadge3.
  ///
  /// In ru, this message translates to:
  /// **'Мгновенное соединение'**
  String get beMyEyesBadge3;

  /// No description provided for @beMyEyesBadge4.
  ///
  /// In ru, this message translates to:
  /// **'Поддержка многих языков'**
  String get beMyEyesBadge4;

  /// No description provided for @beMyEyesFeature1Title.
  ///
  /// In ru, this message translates to:
  /// **'Помощь волонтёров'**
  String get beMyEyesFeature1Title;

  /// No description provided for @beMyEyesFeature1Subtitle.
  ///
  /// In ru, this message translates to:
  /// **'При нажатии одной кнопки пользователь соединяется с доступным добровольцем, который видит изображение с камеры и даёт устные инструкции'**
  String get beMyEyesFeature1Subtitle;

  /// No description provided for @beMyEyesFeature2Title.
  ///
  /// In ru, this message translates to:
  /// **'Специализированная поддержка'**
  String get beMyEyesFeature2Title;

  /// No description provided for @beMyEyesFeature2Subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Возможность связаться напрямую с представителями компаний (Microsoft, Google и др.) для получения консультации'**
  String get beMyEyesFeature2Subtitle;

  /// No description provided for @beMyEyesFeature3Title.
  ///
  /// In ru, this message translates to:
  /// **'Мгновенное соединение'**
  String get beMyEyesFeature3Title;

  /// No description provided for @beMyEyesFeature3Subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Благодаря большому числу волонтёров по всему миру, звонки обычно принимаются за несколько секунд'**
  String get beMyEyesFeature3Subtitle;

  /// No description provided for @beMyEyesFeature4Title.
  ///
  /// In ru, this message translates to:
  /// **'Поддержка многих языков'**
  String get beMyEyesFeature4Title;

  /// No description provided for @beMyEyesFeature4Subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Приложение работает на более чем 180 языках'**
  String get beMyEyesFeature4Subtitle;

  /// No description provided for @beMyEyesExample1Title.
  ///
  /// In ru, this message translates to:
  /// **'Срок годности'**
  String get beMyEyesExample1Title;

  /// No description provided for @beMyEyesExample1Subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Прочитать срок годности на упаковке'**
  String get beMyEyesExample1Subtitle;

  /// No description provided for @beMyEyesExample2Title.
  ///
  /// In ru, this message translates to:
  /// **'Определение цвета одежды'**
  String get beMyEyesExample2Title;

  /// No description provided for @beMyEyesExample2Subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Помогает понять цвет одежды'**
  String get beMyEyesExample2Subtitle;

  /// No description provided for @beMyEyesExample3Title.
  ///
  /// In ru, this message translates to:
  /// **'Ориентирование в помещении'**
  String get beMyEyesExample3Title;

  /// No description provided for @beMyEyesExample3Subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Помощь в передвижении и распознавании окружения'**
  String get beMyEyesExample3Subtitle;

  /// No description provided for @beMyEyesExample4Title.
  ///
  /// In ru, this message translates to:
  /// **'Проверка надписей'**
  String get beMyEyesExample4Title;

  /// No description provided for @beMyEyesExample4Subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Определяет текст на табличках или экранах'**
  String get beMyEyesExample4Subtitle;

  /// No description provided for @accessibilityTitle1.
  ///
  /// In ru, this message translates to:
  /// **'Совместимость с экранными дикторами'**
  String get accessibilityTitle1;

  /// No description provided for @accessibilityTitle2.
  ///
  /// In ru, this message translates to:
  /// **'Рекомендации'**
  String get accessibilityTitle2;

  /// No description provided for @accessibilityData1.
  ///
  /// In ru, this message translates to:
  /// **'TalkBack (Android)'**
  String get accessibilityData1;

  /// No description provided for @accessibilityData2.
  ///
  /// In ru, this message translates to:
  /// **'VoiceOver (iOS)'**
  String get accessibilityData2;

  /// No description provided for @accessibilityData3.
  ///
  /// In ru, this message translates to:
  /// **'Все кнопки и меню имеют текстовые метки для озвучивания.'**
  String get accessibilityData3;

  /// No description provided for @accessibilityData4.
  ///
  /// In ru, this message translates to:
  /// **'Возможность работы только по звуку, без необходимости смотреть на экран.'**
  String get accessibilityData4;

  /// No description provided for @accessibilityData5.
  ///
  /// In ru, this message translates to:
  /// **'Поддержка пошаговых голосовых инструкций с указанием расстояний и направлений.'**
  String get accessibilityData5;

  /// No description provided for @accessibilityData6.
  ///
  /// In ru, this message translates to:
  /// **'Для незрячих пользователей рекомендуется включить экранный диктор (TalkBack или VoiceOver) перед первым использованием.'**
  String get accessibilityData6;

  /// No description provided for @accessibilityData7.
  ///
  /// In ru, this message translates to:
  /// **'В разделе Настройки → Доступность можно включить крупные элементы интерфейса и улучшенное озвучивание.'**
  String get accessibilityData7;

  /// No description provided for @prosTitle.
  ///
  /// In ru, this message translates to:
  /// **'Плюсы'**
  String get prosTitle;

  /// No description provided for @consTitle.
  ///
  /// In ru, this message translates to:
  /// **'Минусы'**
  String get consTitle;

  /// No description provided for @prosData1.
  ///
  /// In ru, this message translates to:
  /// **'Бесплатная базовая версия.'**
  String get prosData1;

  /// No description provided for @prosData2.
  ///
  /// In ru, this message translates to:
  /// **'Работает офлайн.'**
  String get prosData2;

  /// No description provided for @prosData3.
  ///
  /// In ru, this message translates to:
  /// **'Очень детальные карты.'**
  String get prosData3;

  /// No description provided for @prosData4.
  ///
  /// In ru, this message translates to:
  /// **'Гибкие настройки для адаптации под потребности пользователя.'**
  String get prosData4;

  /// No description provided for @consData1.
  ///
  /// In ru, this message translates to:
  /// **'Интерфейс может показаться сложным при первом знакомстве.'**
  String get consData1;

  /// No description provided for @consData2.
  ///
  /// In ru, this message translates to:
  /// **'Требуется время на освоение и настройку голосовых подсказок.'**
  String get consData2;

  /// No description provided for @installAndroidTitle.
  ///
  /// In ru, this message translates to:
  /// **'Установка на Android'**
  String get installAndroidTitle;

  /// No description provided for @installIOSTitle.
  ///
  /// In ru, this message translates to:
  /// **'Установка на iPhone'**
  String get installIOSTitle;

  /// No description provided for @installAndroidData1.
  ///
  /// In ru, this message translates to:
  /// **'Откройте приложение Google Play на телефоне.'**
  String get installAndroidData1;

  /// No description provided for @installAndroidData2.
  ///
  /// In ru, this message translates to:
  /// **'В строке поиска вверху введите: Be My Eyes (можно написать по-английски).'**
  String get installAndroidData2;

  /// No description provided for @installAndroidData3.
  ///
  /// In ru, this message translates to:
  /// **'Найдите значок приложения — синяя иконка, солнце.'**
  String get installAndroidData3;

  /// No description provided for @installAndroidData4.
  ///
  /// In ru, this message translates to:
  /// **'Нажмите кнопку Установить.'**
  String get installAndroidData4;

  /// No description provided for @installAndroidData5.
  ///
  /// In ru, this message translates to:
  /// **'Дождитесь окончания загрузки и установки.'**
  String get installAndroidData5;

  /// No description provided for @installAndroidData6.
  ///
  /// In ru, this message translates to:
  /// **'После установки нажмите Открыть.'**
  String get installAndroidData6;

  /// No description provided for @installIOSData1.
  ///
  /// In ru, this message translates to:
  /// **'Откройте приложение App Store.'**
  String get installIOSData1;

  /// No description provided for @installIOSData2.
  ///
  /// In ru, this message translates to:
  /// **'Введите в поиске: Be My Eyes.'**
  String get installIOSData2;

  /// No description provided for @installIOSData3.
  ///
  /// In ru, this message translates to:
  /// **'Найдите синюю иконку с белыми силуэтами двух людей.'**
  String get installIOSData3;

  /// No description provided for @installIOSData4.
  ///
  /// In ru, this message translates to:
  /// **'Нажмите Загрузить (значок облака или кнопка \"Get\").'**
  String get installIOSData4;

  /// No description provided for @installIOSData5.
  ///
  /// In ru, this message translates to:
  /// **'Подтвердите установку с помощью Face ID, Touch ID или пароля Apple ID.'**
  String get installIOSData5;

  /// No description provided for @installIOSData6.
  ///
  /// In ru, this message translates to:
  /// **'После установки нажмите Открыть.'**
  String get installIOSData6;

  /// No description provided for @howToUse1Title.
  ///
  /// In ru, this message translates to:
  /// **'📞 Запрос помощи у волонтёра'**
  String get howToUse1Title;

  /// No description provided for @howToUse1Subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Как связаться с добровольным помощником.'**
  String get howToUse1Subtitle;

  /// No description provided for @howToUse1Data1.
  ///
  /// In ru, this message translates to:
  /// **'Откройте приложение.'**
  String get howToUse1Data1;

  /// No description provided for @howToUse1Data2.
  ///
  /// In ru, this message translates to:
  /// **'На главном экране будет большая кнопка Позвонить волонтёру.'**
  String get howToUse1Data2;

  /// No description provided for @howToUse1Data3.
  ///
  /// In ru, this message translates to:
  /// **'Нажмите её — приложение автоматически соединит вас с доступным помощником.'**
  String get howToUse1Data3;

  /// No description provided for @howToUse1Data4.
  ///
  /// In ru, this message translates to:
  /// **'После соединения волонтёр увидит изображение с вашей камеры и сможет подсказать, что он видит.'**
  String get howToUse1Data4;

  /// No description provided for @howToUse1Data5.
  ///
  /// In ru, this message translates to:
  /// **'Чтобы завершить звонок, нажмите красную кнопку Завершить.'**
  String get howToUse1Data5;

  /// No description provided for @howToUse2Title.
  ///
  /// In ru, this message translates to:
  /// **'🏢 Запрос помощи от компаний'**
  String get howToUse2Title;

  /// No description provided for @howToUse2Subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Связь со специалистами компаний-партнёров.'**
  String get howToUse2Subtitle;

  /// No description provided for @howToUse2Data1.
  ///
  /// In ru, this message translates to:
  /// **'На главном экране пролистайте вниз до раздела Специализированная помощь.'**
  String get howToUse2Data1;

  /// No description provided for @howToUse2Data2.
  ///
  /// In ru, this message translates to:
  /// **'Здесь будут кнопки с названиями компаний (например, Microsoft, Google и т.д.).'**
  String get howToUse2Data2;

  /// No description provided for @howToUse2Data3.
  ///
  /// In ru, this message translates to:
  /// **'Нажмите на нужную компанию — и вы свяжетесь с их специалистом.'**
  String get howToUse2Data3;

  /// No description provided for @tipsTitle.
  ///
  /// In ru, this message translates to:
  /// **'💡 Полезные советы'**
  String get tipsTitle;

  /// No description provided for @tipsSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Что поможет сделать звонок удобнее и эффективнее.'**
  String get tipsSubtitle;

  /// No description provided for @tipsData1.
  ///
  /// In ru, this message translates to:
  /// **'📡 Интернет обязателен — без стабильного соединения видеозвонок не получится.'**
  String get tipsData1;

  /// No description provided for @tipsData2.
  ///
  /// In ru, this message translates to:
  /// **'💡 Держите камеру так, чтобы волонтёр видел объект чётко и при хорошем освещении.'**
  String get tipsData2;

  /// No description provided for @tipsData3.
  ///
  /// In ru, this message translates to:
  /// **'🔊 Используйте наушники с микрофоном для более удобного общения.'**
  String get tipsData3;

  /// No description provided for @tipsData4.
  ///
  /// In ru, this message translates to:
  /// **'🌐 Приложение работает круглосуточно, и волонтёры могут подключиться из любой точки мира.'**
  String get tipsData4;

  /// No description provided for @screenReaderTitle.
  ///
  /// In ru, this message translates to:
  /// **'♿ Совместимость с экранными читателями'**
  String get screenReaderTitle;

  /// No description provided for @screenReaderSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Удобство использования для незрячих и слабовидящих.'**
  String get screenReaderSubtitle;

  /// No description provided for @screenReaderData1.
  ///
  /// In ru, this message translates to:
  /// **'TalkBack на Android.'**
  String get screenReaderData1;

  /// No description provided for @screenReaderData2.
  ///
  /// In ru, this message translates to:
  /// **'VoiceOver на iOS.'**
  String get screenReaderData2;

  /// No description provided for @screenReaderData3.
  ///
  /// In ru, this message translates to:
  /// **'Все кнопки имеют текстовые метки, что делает использование доступным для людей с нарушением зрения.'**
  String get screenReaderData3;

  /// No description provided for @homeTitle.
  ///
  /// In ru, this message translates to:
  /// **'Добро пожаловать в Поводырь! К самостоятельной жизни через технологии'**
  String get homeTitle;

  /// No description provided for @homeSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'САЙТ О ЦИФРОВЫХ ПРОДУКТАХ ДЛЯ НЕЗРЯЧИХ И ЛЮДЕЙ С НАРУШЕНИЕМ ЗРЕНИЯ С ПОДРОБНЫМИ ИНСТРУКЦИЯМИ'**
  String get homeSubtitle;

  /// No description provided for @mobileAppsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Мобильные приложения'**
  String get mobileAppsTitle;

  /// No description provided for @mobileAppsSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Полезные приложения для незрячих и слабовидящих пользователей'**
  String get mobileAppsSubtitle;

  /// No description provided for @osmAndInfoText.
  ///
  /// In ru, this message translates to:
  /// **'OsmAnd — это офлайн-картографическое приложение с голосовой навигацией, которое позволяет ориентироваться без подключения к интернету. Оно поддерживает подробные карты, маршруты для пешеходов, автомобилистов и велосипедистов, а также совместимо с экранными дикторами, что делает его удобным для незрячих пользователей.'**
  String get osmAndInfoText;

  /// No description provided for @osmAndTitle.
  ///
  /// In ru, this message translates to:
  /// **'OsmAnd — мощная офлайн-навигация'**
  String get osmAndTitle;

  /// No description provided for @osmAndSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'OsmAnd — это мощное офлайн-навигационное приложение, построенное на базе карт проекта OpenStreetMap. Оно позволяет ориентироваться без интернета и предлагает гибкие настройки, включая функции, полезные для людей с нарушением зрения.'**
  String get osmAndSubtitle;

  /// No description provided for @osmAndBadge1.
  ///
  /// In ru, this message translates to:
  /// **'Полностью офлайн'**
  String get osmAndBadge1;

  /// No description provided for @osmAndBadge2.
  ///
  /// In ru, this message translates to:
  /// **'Голосовое сопровождение'**
  String get osmAndBadge2;

  /// No description provided for @osmAndBadge3.
  ///
  /// In ru, this message translates to:
  /// **'Пешие • Велосипед • Авто • ОТ'**
  String get osmAndBadge3;

  /// No description provided for @osmAndBadge4.
  ///
  /// In ru, this message translates to:
  /// **'Детальные карты и POI'**
  String get osmAndBadge4;

  /// No description provided for @osmAndFeature1Title.
  ///
  /// In ru, this message translates to:
  /// **'Офлайн навигация'**
  String get osmAndFeature1Title;

  /// No description provided for @osmAndFeature1Subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Работает без интернета с загруженными картами'**
  String get osmAndFeature1Subtitle;

  /// No description provided for @osmAndFeature2Title.
  ///
  /// In ru, this message translates to:
  /// **'Голосовое сопровождение'**
  String get osmAndFeature2Title;

  /// No description provided for @osmAndFeature2Subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Подробные голосовые инструкции на русском языке'**
  String get osmAndFeature2Subtitle;

  /// No description provided for @osmAndFeature3Title.
  ///
  /// In ru, this message translates to:
  /// **'Множество типов маршрутов'**
  String get osmAndFeature3Title;

  /// No description provided for @osmAndFeature3Subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Пешие, велосипедные, автомобильные и общественный транспорт'**
  String get osmAndFeature3Subtitle;

  /// No description provided for @osmAndFeature4Title.
  ///
  /// In ru, this message translates to:
  /// **'Детальные карты'**
  String get osmAndFeature4Title;

  /// No description provided for @osmAndFeature4Subtitle.
  ///
  /// In ru, this message translates to:
  /// **'POI, адреса, названия улиц и достопримечательности'**
  String get osmAndFeature4Subtitle;

  /// No description provided for @osmAndFeature5Title.
  ///
  /// In ru, this message translates to:
  /// **'Доступность'**
  String get osmAndFeature5Title;

  /// No description provided for @osmAndFeature5Subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Специальные функции для людей с нарушением зрения'**
  String get osmAndFeature5Subtitle;

  /// No description provided for @osmAndFeature6Title.
  ///
  /// In ru, this message translates to:
  /// **'Кастомизация'**
  String get osmAndFeature6Title;

  /// No description provided for @osmAndFeature6Subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Гибкие настройки интерфейса и маршрутизации'**
  String get osmAndFeature6Subtitle;

  /// No description provided for @osmAndExample1Title.
  ///
  /// In ru, this message translates to:
  /// **'Пешая навигация'**
  String get osmAndExample1Title;

  /// No description provided for @osmAndExample1Subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Удобная навигация в незнакомом районе'**
  String get osmAndExample1Subtitle;

  /// No description provided for @osmAndExample2Title.
  ///
  /// In ru, this message translates to:
  /// **'Маршруты для пешеходов'**
  String get osmAndExample2Title;

  /// No description provided for @osmAndExample2Subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Построение маршрута с учётом тротуаров и пешеходных переходов'**
  String get osmAndExample2Subtitle;

  /// No description provided for @osmAndExample3Title.
  ///
  /// In ru, this message translates to:
  /// **'Ориентация на остановках и в парках'**
  String get osmAndExample3Title;

  /// No description provided for @osmAndExample3Subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Помогает найти путь в местах отдыха и на транспорте'**
  String get osmAndExample3Subtitle;

  /// No description provided for @osmAndExample4Title.
  ///
  /// In ru, this message translates to:
  /// **'Поиск объектов'**
  String get osmAndExample4Title;

  /// No description provided for @osmAndExample4Subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Магазины, кафе, аптеки и другие места поблизости'**
  String get osmAndExample4Subtitle;

  /// No description provided for @osmAndInstallAndroidData1.
  ///
  /// In ru, this message translates to:
  /// **'Откройте приложение Google Play.'**
  String get osmAndInstallAndroidData1;

  /// No description provided for @osmAndInstallAndroidData2.
  ///
  /// In ru, this message translates to:
  /// **'Введите в поиске: OsmAnd (можно набрать «OsmAnd — Offline Maps»).'**
  String get osmAndInstallAndroidData2;

  /// No description provided for @osmAndInstallAndroidData3.
  ///
  /// In ru, this message translates to:
  /// **'Найдите иконку: синий квадрат с белой картой и оранжевым компасом.'**
  String get osmAndInstallAndroidData3;

  /// No description provided for @osmAndInstallAndroidData4.
  ///
  /// In ru, this message translates to:
  /// **'Нажмите Установить.'**
  String get osmAndInstallAndroidData4;

  /// No description provided for @osmAndInstallAndroidData5.
  ///
  /// In ru, this message translates to:
  /// **'После завершения загрузки нажмите Открыть.'**
  String get osmAndInstallAndroidData5;

  /// No description provided for @osmAndInstallIOSData1.
  ///
  /// In ru, this message translates to:
  /// **'Откройте App Store.'**
  String get osmAndInstallIOSData1;

  /// No description provided for @osmAndInstallIOSData2.
  ///
  /// In ru, this message translates to:
  /// **'В поиске введите: OsmAnd Maps.'**
  String get osmAndInstallIOSData2;

  /// No description provided for @osmAndInstallIOSData3.
  ///
  /// In ru, this message translates to:
  /// **'Найдите иконку с синим фоном и оранжевым компасом.'**
  String get osmAndInstallIOSData3;

  /// No description provided for @osmAndInstallIOSData4.
  ///
  /// In ru, this message translates to:
  /// **'Нажмите Загрузить.'**
  String get osmAndInstallIOSData4;

  /// No description provided for @osmAndInstallIOSData5.
  ///
  /// In ru, this message translates to:
  /// **'Подтвердите установку через Face ID, Touch ID или пароль Apple ID.'**
  String get osmAndInstallIOSData5;

  /// No description provided for @osmAndInstallIOSData6.
  ///
  /// In ru, this message translates to:
  /// **'Нажмите Открыть.'**
  String get osmAndInstallIOSData6;

  /// No description provided for @osmAndSetupTitle.
  ///
  /// In ru, this message translates to:
  /// **'Первоначальная настройка'**
  String get osmAndSetupTitle;

  /// No description provided for @osmAndSetupSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Выбор языка и разрешения для корректной работы приложения.'**
  String get osmAndSetupSubtitle;

  /// No description provided for @osmAndSetupData1.
  ///
  /// In ru, this message translates to:
  /// **'Язык — приложение автоматически подстроится под язык телефона. Можно изменить в настройках.'**
  String get osmAndSetupData1;

  /// No description provided for @osmAndSetupData2.
  ///
  /// In ru, this message translates to:
  /// **'Доступ к геолокации — обязателен для навигации.'**
  String get osmAndSetupData2;

  /// No description provided for @osmAndSetupData3.
  ///
  /// In ru, this message translates to:
  /// **'Доступ к памяти — нужен для хранения карт.'**
  String get osmAndSetupData3;

  /// No description provided for @osmAndSetupData4.
  ///
  /// In ru, this message translates to:
  /// **'При первом запуске приложение предложит скачать карту вашего региона.'**
  String get osmAndSetupData4;

  /// No description provided for @osmAndSetupData5.
  ///
  /// In ru, this message translates to:
  /// **'Для незрячих рекомендуется включить экранный диктор (TalkBack или VoiceOver).'**
  String get osmAndSetupData5;

  /// No description provided for @osmAndSearchTitle.
  ///
  /// In ru, this message translates to:
  /// **'📍 Поиск места'**
  String get osmAndSearchTitle;

  /// No description provided for @osmAndSearchSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Как найти нужный адрес или объект.'**
  String get osmAndSearchSubtitle;

  /// No description provided for @osmAndSearchData1.
  ///
  /// In ru, this message translates to:
  /// **'На главном экране нажмите Поиск.'**
  String get osmAndSearchData1;

  /// No description provided for @osmAndSearchData2.
  ///
  /// In ru, this message translates to:
  /// **'Введите адрес, название места или координаты.'**
  String get osmAndSearchData2;

  /// No description provided for @osmAndSearchData3.
  ///
  /// In ru, this message translates to:
  /// **'Выберите нужный вариант из списка.'**
  String get osmAndSearchData3;

  /// No description provided for @osmAndNavigationTitle.
  ///
  /// In ru, this message translates to:
  /// **'🗺 Запуск навигации'**
  String get osmAndNavigationTitle;

  /// No description provided for @osmAndNavigationSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Настройка маршрута и запуск голосовой навигации.'**
  String get osmAndNavigationSubtitle;

  /// No description provided for @osmAndNavigationData1.
  ///
  /// In ru, this message translates to:
  /// **'Выберите точку назначения и нажмите Маршрут.'**
  String get osmAndNavigationData1;

  /// No description provided for @osmAndNavigationData2.
  ///
  /// In ru, this message translates to:
  /// **'Выберите тип маршрута: Пешком / На транспорте / Велосипед.'**
  String get osmAndNavigationData2;

  /// No description provided for @osmAndNavigationData3.
  ///
  /// In ru, this message translates to:
  /// **'Нажмите Начать — начнётся голосовая навигация.'**
  String get osmAndNavigationData3;

  /// No description provided for @osmAndOfflineTitle.
  ///
  /// In ru, this message translates to:
  /// **'📥 Использование офлайн'**
  String get osmAndOfflineTitle;

  /// No description provided for @osmAndOfflineSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Работа без интернета с загруженными картами.'**
  String get osmAndOfflineSubtitle;

  /// No description provided for @osmAndOfflineData1.
  ///
  /// In ru, this message translates to:
  /// **'Скачайте нужные карты через Меню → Скачивание карт.'**
  String get osmAndOfflineData1;

  /// No description provided for @osmAndOfflineData2.
  ///
  /// In ru, this message translates to:
  /// **'Навигация будет работать полностью без сети.'**
  String get osmAndOfflineData2;

  /// No description provided for @tapTapSeeInfoText.
  ///
  /// In ru, this message translates to:
  /// **'Tap Tap See - это мобильное приложение для камеры, разработанное для слепых и слабовидящих пользователей. TapTapSee использует камеру вашего устройства и функции VoiceOver, чтобы сделать снимок или видео чего-либо и озвучить это для вас.'**
  String get tapTapSeeInfoText;

  /// No description provided for @tapTapSeeTitle.
  ///
  /// In ru, this message translates to:
  /// **'TapTapSee — это бесплатное мобильное приложение для iOS и Android'**
  String get tapTapSeeTitle;

  /// No description provided for @tapTapSeeSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'которое позволяет пользователям сфотографировать любой объект, а затем получить голосовое или текстовое описание того, что изображено на фото. Приложение особенно полезно для людей с нарушением зрения.'**
  String get tapTapSeeSubtitle;

  /// No description provided for @tapTapSeeBadge1.
  ///
  /// In ru, this message translates to:
  /// **'Распознавание объектов'**
  String get tapTapSeeBadge1;

  /// No description provided for @tapTapSeeBadge2.
  ///
  /// In ru, this message translates to:
  /// **'Определение цвета и формы'**
  String get tapTapSeeBadge2;

  /// No description provided for @tapTapSeeBadge3.
  ///
  /// In ru, this message translates to:
  /// **'Распознавание упаковок и товаров'**
  String get tapTapSeeBadge3;

  /// No description provided for @tapTapSeeBadge4.
  ///
  /// In ru, this message translates to:
  /// **'Чтение надписей (частично)'**
  String get tapTapSeeBadge4;

  /// No description provided for @tapTapSeeBadge5.
  ///
  /// In ru, this message translates to:
  /// **'История запросов'**
  String get tapTapSeeBadge5;

  /// No description provided for @tapTapSeeBadge6.
  ///
  /// In ru, this message translates to:
  /// **'Фронтальная и задняя камеры'**
  String get tapTapSeeBadge6;

  /// No description provided for @tapTapSeeBadge7.
  ///
  /// In ru, this message translates to:
  /// **'Совместимость с экранными дикторами (VoiceOver, TalkBack)'**
  String get tapTapSeeBadge7;

  /// No description provided for @tapTapSeeFeature1Title.
  ///
  /// In ru, this message translates to:
  /// **'Распознавание объектов'**
  String get tapTapSeeFeature1Title;

  /// No description provided for @tapTapSeeFeature1Subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Фотографируете предмет — приложение озвучивает, что на фото'**
  String get tapTapSeeFeature1Subtitle;

  /// No description provided for @tapTapSeeFeature2Title.
  ///
  /// In ru, this message translates to:
  /// **'Определение цвета и формы'**
  String get tapTapSeeFeature2Title;

  /// No description provided for @tapTapSeeFeature2Subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Помогает понять цвет одежды, фруктов, упаковок'**
  String get tapTapSeeFeature2Subtitle;

  /// No description provided for @tapTapSeeFeature3Title.
  ///
  /// In ru, this message translates to:
  /// **'Распознавание упаковок и товаров'**
  String get tapTapSeeFeature3Title;

  /// No description provided for @tapTapSeeFeature3Subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Может различать продукты, лекарства, бытовые вещи'**
  String get tapTapSeeFeature3Subtitle;

  /// No description provided for @tapTapSeeFeature4Title.
  ///
  /// In ru, this message translates to:
  /// **'Чтение надписей (частично)'**
  String get tapTapSeeFeature4Title;

  /// No description provided for @tapTapSeeFeature4Subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Иногда определяет текст на упаковках или этикетках'**
  String get tapTapSeeFeature4Subtitle;

  /// No description provided for @tapTapSeeFeature5Title.
  ///
  /// In ru, this message translates to:
  /// **'История запросов'**
  String get tapTapSeeFeature5Title;

  /// No description provided for @tapTapSeeFeature5Subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Можно вернуться к результатам предыдущих фото'**
  String get tapTapSeeFeature5Subtitle;

  /// No description provided for @tapTapSeeFeature6Title.
  ///
  /// In ru, this message translates to:
  /// **'Фронтальная и задняя камеры'**
  String get tapTapSeeFeature6Title;

  /// No description provided for @tapTapSeeFeature6Subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Удобно для проверки одежды или селфи'**
  String get tapTapSeeFeature6Subtitle;

  /// No description provided for @tapTapSeeFeature7Title.
  ///
  /// In ru, this message translates to:
  /// **'Совместимость с экранными дикторами'**
  String get tapTapSeeFeature7Title;

  /// No description provided for @tapTapSeeFeature7Subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Поддержка VoiceOver и TalkBack, автоматическое озвучивание результатов'**
  String get tapTapSeeFeature7Subtitle;

  /// No description provided for @tapTapSeeExample1Title.
  ///
  /// In ru, this message translates to:
  /// **'Распознавание объектов'**
  String get tapTapSeeExample1Title;

  /// No description provided for @tapTapSeeExample1Subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Сфотографируйте предмет, и приложение озвучит, что изображено на фото'**
  String get tapTapSeeExample1Subtitle;

  /// No description provided for @tapTapSeeExample2Title.
  ///
  /// In ru, this message translates to:
  /// **'Определение цвета'**
  String get tapTapSeeExample2Title;

  /// No description provided for @tapTapSeeExample2Subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Помогает определить цвет одежды или предметов вокруг'**
  String get tapTapSeeExample2Subtitle;

  /// No description provided for @tapTapSeeExample3Title.
  ///
  /// In ru, this message translates to:
  /// **'Распознавание упаковок'**
  String get tapTapSeeExample3Title;

  /// No description provided for @tapTapSeeExample3Subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Идентификация продуктов, лекарств и бытовых вещей'**
  String get tapTapSeeExample3Subtitle;

  /// No description provided for @tapTapSeeExample4Title.
  ///
  /// In ru, this message translates to:
  /// **'История запросов'**
  String get tapTapSeeExample4Title;

  /// No description provided for @tapTapSeeExample4Subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Доступ к результатам предыдущих фотографий'**
  String get tapTapSeeExample4Subtitle;

  /// No description provided for @tapTapSeeInstallIOSData1.
  ///
  /// In ru, this message translates to:
  /// **'Откройте App Store.'**
  String get tapTapSeeInstallIOSData1;

  /// No description provided for @tapTapSeeInstallIOSData2.
  ///
  /// In ru, this message translates to:
  /// **'В строке поиска введите TapTapSee.'**
  String get tapTapSeeInstallIOSData2;

  /// No description provided for @tapTapSeeInstallIOSData3.
  ///
  /// In ru, this message translates to:
  /// **'Найдите приложение с иконкой и нажмите Загрузить.'**
  String get tapTapSeeInstallIOSData3;

  /// No description provided for @tapTapSeeInstallIOSData4.
  ///
  /// In ru, this message translates to:
  /// **'После установки приложение появится на главном экране.'**
  String get tapTapSeeInstallIOSData4;

  /// No description provided for @tapTapSeeInstallAndroidData1.
  ///
  /// In ru, this message translates to:
  /// **'Откройте Google Play Маркет.'**
  String get tapTapSeeInstallAndroidData1;

  /// No description provided for @tapTapSeeInstallAndroidData2.
  ///
  /// In ru, this message translates to:
  /// **'В строке поиска введите TapTapSee.'**
  String get tapTapSeeInstallAndroidData2;

  /// No description provided for @tapTapSeeInstallAndroidData3.
  ///
  /// In ru, this message translates to:
  /// **'Выберите приложение и нажмите Установить.'**
  String get tapTapSeeInstallAndroidData3;

  /// No description provided for @tapTapSeeInstallAndroidData4.
  ///
  /// In ru, this message translates to:
  /// **'После завершения установки откройте его из меню приложений.'**
  String get tapTapSeeInstallAndroidData4;

  /// No description provided for @tapTapSeePhotoTitle.
  ///
  /// In ru, this message translates to:
  /// **'📸 Определение предмета'**
  String get tapTapSeePhotoTitle;

  /// No description provided for @tapTapSeePhotoSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Как сделать фото для распознавания объекта.'**
  String get tapTapSeePhotoSubtitle;

  /// No description provided for @tapTapSeePhotoData1.
  ///
  /// In ru, this message translates to:
  /// **'Наведите камеру телефона на предмет, который хотите определить.'**
  String get tapTapSeePhotoData1;

  /// No description provided for @tapTapSeePhotoData2.
  ///
  /// In ru, this message translates to:
  /// **'Не обязательно точно наводить — приложение автоматически центрирует объект.'**
  String get tapTapSeePhotoData2;

  /// No description provided for @tapTapSeePhotoData3.
  ///
  /// In ru, this message translates to:
  /// **'Нажмите кнопку съемки (в центре экрана внизу).'**
  String get tapTapSeePhotoData3;

  /// No description provided for @tapTapSeePhotoData4.
  ///
  /// In ru, this message translates to:
  /// **'Подождите несколько секунд.'**
  String get tapTapSeePhotoData4;

  /// No description provided for @tapTapSeePhotoData5.
  ///
  /// In ru, this message translates to:
  /// **'Приложение озвучит результат (например: «зелёная пластиковая бутылка», «красное яблоко»).'**
  String get tapTapSeePhotoData5;

  /// No description provided for @tapTapSeeWhatTitle.
  ///
  /// In ru, this message translates to:
  /// **'👉 Что можно фотографировать'**
  String get tapTapSeeWhatTitle;

  /// No description provided for @tapTapSeeWhatSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Примеры объектов для распознавания.'**
  String get tapTapSeeWhatSubtitle;

  /// No description provided for @tapTapSeeWhatData1.
  ///
  /// In ru, this message translates to:
  /// **'Упаковки продуктов и лекарств.'**
  String get tapTapSeeWhatData1;

  /// No description provided for @tapTapSeeWhatData2.
  ///
  /// In ru, this message translates to:
  /// **'Банкноты и монеты.'**
  String get tapTapSeeWhatData2;

  /// No description provided for @tapTapSeeWhatData3.
  ///
  /// In ru, this message translates to:
  /// **'Цвет одежды.'**
  String get tapTapSeeWhatData3;

  /// No description provided for @tapTapSeeWhatData4.
  ///
  /// In ru, this message translates to:
  /// **'Надписи и текст (частично).'**
  String get tapTapSeeWhatData4;

  /// No description provided for @tapTapSeeWhatData5.
  ///
  /// In ru, this message translates to:
  /// **'Окружающие объекты.'**
  String get tapTapSeeWhatData5;

  /// No description provided for @tapTapSeeExtraTitle.
  ///
  /// In ru, this message translates to:
  /// **'⚙️ Дополнительные функции'**
  String get tapTapSeeExtraTitle;

  /// No description provided for @tapTapSeeExtraSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Полезные возможности приложения.'**
  String get tapTapSeeExtraSubtitle;

  /// No description provided for @tapTapSeeExtraData1.
  ///
  /// In ru, this message translates to:
  /// **'Съёмка с фронтальной камеры — удобно для определения цвета одежды или макияжа.'**
  String get tapTapSeeExtraData1;

  /// No description provided for @tapTapSeeExtraData2.
  ///
  /// In ru, this message translates to:
  /// **'История распознаваний — приложение сохраняет описания, чтобы вы могли к ним вернуться.'**
  String get tapTapSeeExtraData2;

  /// No description provided for @tapTapSeeExtraData3.
  ///
  /// In ru, this message translates to:
  /// **'Многоязычная поддержка — описания могут быть доступны на английском и других языках, в зависимости от версии.'**
  String get tapTapSeeExtraData3;

  /// No description provided for @tapTapSeeTipsTitle.
  ///
  /// In ru, this message translates to:
  /// **'💡 Советы по эффективному использованию'**
  String get tapTapSeeTipsTitle;

  /// No description provided for @tapTapSeeTipsSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Что поможет получить более точные результаты.'**
  String get tapTapSeeTipsSubtitle;

  /// No description provided for @tapTapSeeTipsData1.
  ///
  /// In ru, this message translates to:
  /// **'Держите телефон на расстоянии 20–40 см от объекта.'**
  String get tapTapSeeTipsData1;

  /// No description provided for @tapTapSeeTipsData2.
  ///
  /// In ru, this message translates to:
  /// **'Старайтесь, чтобы на предмет падал хороший свет.'**
  String get tapTapSeeTipsData2;

  /// No description provided for @tapTapSeeTipsData3.
  ///
  /// In ru, this message translates to:
  /// **'Если описание неточное, попробуйте сфотографировать под другим углом.'**
  String get tapTapSeeTipsData3;

  /// No description provided for @tapTapSeeTipsData4.
  ///
  /// In ru, this message translates to:
  /// **'Для мелкого текста лучше использовать специальные OCR-приложения (например Seeing AI), но TapTapSee иногда тоже распознаёт.'**
  String get tapTapSeeTipsData4;

  /// No description provided for @footerDescription.
  ///
  /// In ru, this message translates to:
  /// **'Сайт \"Поводырь\" создан в рамках проекта \"Цифровые решения для незрячих и слабовидящих людей\" при поддержке'**
  String get footerDescription;

  /// No description provided for @footerProjectName.
  ///
  /// In ru, this message translates to:
  /// **'\"Поводырь\"'**
  String get footerProjectName;

  /// No description provided for @footerDescriptionEnd.
  ///
  /// In ru, this message translates to:
  /// **' и направлен на облегчение доступа к проверенным цифровым инструментам.'**
  String get footerDescriptionEnd;

  /// No description provided for @detailNavigationHome.
  ///
  /// In ru, this message translates to:
  /// **'Главная'**
  String get detailNavigationHome;

  /// No description provided for @detailNavigationFAQ.
  ///
  /// In ru, this message translates to:
  /// **'Часто задаваемые вопросы'**
  String get detailNavigationFAQ;

  /// No description provided for @detailNavigationPartners.
  ///
  /// In ru, this message translates to:
  /// **'Партнеры'**
  String get detailNavigationPartners;

  /// No description provided for @detailMainFeatures.
  ///
  /// In ru, this message translates to:
  /// **'Основные возможности'**
  String get detailMainFeatures;

  /// No description provided for @detailAdvantages.
  ///
  /// In ru, this message translates to:
  /// **'Преимущества'**
  String get detailAdvantages;

  /// No description provided for @detailUsageExamples.
  ///
  /// In ru, this message translates to:
  /// **'Примеры использование'**
  String get detailUsageExamples;

  /// No description provided for @detailProsAndCons.
  ///
  /// In ru, this message translates to:
  /// **'Минусы и Плюсы'**
  String get detailProsAndCons;

  /// No description provided for @detailInstallationGuide.
  ///
  /// In ru, this message translates to:
  /// **'Инструкция по установку и использованию'**
  String get detailInstallationGuide;

  /// No description provided for @detailHowToUse.
  ///
  /// In ru, this message translates to:
  /// **'Как пользоваться'**
  String get detailHowToUse;

  /// No description provided for @footerDisclaimer.
  ///
  /// In ru, this message translates to:
  /// **'Информация, размещённая на сайте, предоставляется исключительно в ознакомительных целях и основана на личном опыте использования приложений.'**
  String get footerDisclaimer;

  /// No description provided for @downloadAppStore.
  ///
  /// In ru, this message translates to:
  /// **'App Store'**
  String get downloadAppStore;

  /// No description provided for @downloadGooglePlay.
  ///
  /// In ru, this message translates to:
  /// **'Google Play'**
  String get downloadGooglePlay;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ky', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ky':
      return AppLocalizationsKy();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

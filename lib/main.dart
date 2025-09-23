import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:device_preview/device_preview.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:website1/fetaure/screens/navigation_screen.dart';
import 'l10n/app_localizations.dart';
import 'core/providers/locale_provider.dart';
import 'core/helpers/announce_helper.dart';
import 'fetaure/widget/semantic_text_widget.dart';
import 'fetaure/providers/contact_form_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Инициализируем AnnounceHelper для Web
  AnnounceHelper.initialize();

  runApp(
    DevicePreview(
      enabled: true, // Включен для разработки
      builder: (context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LocaleProvider()),
          ChangeNotifierProvider(create: (_) => ContactFormProvider()),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleProvider>(
      builder: (context, localeProvider, child) {
        // Инициализация провайдера при первом запуске
        WidgetsBinding.instance.addPostFrameCallback((_) {
          localeProvider.initialize();
        });

        final base = ThemeData.light();
        return MaterialApp(
          locale: localeProvider.currentLocale,
          builder: DevicePreview.appBuilder,
          title: 'Website1',
          debugShowCheckedModeBanner: false,

          // Локализация
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('ru'), Locale('ky')],

          theme: ThemeData(
            useMaterial3: true,
            fontFamily: GoogleFonts.instrumentSans().fontFamily,
            scaffoldBackgroundColor: Colors.white,
            textTheme: base.textTheme.apply(bodyColor: Colors.black87),
            colorScheme: base.colorScheme.copyWith(
              primary: const Color(0xFF2278FF),
            ),
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent,
              elevation: 0,
              foregroundColor: Colors.black87,
              centerTitle: false,
            ),
          ),
          home: const NavigationScreen(),
        );
      },
    );
  }
}


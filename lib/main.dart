import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart';
import 'core/providers/language_provider.dart';
import 'features/navigation/screens/main_screen.dart';

void main() => runApp(
  DevicePreview(
    enabled: true, // Включен для разработки
    builder: (context) => const MyApp(), // Wrap your app
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LanguageProvider(),
      child: MaterialApp(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        title: 'Website1',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2563EB)),
          useMaterial3: true,
          fontFamily: GoogleFonts.instrumentSans().fontFamily,
        ),
        home: const MainScreen(),
      ),
    );
  }
}

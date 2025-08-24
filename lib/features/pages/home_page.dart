import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/providers/language_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, child) {
                final width = MediaQuery.of(context).size.width;
        final isMobile = width < AppSizes.mobileBreakpoint;
        
        return Container(
          width: double.infinity,
          height: isMobile ? 200 : 90,
          margin: EdgeInsets.only(
            top: isMobile ? AppSizes.md : 20,
            left: isMobile ? AppSizes.md : 0,
            right: isMobile ? AppSizes.md : 0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(isMobile ? AppSizes.sm : 0),
            image: DecorationImage(image: AssetImage('assets/img/main_img.jpeg'), fit: BoxFit.fitWidth)
          ),
          child: Padding(
            padding: EdgeInsets.all(isMobile ? AppSizes.lg : 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Title
                Text(
                  'Добро пожаловать в Поводырь! К самостоятельной жизни через технологии',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: isMobile ? 20 : 24,
                    height: 1.0,
                    color: AppColors.background,
                  ),
                ),
                
                const SizedBox(height: 8),
                
                // Subtitle
                Text(
                  'САЙТ О ЦИФРОВЫХ ПРОДУКТАХ ДЛЯ НЕЗРЯЧИХ И ЛЮДЕЙ С НАРУШЕНИЕМ ЗРЕНИЯ С ПОДРОБНЫМИ ИНСТРУКЦИЯМИ',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: isMobile ? 10 : 12,
                    height: 1.0,
                    color: AppColors.background,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/providers/language_provider.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, child) {
        // Данные для блока
        final List<Map<String, dynamic>> projectData = [
          {
            'icon': Icons.visibility,
            'text': '“Поводырь” — это сайт, объединяющий цифровые решения для незрячих и слабовидящих людей, которые помогают ориентироваться в пространстве, вести активный образ жизни и быть самостоятельными в повседневной жизни.',
          },
          {
            'icon': Icons.psychology,
            'text': 'Этот сайт не является официальным ресурсом мобильных  приложений и не связан с их разработчиками. Все названия, логотипы, товарные знаки и прочие обозначения, упомянутые на сайте, принадлежат их соответствующим правообладателям. Информация, размещённая на сайте, предоставляется исключительно в ознакомительных целях и основана на личном опыте использования приложения. ',
          },
          {
            'icon': Icons.people,
            'text': 'Цель проекта — облегчить доступ к проверенным и полезным цифровым инструментам, которые действительно работают и учитывают потребности незрячих пользователей. ',
          },
          {
            'icon': Icons.rocket_launch,
            'text': 'Если вы являетесь владельцем прав на материалы, размещённые на сайте, и считаете, что они используются ненадлежащим образом, пожалуйста, свяжитесь с нами для оперативного урегулирования вопроса.',
          },
        ];

        final double width = MediaQuery.of(context).size.width;
        final bool isMobile = width < AppSizes.mobileBreakpoint; // < 768
        final bool isDesktop = width >= AppSizes.desktopBreakpoint; // >= 1200

        // Плавные параметры через интерполяцию
        double normalize(double v, double min, double max) {
          final double t = ((v - min) / (max - min)).clamp(0.0, 1.0);
          return t;
        }

        final double t = normalize(width, 360, 1440);
        double lerp(double a, double b, double tt) => a + (b - a) * tt;

        final double iconSize = lerp(24, 32, t);
        final double mainAxisSpacing = lerp(16, 30, t);
        final double crossAxisSpacing = lerp(16, 40, t);
        final EdgeInsets animatedPadding = EdgeInsets.only(
          top: lerp(24, 43, t),
          bottom: lerp(24, 43, t),
          left: lerp(16, 105, t),
          right: lerp(16, 105, t),
        );

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'О ПРОЕКТЕ',
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24,
                height: 1.0,
                color: Color(0xFF00367D),
              ),
            ),
            const SizedBox(height: 35),

            // Анимируем размеры/отступы для более плавных переходов
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              width: double.infinity,
              constraints: BoxConstraints(minHeight: isDesktop ? 304 : 0),
              color: const Color(0xFF00367D),
              padding: animatedPadding,
              // Заменен GridView на LayoutBuilder + Wrap для авто-высоты элементов
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final double availableWidth = constraints.maxWidth;
                  final int columns = isMobile ? 1 : 2;
                  final double spacing = crossAxisSpacing;
                  final double itemWidth = columns == 1
                      ? availableWidth
                      : (availableWidth - spacing) / 2;

                  return Wrap(
                    spacing: spacing,
                    runSpacing: mainAxisSpacing,
                    children: List.generate(projectData.length, (index) {
                      final item = projectData[index];
                      return SizedBox(
                        width: itemWidth,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              item['icon'] as IconData,
                              size: iconSize,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                item['text'] as String,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: lerp(15, 16, t),
                                  fontWeight: FontWeight.w400,
                                  height: isMobile ? 1.35 : 1.25,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
            const SizedBox(height: 54),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import '../data/about_screen_data.dart';
import '../widget/numbered_item_widget.dart';
import '../widget/section_header_widget.dart';
import '../constants/app_text_styles.dart';

class AboutScreen extends StatelessWidget {
  final bool isDesktop;
  final bool isTablet;
  final bool isMobile;

  const AboutScreen({
    super.key,
    required this.isDesktop,
    required this.isTablet,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final double width = MediaQuery.of(context).size.width;
    
    // Плавные параметры через интерполяцию
    double normalize(double v, double min, double max) {
      final double t = ((v - min) / (max - min)).clamp(0.0, 1.0);
      return t;
    }

    final double t = normalize(width, 360, 1440);
    double lerp(double a, double b, double tt) => a + (b - a) * tt;

    // Анимированные размеры
    final double iconSize = lerp(24, 40, t);
    final double fontSize = lerp(12, 16, t);
    final double spacing = lerp(8, 16, t);
    final double mainAxisSpacing = lerp(10, 20, t);
    final double crossAxisSpacing = lerp(10, 20, t);
    final EdgeInsets animatedPadding = EdgeInsets.only(
      top: lerp(20, 40, t),
      bottom: lerp(20, 40, t),
      left: lerp(16, 50, t),
      right: lerp(16, 50, t),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SectionHeaderWidget(title: l10n.aboutTitle),
        const SizedBox(height: 35),
        
        // Контейнер с плавными переходами
        Container(
          width: double.infinity,

          color: AppTextStyles.contactBackground,
          padding: animatedPadding,
          child: isMobile ? _buildMobileLayout(context, iconSize, fontSize, spacing) : _buildDesktopLayout(context, iconSize, fontSize, mainAxisSpacing, crossAxisSpacing),
        ),
        const SizedBox(height: 54,)
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context, double iconSize, double fontSize, double spacing) {
    final aboutData = AboutScreenData.getAboutScreenData(context);
    return SingleChildScrollView(
      child: Column(
        children: aboutData.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          return Padding(
            padding: EdgeInsets.only(bottom: spacing),
            child: NumberedItemWidget(
              number: index + 1,
              text: item.text,
              fontSize: fontSize,
              spacing: spacing,
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context, double iconSize, double fontSize, double mainAxisSpacing, double crossAxisSpacing) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final aboutData = AboutScreenData.getAboutScreenData(context);
        final double availableWidth = constraints.maxWidth;
        final int columns = isTablet ? 2 : 2;
        final double spacing = crossAxisSpacing;
        final double itemWidth = columns == 1
            ? availableWidth
            : (availableWidth - spacing) / 2;

        return Wrap(
          spacing: spacing,
          runSpacing: mainAxisSpacing,
          children: List.generate(aboutData.length, (index) {
            final item = aboutData[index];
            return SizedBox(
              width: itemWidth,
              child: NumberedItemWidget(
                number: index + 1,
                text: item.text,
                fontSize: fontSize,
                spacing: spacing,
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            );
          }),
        );
      },
    );
  }
}

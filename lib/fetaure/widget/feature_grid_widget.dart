import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../data/localized_mobile_apps_data.dart';
import 'semantic_text_widget.dart';


class FeaturesGrid extends StatelessWidget {
  final List<FeaturesData> features;

  const FeaturesGrid({
    super.key,
    required this.features,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;

      // Простые 4 дизайна по ширине
      int cols;
      double padding;
      double spacing;
      double aspectRatio;

      if (width <= 500) {
        // Mobile small
        cols = 1;
        padding = 12;
        spacing = 8;
        aspectRatio = 2.8; // Компактные карточки на мобильных
      } else if (width <= 700) {
        // Mobile large
        cols = 1;
        padding = 16;
        spacing = 12;
        aspectRatio = 3.5; // Компактные карточки на мобильных
      } else if (width <= 1000) {
        // Tablet
        cols = 2;
        padding = 20;
        spacing = 16;
        aspectRatio = 2.8; // Высокие карточки на планшетах
      } else {
        // Desktop
        cols = 3;
        padding = 24;
        spacing = 16;
        aspectRatio = 3; // Высокие карточки на десктопе
      }

      return Padding(
        padding: EdgeInsets.all(padding),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: features.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: cols,
            crossAxisSpacing: spacing,
            mainAxisSpacing: spacing,
            childAspectRatio: aspectRatio,
          ),
          itemBuilder: (context, index) {
            final feature = features[index];
            return FeatureCard(
              title: feature.title,
              body: feature.subtitle,
              icon: feature.icon,
            );
          },
        ),
      );
    });
  }
}

class FeatureCard extends StatelessWidget {
  final String? title;
  final String body;
  final IconData icon;
  final bool hover;

  const FeatureCard({
    super.key,
    this.title,
    required this.body,
    required this.icon,
    this.hover = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: hover ? const Color(0xFFE6F0FF) : const Color(0xFFF1F4F8),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: hover ? 0.06 : 0.03),
            blurRadius: hover ? 18 : 8,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: const Color(0xFFF2F8FF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: AppColors.primary, size: 28),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (title != null && title!.isNotEmpty) ...[
                  SemanticTextWidget(
                    text: title!,
                    style: AppTextStyles.featureCardTitle,
                    isHeading: true,
                    headingLevel: 3,
                  ),
                  const SizedBox(height: 6),
                ],
                SemanticTextWidget(
                  text: body,
                  style: AppTextStyles.featureCardBody,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
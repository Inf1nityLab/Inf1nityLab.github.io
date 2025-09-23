

import 'package:flutter/material.dart';
import '../constants/app_text_styles.dart';
import 'semantic_text_widget.dart';

import '../data/localized_mobile_apps_data.dart';

class CardWidget extends StatelessWidget {
  final List<CardData> cards;
  
  const CardWidget({
    super.key,
    required this.cards,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isWide = width > 900;
        final isTablet = width > 600 && width <= 900;

        Widget buildCard(CardData card) {
          return Container(
            margin: EdgeInsets.all(isWide ? 8 : 4),
            padding: EdgeInsets.all(isWide ? 20 : 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border(
                left: BorderSide(color: card.accentColor, width: 6),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 6,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SemanticTextWidget(
                  text: card.title,
                  style: isWide
                      ? AppTextStyles.cardTitle
                      : (isTablet
                          ? AppTextStyles.cardTitle.copyWith(fontSize: 16)
                          : AppTextStyles.cardTitle.copyWith(fontSize: 15)),
                  isHeading: true,
                  headingLevel: 3,
                ),
                if (card.subtitle != null && card.subtitle!.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  SemanticTextWidget(
                    text: card.subtitle!,
                    style: isWide
                        ? AppTextStyles.cardSubtitle
                        : (isTablet
                            ? AppTextStyles.cardSubtitle.copyWith(fontSize: 13)
                            : AppTextStyles.cardSubtitle.copyWith(fontSize: 12)),
                    isHeading: true,
                    headingLevel: 4,
                  ),
                  const SizedBox(height: 10),
                ] else ...[
                  const SizedBox(height: 12),
                ],
                ...card.data.map(
                      (point) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: SemanticTextWidget(
                      text: '• $point',
                      style: isWide
                          ? AppTextStyles.cardPoint
                          : (isTablet
                              ? AppTextStyles.cardPoint.copyWith(fontSize: 14)
                              : AppTextStyles.cardPoint.copyWith(fontSize: 13)),
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        if (isWide) {
          // Desktop: две карточки в ряд
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: buildCard(cards[0])),
              const SizedBox(width: 16),
              Expanded(child: buildCard(cards[1])),
            ],
          );
        } else if (isTablet) {
          // Tablet: две карточки в ряд, но с меньшими отступами
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: buildCard(cards[0])),
              const SizedBox(width: 8),
              Expanded(child: buildCard(cards[1])),
            ],
          );
        } else {
          // Mobile: карточки в колонку
          return Column(
            children: [
              buildCard(cards[0]),
              const SizedBox(height: 8),
              buildCard(cards[1]),
            ],
          );
        }
      });
  }
}

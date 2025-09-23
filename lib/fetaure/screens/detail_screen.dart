import 'package:flutter/material.dart';
import 'package:website1/fetaure/screens/footer.dart';
import 'package:website1/fetaure/widget/image_widget.dart';

import '../data/localized_mobile_apps_data.dart';
import '../widget/card_widget.dart';
import '../widget/expandable_section.dart';
import '../widget/feature_grid_widget.dart';
import '../widget/navigation_screen_widget.dart';
import '../widget/responsive_layout.dart';
import '../widget/semantic_text_widget.dart';
import '../widget/tiny_badge.dart';
import '../../l10n/app_localizations.dart';

class DetailScreen extends StatelessWidget {
  final MobileAppsData data;

  const DetailScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final titles = [
      l10n.detailNavigationHome,
      l10n.detailNavigationFAQ,
      l10n.detailNavigationPartners,
    ];
    final code = Localizations.localeOf(context).languageCode;
    final announceMessages = code == 'ky'
        ? <String>[
            'Сиз башкы баракчадасыз',
            'Сиз ${titles[1]} баракчадасыз',
            'Сиз ${titles[2]} баракчадасыз',
          ]
        : <String>[
            'Вы на главной странице',
            'Вы на странице ${titles[1]}',
            'Вы на странице ${titles[2]}',
          ];
    return NavigationScreenWidget(
      svgImage: data.image,
      navigationTitles: titles,
      navigationAnnounceMessages: announceMessages,
      responsiveSettings: const ResponsiveSettings(
        enableScrollToSection: true,
        scrollDuration: 300,
        scrollCurve: Curves.easeInOut,
      ),
      screens: [
        _buildHero(
          title: data.buildHeroData.title,
          subtitle: data.buildHeroData.subtitle,
          tinyBadge: data.buildHeroData.tinyBadge,
          images: data.buildHeroData.mainImage
        ),
        _questionPart(
          featuresData: data.featuresData,
          exampleData: data.featuresExample,
          cardData: data.accessibilityCard,
          minusAndPlus: data.minusAndPlus,
          installs: data.instructions,
          howToUse: data.howToUse,
          howToUseTwo: data.howToUseTwo,
          images: data.images
        ),
        Footer(
          isDesktop: ResponsiveLayout.isDesktop(context),
          isTablet: ResponsiveLayout.isTablet(context),
          isMobile: ResponsiveLayout.isMobile(context),
        ),
      ],
    );
  }

  Widget _buildHero({
    required String title,
    required String subtitle,
    required List<String> tinyBadge,
    required List<String> images
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final bool isWide = width > 1000;
        final l10n = AppLocalizations.of(context)!;

        double padding;
        if (width <= 500) {
          padding = 16;
        } else if (width <= 700) {
          padding = 20;
        } else if (width <= 1000) {
          padding = 24;
        } else {
          padding = 32;
        }

        return Container(
          width: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.only(left: padding, right: padding, top: padding),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: isWide ? 6 : 12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SemanticTextWidget(
                      text: title,
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(fontWeight: FontWeight.w800),
                      isHeading: true,
                      headingLevel: 1,
                    ),
                    const SizedBox(height: 8),
                    SemanticTextWidget(
                      text: subtitle,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 10,
                      runSpacing: 8,
                      children: tinyBadge.map((e) => TinyBadge(e)).toList(),
                    ),
                    if (width <= 700) const SizedBox(height: 18),
                  ],
                ),
              ),
              if (isWide) const SizedBox(width: 22),
              if (isWide)
                Expanded(
                  flex: 4,
                  child: Container(
                    height: isWide ? 340 : 280,
                    padding: const EdgeInsets.all(12),
                    child: Stack(
                      children: [
                        // Изображения занимают все пространство
                        ImageWidget(imagePaths: images, crossAxisCount: 4,),
                        // Две кнопки внизу слева
                        Positioned(
                          bottom: 8,
                          left: 8,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                               _buildDownloadButtonWithText(
                                 text: l10n.downloadAppStore,
                                 icon: Icons.apple,
                                 onPressed: () {
                                   // TODO: Добавить ссылку на App Store
                                 },
                               ),
                               const SizedBox(width: 8),
                               _buildDownloadButtonWithText(
                                 text: l10n.downloadGooglePlay,
                                 icon: Icons.android,
                                 onPressed: () {
                                   // TODO: Добавить ссылку на Google Play
                                 },
                               ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _questionPart({
    required List<FeaturesData> featuresData,
    required List<FeaturesData> exampleData,
    required List<CardData> cardData,
    required List<CardData> minusAndPlus,
    required List<CardData> installs,
    required List<CardData> howToUse,
    required List<CardData> howToUseTwo,
    required List<String> images
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        double padding;
        double headerSpacing;

        if (width <= 500) {
          padding = 12;
          headerSpacing = 4;
        } else if (width <= 700) {
          padding = 16;
          headerSpacing = 6;
        } else if (width <= 1000) {
          padding = 20;
          headerSpacing = 8;
        } else {
          padding = 24;
          headerSpacing = 8;
        }

        final l10n = AppLocalizations.of(context)!;
        return Container(
          padding: EdgeInsets.only(left: padding, right: padding, bottom: padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ExpandableSection(
                title: l10n.detailMainFeatures,
                child: FeaturesGrid(features: featuresData),
              ),
              SizedBox(height: headerSpacing),
              ExpandableSection(
                title: l10n.detailAdvantages,
                child: CardWidget(cards: cardData),
              ),
              SizedBox(height: headerSpacing),
              ExpandableSection(
                title: l10n.detailUsageExamples,
                child: FeaturesGrid(features: exampleData),
              ),
              SizedBox(height: headerSpacing),
              ExpandableSection(
                title: l10n.detailProsAndCons,
                child: CardWidget(cards: minusAndPlus),
              ),
              SizedBox(height: headerSpacing),
              ExpandableSection(
                title: l10n.detailInstallationGuide,
                child: CardWidget(cards: installs),
              ),
              SizedBox(height: headerSpacing),
              ExpandableSection(
                title: l10n.detailHowToUse,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CardWidget(cards: howToUse),
                    const SizedBox(height: 8),
                    CardWidget(cards: howToUseTwo),
                  ],
                ),
              ),
              ExpandableSection(
                title: 'Фото примеры',
                child: ImageWidget(imagePaths: images),
              ),
            ],
          ),
        );
      },
    );
  }


  Widget _buildDownloadButtonWithText({
    required String text,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SemanticTextWidget(
                text: text,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                isButton: true,
              ),
              const SizedBox(width: 6),
              Icon(
                icon,
                color: Colors.black,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

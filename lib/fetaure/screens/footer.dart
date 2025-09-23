import 'package:flutter/material.dart';
import '../constants/app_text_styles.dart';
import '../widget/semantic_text_widget.dart';
import '../../l10n/app_localizations.dart';

class Footer extends StatelessWidget {
  final bool isDesktop;
  final bool isTablet;
  final bool isMobile;
  
  const Footer({
    super.key, 
    required this.isDesktop, 
    required this.isTablet, 
    required this.isMobile
  });


  // Данные логотипов партнеров с индивидуальными размерами
  List<Map<String, dynamic>> get _logoData => [
    {'url': 'assets/img/eu.png', 'width': 300.0, 'height': 100.0},
    {'url': 'assets/img/konrad.png', 'width': 60.0, 'height': 50.0},
    {'url': 'assets/img/biom.png', 'width': 50.0, 'height': 50.0},
    {'url': 'assets/img/alga.png', 'width': 50.0, 'height': 30.0},
    {'url': 'assets/img/mpfpr.png', 'width': 120.0, 'height': 50.0},
  ];

  Widget _buildDescriptionText(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return RichText(
      text: TextSpan(
        style: AppTextStyles.footerBody,
        children: [
          TextSpan(text: '${l10n.footerDescription} '),
          TextSpan(
            text: l10n.footerProjectName,
            style: AppTextStyles.footerBold,
          ),
          TextSpan(text: l10n.footerDescriptionEnd),
        ],
      ),
    );
  }

  Widget _buildLogosGrid() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobileScreen = constraints.maxWidth < 768.0;
        
        if (isMobileScreen) {
          // Мобильная версия: одна большая картинка all.png
          return Center(
            child: Image.asset(
              'assets/img/all.png',
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 200.0,
                  height: 100.0,
                  color: const Color(0xFFE2E8F0),
                  child: const Center(
                    child: SemanticTextWidget(
                      text: 'All Partners',
                      style: AppTextStyles.logoErrorTitle,
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          // Десктоп/планшет: горизонтальный список с индивидуальными размерами
          return SizedBox(
            height: 100,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final logo = _logoData[index];
                return SizedBox(
                  height: logo['height'] as double,
                  width: logo['width'] as double,
                  child: Image.asset(
                    logo['url'] as String,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: logo['width'] as double,
                        height: logo['height'] as double,
                        color: const Color(0xFFE2E8F0),
                        child: Center(
                        child: SemanticTextWidget(
                          text: 'Logo ${index + 1}',
                          style: AppTextStyles.logoErrorSubtitle,
                        ),
                        ),
                      );
                    },
                  ),
                );
              },
              separatorBuilder: (_, __) => const SizedBox(width: 15.0),
              itemCount: _logoData.length,
            ),
          );
        }
      },
    );
  }

  Widget _buildDisclaimerText(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SemanticTextWidget(
      text: l10n.footerDisclaimer,
      style: AppTextStyles.footerBody,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final bool isMobileScreen = width < 768.0;
    final bool isTabletScreen = width >= 768.0 && width < 1200.0;

    if (isMobileScreen) {
      // Мобильная версия: вертикальный layout
      return Container(
        width: double.infinity,
        color: const Color(0xFFD9D9D9),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDescriptionText(context),
            const SizedBox(height: 15.0),
            _buildDisclaimerText(context),
            const SizedBox(height: 15.0),
            _buildLogosGrid(),
          ],
        ),
      );
    } else {
      // Десктоп/планшет: горизонтальный layout
      return Container(
        width: double.infinity,
        color: const Color(0xFFD9D9D9),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            120.0,  // left
            50.0,   // top
            120.0,  // right
            35.0,   // bottom
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Верхняя часть: два текста в Row
                  Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 6,
                    child: _buildDescriptionText(context),
                  ),
                  const SizedBox(width: 40.0),
                  Expanded(
                    flex: 4,
                    child: _buildDisclaimerText(context),
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              // Нижняя часть: логотипы на всю ширину
              _buildLogosGrid(),
            ],
          );
            },
          ),
        ),
      );
    }
  }
}
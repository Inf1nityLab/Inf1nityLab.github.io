import 'package:flutter/material.dart';
import 'dart:ui';
import '../constants/app_text_styles.dart';
import '../widget/semantic_text_widget.dart';
import '../../l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  final bool isDesktop;
  final bool isTablet;
  final bool isMobile;

  const HomeScreen({
    super.key,
    required this.isDesktop,
    required this.isTablet,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final double sectionHeight = isMobile ? 240 : 140;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: double.infinity,
      height: sectionHeight,
      margin: EdgeInsets.only(
        top: 54,
        left: isMobile ? 12 : 0,
        right: isMobile ? 12 : 0,
        bottom: 54,
      ),
      alignment: Alignment.center,
      child: Stack(
        children: [
          // Фоновое изображение
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/main_img.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // BackdropFilter с размытием и затемнением
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
              child: Container(
                color: Colors.black.withValues(alpha: 0.3),
                padding: EdgeInsets.symmetric(
                  horizontal: isDesktop ? 120 : (isTablet ? 50 : 16),
                  vertical: isDesktop
                      ? 16
                      : (isTablet
                          ? 24
                          : 40),
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(minHeight: constraints.maxHeight),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SelectableText(
                                l10n.homeTitle,
                                textAlign: TextAlign.center,
                                style: AppTextStyles.homeTitle,
                              ),
                              const SizedBox(height: 10),
                              SelectableText(
                                 l10n.homeSubtitle,
                                textAlign: TextAlign.center,
                                style: AppTextStyles.homeSubtitle,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

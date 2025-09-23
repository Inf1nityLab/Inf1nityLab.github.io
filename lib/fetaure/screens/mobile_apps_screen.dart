import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../data/localized_mobile_apps_data.dart';
import '../widget/mobile_app_card.dart';
import '../widget/section_header_widget.dart';
import '../../l10n/app_localizations.dart';
import 'detail_screen.dart';


class MobileAppsScreen extends StatelessWidget {
  final bool isDesktop;
  final bool isTablet;
  final bool isMobile;

  const MobileAppsScreen({
    super.key,
    required this.isDesktop,
    required this.isTablet,
    required this.isMobile,
  });

  // Константы для конфигурации
  static const double _cardWidth = 380.0;
  static const double _cardMargin = 24.0;
  static const double _carouselHeight = 500.0;
  static const double _carouselAspectRatio = 50 / 9;
  static const double _carouselEnlargeFactor = 0.2;

  // Общий метод для создания карточек
  List<Widget> _buildMobileAppCards(BuildContext context) {
    final appsData = LocalizedMobileAppsData.getMobileAppsData(context);
    return appsData
        .map((app) => MobileAppCard(
      announceText: app.announceText,
              svgImage: app.image,
              logoText: app.logoText,
              infoText: app.infoText,
              onPressed: () => _navigateToDetailScreen(context, app),
            ))
        .toList();
  }

  // Метод для навигации к детальному экрану
  void _navigateToDetailScreen(BuildContext context, MobileAppsData appData) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(data: appData),
      ),
    );
  }

  // Общая логика для desktop и tablet layout
  Widget _buildResponsiveLayout(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final totalCardWidth = _cardWidth + (_cardMargin * 2);
        final availableWidth = constraints.maxWidth;
        final cardsPerRow = (availableWidth / totalCardWidth).floor();

        final appsData = LocalizedMobileAppsData.getMobileAppsData(context);
        if (cardsPerRow >= appsData.length) {
          // Если все карточки помещаются - центрируем
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildMobileAppCards(context),
          );
        } else {
          // Если не помещаются - делаем скролл
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: _buildMobileAppCards(context)),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      children: [
        SectionHeaderWidget(title: l10n.mobileAppsTitle),
        const SizedBox(height: 35),
        _buildMobileAppsContent(context),
        const SizedBox(height: 54),
      ],
    );
  }

  Widget _buildMobileAppsContent(BuildContext context) {
    if (isMobile) {
      return _buildMobileLayout(context);
    } else {
      // Для desktop и tablet используем одинаковую логику
      return _buildResponsiveLayout(context);
    }
  }

  Widget _buildMobileLayout(BuildContext context) {
    return CarouselSlider(
      items: _buildMobileAppCards(context),
      options: CarouselOptions(
        height: _carouselHeight,
        aspectRatio: _carouselAspectRatio,
        viewportFraction: 1,
        initialPage: 1,
        enableInfiniteScroll: false,
        reverse: false,
        autoPlay: false,
        autoPlayInterval: const Duration(seconds: 1),
        autoPlayAnimationDuration: const Duration(milliseconds: 1),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: _carouselEnlargeFactor,
        onPageChanged: (i, r) {},
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

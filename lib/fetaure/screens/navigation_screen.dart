import 'package:flutter/material.dart';

import '../constants/app_images.dart';
import '../data/navigation_data.dart';
import '../widget/language_button.dart';
import '../widget/navigation_screen_widget.dart';
import '../widget/responsive_layout.dart';
import 'about_screen.dart';
import 'contact_screen.dart';
import 'footer.dart';
import 'home_screen.dart';
import 'mobile_apps_screen.dart';



class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titles = NavigationData.getNavigationTitles(context);
    final code = Localizations.localeOf(context).languageCode;
    final announceMessages = code == 'ky'
        ? <String>[
            'Сиз башкы баракчадасыз',
            'Сиз ${titles[1]} баракчадасыз',
            'Сиз ${titles[2]} баракчадасыз',
            'Сиз ${titles[3]} баракчадасыз',
          ]
        : <String>[
            'Вы на главной странице',
            'Вы на странице ${titles[1]}',
            'Вы на странице ${titles[2]}',
            'Вы на странице ${titles[3]}',
          ];

    return NavigationScreenWidget(
      logoImage: AppImages.logo,
      navigationTitles: titles,
      navigationAnnounceMessages: announceMessages,
      rightWidget: const LanguageButton(),
      bottomWidget: const LanguageButton(),
      responsiveSettings: const ResponsiveSettings(
        enableScrollToSection: true,
        scrollDuration: 300,
        scrollCurve: Curves.easeInOut,
      ),
      screens: [
        HomeScreen(
          isDesktop: ResponsiveLayout.isDesktop(context),
          isTablet: ResponsiveLayout.isTablet(context),
          isMobile: ResponsiveLayout.isMobile(context),
        ),
        MobileAppsScreen(
          isDesktop: ResponsiveLayout.isDesktop(context),
          isTablet: ResponsiveLayout.isTablet(context),
          isMobile: ResponsiveLayout.isMobile(context),
        ),
        AboutScreen(
          isDesktop: ResponsiveLayout.isDesktop(context),
          isTablet: ResponsiveLayout.isTablet(context),
          isMobile: ResponsiveLayout.isMobile(context),
        ),
        ContactScreen(
          isDesktop: ResponsiveLayout.isDesktop(context),
          isTablet: ResponsiveLayout.isTablet(context),
          isMobile: ResponsiveLayout.isMobile(context),
        ),
        Footer(
          isDesktop: ResponsiveLayout.isDesktop(context),
          isTablet: ResponsiveLayout.isTablet(context),
          isMobile: ResponsiveLayout.isMobile(context),
        ),
      ],
    );
  }
}

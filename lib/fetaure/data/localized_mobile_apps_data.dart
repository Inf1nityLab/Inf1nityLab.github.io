import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import '../constants/app_images.dart';

class LocalizedMobileAppsData {
  static List<MobileAppsData> getMobileAppsData(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final code = Localizations.localeOf(context).languageCode;
    String _announceFor(String appName) {
      switch (code) {
        case 'ky':
          return 'Өтүү: $appName тууралуу деталдаштырылган баракча';
        case 'ru':
        default:
          return 'Переход: детальная страница $appName';
      }
    }

    return [
      MobileAppsData(
        image: AppImages.be,
        announceText: _announceFor('Be My Eyes'),
        infoText: l10n.beMyEyesInfoText,
        buildHeroData: BuildHeroData(
          title: l10n.beMyEyesTitle,
          subtitle: l10n.beMyEyesSubtitle,
          tinyBadge: [
            l10n.beMyEyesBadge1,
            l10n.beMyEyesBadge2,
            l10n.beMyEyesBadge3,
            l10n.beMyEyesBadge4,
          ],
          mainImage: [
            AppImages.be1,
            AppImages.be2,
            AppImages.be3,
            AppImages.be4,
          ],
        ),
        featuresData: [
          FeaturesData(
            title: l10n.beMyEyesFeature1Title,
            subtitle: l10n.beMyEyesFeature1Subtitle,
            icon: Icons.volunteer_activism,
          ),
          FeaturesData(
            title: l10n.beMyEyesFeature2Title,
            subtitle: l10n.beMyEyesFeature2Subtitle,
            icon: Icons.support_agent,
          ),
          FeaturesData(
            title: l10n.beMyEyesFeature3Title,
            subtitle: l10n.beMyEyesFeature3Subtitle,
            icon: Icons.call,
          ),
          FeaturesData(
            title: l10n.beMyEyesFeature4Title,
            subtitle: l10n.beMyEyesFeature4Subtitle,
            icon: Icons.language,
          ),
        ],
        featuresExample: [
          FeaturesData(
            title: l10n.beMyEyesExample1Title,
            subtitle: l10n.beMyEyesExample1Subtitle,
            icon: Icons.date_range,
          ),
          FeaturesData(
            title: l10n.beMyEyesExample2Title,
            subtitle: l10n.beMyEyesExample2Subtitle,
            icon: Icons.checkroom,
          ),
          FeaturesData(
            title: l10n.beMyEyesExample3Title,
            subtitle: l10n.beMyEyesExample3Subtitle,
            icon: Icons.directions_walk,
          ),
          FeaturesData(
            title: l10n.beMyEyesExample4Title,
            subtitle: l10n.beMyEyesExample4Subtitle,
            icon: Icons.text_fields,
          ),
        ],
        accessibilityCard: [
          CardData(
            title: '1. ${l10n.accessibilityTitle1}',
            data: [
              l10n.accessibilityData1,
              l10n.accessibilityData2,
              l10n.accessibilityData3,
              l10n.accessibilityData4,
              l10n.accessibilityData5,
            ],
            accentColor: Colors.blueAccent,
          ),
          CardData(
            title: '2. ${l10n.accessibilityTitle2}',
            data: [l10n.accessibilityData6, l10n.accessibilityData7],
            accentColor: Colors.redAccent,
          ),
        ],
        minusAndPlus: [
          CardData(
            title: l10n.prosTitle,
            data: [
              l10n.prosData1,
              l10n.prosData2,
              l10n.prosData3,
              l10n.prosData4,
            ],
            accentColor: Colors.blueAccent,
          ),
          CardData(
            title: l10n.consTitle,
            data: [l10n.consData1, l10n.consData2],
            accentColor: Colors.redAccent,
          ),
        ],
        instructions: [
          CardData(
            title: l10n.installAndroidTitle,
            data: [
              l10n.installAndroidData1,
              l10n.installAndroidData2,
              l10n.installAndroidData3,
              l10n.installAndroidData4,
              l10n.installAndroidData5,
              l10n.installAndroidData6,
            ],
            accentColor: Colors.blueAccent,
          ),
          CardData(
            title: l10n.installIOSTitle,
            data: [
              l10n.installIOSData1,
              l10n.installIOSData2,
              l10n.installIOSData3,
              l10n.installIOSData4,
              l10n.installIOSData5,
              l10n.installIOSData6,
            ],
            accentColor: Colors.redAccent,
          ),
        ],
        howToUse: [
          CardData(
            title: l10n.howToUse1Title,
            subtitle: l10n.howToUse1Subtitle,
            data: [
              l10n.howToUse1Data1,
              l10n.howToUse1Data2,
              l10n.howToUse1Data3,
              l10n.howToUse1Data4,
              l10n.howToUse1Data5,
            ],
            accentColor: Colors.blueAccent,
          ),
          CardData(
            title: l10n.howToUse2Title,
            subtitle: l10n.howToUse2Subtitle,
            data: [
              l10n.howToUse2Data1,
              l10n.howToUse2Data2,
              l10n.howToUse2Data3,
            ],
            accentColor: Colors.redAccent,
          ),
        ],
        howToUseTwo: [
          CardData(
            title: l10n.tipsTitle,
            subtitle: l10n.tipsSubtitle,
            data: [
              l10n.tipsData1,
              l10n.tipsData2,
              l10n.tipsData3,
              l10n.tipsData4,
            ],
            accentColor: Colors.greenAccent,
          ),
          CardData(
            title: l10n.screenReaderTitle,
            subtitle: l10n.screenReaderSubtitle,
            data: [
              l10n.screenReaderData1,
              l10n.screenReaderData2,
              l10n.screenReaderData3,
            ],
            accentColor: Colors.purpleAccent,
          ),
        ],
        images: [
          AppImages.be1,
          AppImages.be2,
          AppImages.be3,
          AppImages.be4,
          AppImages.be5,
          AppImages.be6,
          AppImages.be7,
          AppImages.be8,
          AppImages.be9,
          AppImages.be10,
          AppImages.be11,
          AppImages.be12,
        ]
      ),
      // OsmAnd данные
      MobileAppsData(
        image: AppImages.osm,
        logoText: 'OsmAnd',
        announceText: _announceFor('OsmAnd'),
        infoText: l10n.osmAndInfoText,
        buildHeroData: BuildHeroData(
          title: l10n.osmAndTitle,
          subtitle: l10n.osmAndSubtitle,
          tinyBadge: [
            l10n.osmAndBadge1,
            l10n.osmAndBadge2,
            l10n.osmAndBadge3,
            l10n.osmAndBadge4,
          ],
          mainImage: [
            AppImages.osm1,
            AppImages.osm2,
            AppImages.osm3,
            AppImages.osm4,
          ],
        ),
        featuresData: [
          FeaturesData(
            title: l10n.osmAndFeature1Title,
            subtitle: l10n.osmAndFeature1Subtitle,
            icon: Icons.offline_bolt,
          ),
          FeaturesData(
            title: l10n.osmAndFeature2Title,
            subtitle: l10n.osmAndFeature2Subtitle,
            icon: Icons.record_voice_over,
          ),
          FeaturesData(
            title: l10n.osmAndFeature3Title,
            subtitle: l10n.osmAndFeature3Subtitle,
            icon: Icons.route,
          ),
          FeaturesData(
            title: l10n.osmAndFeature4Title,
            subtitle: l10n.osmAndFeature4Subtitle,
            icon: Icons.map,
          ),
          FeaturesData(
            title: l10n.osmAndFeature5Title,
            subtitle: l10n.osmAndFeature5Subtitle,
            icon: Icons.accessibility_new,
          ),
          FeaturesData(
            title: l10n.osmAndFeature6Title,
            subtitle: l10n.osmAndFeature6Subtitle,
            icon: Icons.settings,
          ),
        ],
        featuresExample: [
          FeaturesData(
            title: l10n.osmAndExample1Title,
            subtitle: l10n.osmAndExample1Subtitle,
            icon: Icons.directions_walk,
          ),
          FeaturesData(
            title: l10n.osmAndExample2Title,
            subtitle: l10n.osmAndExample2Subtitle,
            icon: Icons.alt_route,
          ),
          FeaturesData(
            title: l10n.osmAndExample3Title,
            subtitle: l10n.osmAndExample3Subtitle,
            icon: Icons.park,
          ),
          FeaturesData(
            title: l10n.osmAndExample4Title,
            subtitle: l10n.osmAndExample4Subtitle,
            icon: Icons.store_mall_directory,
          ),
        ],
        accessibilityCard: [
          CardData(
            title: '1. ${l10n.accessibilityTitle1}',
            data: [
              l10n.accessibilityData1,
              l10n.accessibilityData2,
              l10n.accessibilityData3,
              l10n.accessibilityData4,
              l10n.accessibilityData5,
            ],
            accentColor: Colors.blueAccent,
          ),
          CardData(
            title: '2. ${l10n.accessibilityTitle2}',
            data: [l10n.accessibilityData6, l10n.accessibilityData7],
            accentColor: Colors.redAccent,
          ),
        ],
        minusAndPlus: [
          CardData(
            title: l10n.prosTitle,
            data: [
              l10n.prosData1,
              l10n.prosData2,
              l10n.prosData3,
              l10n.prosData4,
            ],
            accentColor: Colors.blueAccent,
          ),
          CardData(
            title: l10n.consTitle,
            data: [l10n.consData1, l10n.consData2],
            accentColor: Colors.redAccent,
          ),
        ],
        instructions: [
          CardData(
            title: l10n.installAndroidTitle,
            data: [
              l10n.osmAndInstallAndroidData1,
              l10n.osmAndInstallAndroidData2,
              l10n.osmAndInstallAndroidData3,
              l10n.osmAndInstallAndroidData4,
              l10n.osmAndInstallAndroidData5,
            ],
            accentColor: Colors.blueAccent,
          ),
          CardData(
            title: l10n.installIOSTitle,
            data: [
              l10n.osmAndInstallIOSData1,
              l10n.osmAndInstallIOSData2,
              l10n.osmAndInstallIOSData3,
              l10n.osmAndInstallIOSData4,
              l10n.osmAndInstallIOSData5,
              l10n.osmAndInstallIOSData6,
            ],
            accentColor: Colors.redAccent,
          ),
        ],
        howToUse: [
          CardData(
            title: l10n.osmAndSetupTitle,
            subtitle: l10n.osmAndSetupSubtitle,
            data: [
              l10n.osmAndSetupData1,
              l10n.osmAndSetupData2,
              l10n.osmAndSetupData3,
              l10n.osmAndSetupData4,
              l10n.osmAndSetupData5,
            ],
            accentColor: Colors.blueAccent,
          ),
          CardData(
            title: l10n.osmAndSearchTitle,
            subtitle: l10n.osmAndSearchSubtitle,
            data: [
              l10n.osmAndSearchData1,
              l10n.osmAndSearchData2,
              l10n.osmAndSearchData3,
            ],
            accentColor: Colors.redAccent,
          ),
        ],
        howToUseTwo: [
          CardData(
            title: l10n.osmAndNavigationTitle,
            subtitle: l10n.osmAndNavigationSubtitle,
            data: [
              l10n.osmAndNavigationData1,
              l10n.osmAndNavigationData2,
              l10n.osmAndNavigationData3,
            ],
            accentColor: Colors.blueAccent,
          ),
          CardData(
            title: l10n.osmAndOfflineTitle,
            subtitle: l10n.osmAndOfflineSubtitle,
            data: [l10n.osmAndOfflineData1, l10n.osmAndOfflineData2],
            accentColor: Colors.redAccent,
          ),
        ],
        images: [
          AppImages.osm1,
          AppImages.osm2,
          AppImages.osm3,
          AppImages.osm4,
          AppImages.osm5,
          AppImages.osm6,
        ],
      ),
      // TapTapSee данные
      MobileAppsData(
        image: AppImages.tap,
        logoText: 'TapTapSee',
        announceText: _announceFor('TapTapSee'),
        infoText: l10n.tapTapSeeInfoText,
        buildHeroData: BuildHeroData(
          title: l10n.tapTapSeeTitle,
          subtitle: l10n.tapTapSeeSubtitle,
          tinyBadge: [
            l10n.tapTapSeeBadge1,
            l10n.tapTapSeeBadge2,
            l10n.tapTapSeeBadge3,
            l10n.tapTapSeeBadge4,
            l10n.tapTapSeeBadge5,
            l10n.tapTapSeeBadge6,
            l10n.tapTapSeeBadge7,
          ],
          mainImage: [
            AppImages.tap1,
            AppImages.tap2,
            AppImages.tap3,
            AppImages.tap3,
          ],
        ),
        featuresData: [
          FeaturesData(
            title: l10n.tapTapSeeFeature1Title,
            subtitle: l10n.tapTapSeeFeature1Subtitle,
            icon: Icons.photo_camera,
          ),
          FeaturesData(
            title: l10n.tapTapSeeFeature2Title,
            subtitle: l10n.tapTapSeeFeature2Subtitle,
            icon: Icons.color_lens,
          ),
          FeaturesData(
            title: l10n.tapTapSeeFeature3Title,
            subtitle: l10n.tapTapSeeFeature3Subtitle,
            icon: Icons.inventory,
          ),
          FeaturesData(
            title: l10n.tapTapSeeFeature4Title,
            subtitle: l10n.tapTapSeeFeature4Subtitle,
            icon: Icons.text_snippet,
          ),
          FeaturesData(
            title: l10n.tapTapSeeFeature5Title,
            subtitle: l10n.tapTapSeeFeature5Subtitle,
            icon: Icons.history,
          ),
          FeaturesData(
            title: l10n.tapTapSeeFeature6Title,
            subtitle: l10n.tapTapSeeFeature6Subtitle,
            icon: Icons.switch_camera,
          ),
          FeaturesData(
            title: l10n.tapTapSeeFeature7Title,
            subtitle: l10n.tapTapSeeFeature7Subtitle,
            icon: Icons.hearing,
          ),
        ],
        featuresExample: [
          FeaturesData(
            title: l10n.tapTapSeeExample1Title,
            subtitle: l10n.tapTapSeeExample1Subtitle,
            icon: Icons.photo_camera,
          ),
          FeaturesData(
            title: l10n.tapTapSeeExample2Title,
            subtitle: l10n.tapTapSeeExample2Subtitle,
            icon: Icons.color_lens,
          ),
          FeaturesData(
            title: l10n.tapTapSeeExample3Title,
            subtitle: l10n.tapTapSeeExample3Subtitle,
            icon: Icons.inventory,
          ),
          FeaturesData(
            title: l10n.tapTapSeeExample4Title,
            subtitle: l10n.tapTapSeeExample4Subtitle,
            icon: Icons.history,
          ),
        ],
        accessibilityCard: [
          CardData(
            title: '1. ${l10n.accessibilityTitle1}',
            data: [
              l10n.accessibilityData1,
              l10n.accessibilityData2,
              l10n.accessibilityData3,
              l10n.accessibilityData4,
              l10n.accessibilityData5,
            ],
            accentColor: Colors.blueAccent,
          ),
          CardData(
            title: '2. ${l10n.accessibilityTitle2}',
            data: [l10n.accessibilityData6, l10n.accessibilityData7],
            accentColor: Colors.redAccent,
          ),
        ],
        minusAndPlus: [
          CardData(
            title: l10n.prosTitle,
            data: [
              l10n.prosData1,
              l10n.prosData2,
              l10n.prosData3,
              l10n.prosData4,
            ],
            accentColor: Colors.blueAccent,
          ),
          CardData(
            title: l10n.consTitle,
            data: [l10n.consData1, l10n.consData2],
            accentColor: Colors.redAccent,
          ),
        ],
        instructions: [
          CardData(
            title: l10n.installIOSTitle,
            data: [
              l10n.tapTapSeeInstallIOSData1,
              l10n.tapTapSeeInstallIOSData2,
              l10n.tapTapSeeInstallIOSData3,
              l10n.tapTapSeeInstallIOSData4,
            ],
            accentColor: Colors.redAccent,
          ),
          CardData(
            title: l10n.installAndroidTitle,
            data: [
              l10n.tapTapSeeInstallAndroidData1,
              l10n.tapTapSeeInstallAndroidData2,
              l10n.tapTapSeeInstallAndroidData3,
              l10n.tapTapSeeInstallAndroidData4,
            ],
            accentColor: Colors.blueAccent,
          ),
        ],
        howToUse: [
          CardData(
            title: l10n.tapTapSeePhotoTitle,
            subtitle: l10n.tapTapSeePhotoSubtitle,
            data: [
              l10n.tapTapSeePhotoData1,
              l10n.tapTapSeePhotoData2,
              l10n.tapTapSeePhotoData3,
              l10n.tapTapSeePhotoData4,
              l10n.tapTapSeePhotoData5,
            ],
            accentColor: Colors.blueAccent,
          ),
          CardData(
            title: l10n.tapTapSeeWhatTitle,
            subtitle: l10n.tapTapSeeWhatSubtitle,
            data: [
              l10n.tapTapSeeWhatData1,
              l10n.tapTapSeeWhatData2,
              l10n.tapTapSeeWhatData3,
              l10n.tapTapSeeWhatData4,
              l10n.tapTapSeeWhatData5,
            ],
            accentColor: Colors.redAccent,
          ),
        ],
        howToUseTwo: [
          CardData(
            title: l10n.tapTapSeeExtraTitle,
            subtitle: l10n.tapTapSeeExtraSubtitle,
            data: [
              l10n.tapTapSeeExtraData1,
              l10n.tapTapSeeExtraData2,
              l10n.tapTapSeeExtraData3,
            ],
            accentColor: Colors.greenAccent,
          ),
          CardData(
            title: l10n.tapTapSeeTipsTitle,
            subtitle: l10n.tapTapSeeTipsSubtitle,
            data: [
              l10n.tapTapSeeTipsData1,
              l10n.tapTapSeeTipsData2,
              l10n.tapTapSeeTipsData3,
              l10n.tapTapSeeTipsData4,
            ],
            accentColor: Colors.purpleAccent,
          ),
        ],
        images: [AppImages.tap1, AppImages.tap2, AppImages.tap3],
      ),
    ];
  }
}

// Импортируем классы из оригинального файла
class MobileAppsData {

  final String image;
  final String? logoText;
  final String infoText;
  final String announceText;
  final BuildHeroData buildHeroData;
  final List<FeaturesData> featuresData;
  final List<FeaturesData> featuresExample;
  final List<CardData> accessibilityCard;
  final List<CardData> minusAndPlus;
  final List<CardData> instructions;
  final List<CardData> howToUse;
  final List<CardData> howToUseTwo;
  final List<String> images;

  MobileAppsData({
    required this.image,
    this.logoText,
    required this.announceText,
    required this.infoText,
    required this.buildHeroData,
    required this.featuresData,
    required this.featuresExample,
    required this.accessibilityCard,
    required this.minusAndPlus,
    required this.instructions,
    required this.howToUse,
    required this.howToUseTwo,
    required this.images,
  });
}

class BuildHeroData {
  final String title;
  final String subtitle;
  final List<String> tinyBadge;
  final List<String> mainImage;

  BuildHeroData({
    required this.title,
    required this.subtitle,
    required this.tinyBadge,
    required this.mainImage,
  });
}

class FeaturesData {
  final String title;
  final String subtitle;
  final IconData icon;

  FeaturesData({
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}

class CardData {
  final String title;
  final String? subtitle;
  final List<String> data;
  final Color accentColor;

  CardData({
    required this.title,
    this.subtitle,
    required this.data,
    required this.accentColor,
  });
}

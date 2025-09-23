import 'package:flutter/material.dart';
import '../constants/app_images.dart';
import '../../l10n/app_localizations.dart';

class AboutScreenData {
  final String image;
  final String text;

  AboutScreenData({required this.image, required this.text});

  static List<AboutScreenData> getAboutScreenData(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return [
      AboutScreenData(image: AppImages.dog, text: l10n.aboutItem1),
      AboutScreenData(image: AppImages.dis, text: l10n.aboutItem2),
      AboutScreenData(image: AppImages.goal, text: l10n.aboutItem3),
      AboutScreenData(image: AppImages.letter, text: l10n.aboutItem4),
    ];
  }
}
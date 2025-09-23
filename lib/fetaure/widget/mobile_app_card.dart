import 'package:flutter/material.dart';

import 'button_widget.dart';
import 'logo_widget.dart';
import 'semantic_text_widget.dart';
import '../constants/app_text_styles.dart';


class MobileAppCard extends StatelessWidget {
  final String svgImage;
  final String? logoText;
  final String infoText;
  final double height;
  final double width;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final bool showButton;
  final VoidCallback? onPressed;
  final String announceText;
  const MobileAppCard({
    super.key,
    required this.svgImage,
     this.logoText,
    required this.infoText,
    this.height = 450,
    this.width = 380,
    this.margin = const EdgeInsets.only(right: 24, left: 24, bottom: 54),
    this.padding = const EdgeInsets.all(25),
    this.showButton = true,
    this.onPressed,
    required this.announceText
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: AppTextStyles.cardBorderColor, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LogoWidget(svgImage: svgImage, text: logoText, height: 57, width: 137),
          const SizedBox(height: 25),
          SelectableText(
            infoText,
            style: AppTextStyles.mobileAppInfo,
          ),
          const Spacer(),
          if (showButton)
             Align(
              alignment: Alignment.center,
              child: ButtonWidget(
                announceText: announceText,
                text: 'Узнать подробнее',
                onPressed: onPressed,
              ),
            ),
        ],
      ),
    );
  }
}




import 'package:flutter/material.dart';
import '../constants/app_text_styles.dart';
import 'semantic_text_widget.dart';
import '../../core/helpers/announce_helper.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final double? width;
  final VoidCallback? onPressed;
  final String announceText;
  const ButtonWidget({
    super.key,
    required this.text,
    this.width,
    this.onPressed,
    required this.announceText
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 240,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          AnnounceHelper.announcePolite(announceText);
          if (onPressed != null) {
            onPressed!();
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTextStyles.buttonPrimaryBg,
          foregroundColor: AppTextStyles.buttonPrimaryFg,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 46,
            vertical: 10,
          ),
          elevation: 0,
        ),
        child: SemanticTextWidget(
          semanticLabel: 'Кнопка чтобы узнать подробнее',
          text: text,
          style: AppTextStyles.buttonPrimaryText,
          isButton: true,
        ),
      ),
    );
  }
}

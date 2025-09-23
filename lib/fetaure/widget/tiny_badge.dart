import 'package:flutter/material.dart';
import '../constants/app_text_styles.dart';
import 'semantic_text_widget.dart';


class TinyBadge extends StatelessWidget {
  final String text;
  
  const TinyBadge(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(999),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: SemanticTextWidget(
        text: text,
        style: AppTextStyles.tinyBadgeText,
      ),
    );
  }
}

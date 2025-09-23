import 'package:flutter/material.dart';
import '../constants/app_text_styles.dart';
import 'semantic_text_widget.dart';

class NumberedItemWidget extends StatelessWidget {
  final int number;
  final String text;
  final double fontSize;
  final double spacing;
  final CrossAxisAlignment crossAxisAlignment;

  const NumberedItemWidget({
    super.key,
    required this.number,
    required this.text,
    required this.fontSize,
    required this.spacing,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Номер в кружке
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SemanticTextWidget(
              text: number.toString(),
              style: AppTextStyles.numberedItemNumber,
            ),
          ),
        ),
        SizedBox(width: spacing),
        // Текст
        Expanded(
          child: SelectableText(
             text,
            style: AppTextStyles.numberedItemText.copyWith(fontSize: fontSize),
          ),
        ),
      ],
    );
  }
}

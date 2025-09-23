import 'package:flutter/material.dart';
import '../constants/app_text_styles.dart';
import 'semantic_text_widget.dart';

class SectionHeaderWidget extends StatelessWidget {
  final String title;
  
  const SectionHeaderWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SemanticTextWidget(
      text: title,
      style: AppTextStyles.sectionHeader,
      isHeading: true,
      headingLevel: 2,
    );
  }
}

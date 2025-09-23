import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'semantic_text_widget.dart';


class SectionHeader extends StatelessWidget {
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  
  const SectionHeader( {super.key, required this.title, this.trailing, this.onTap});

  @override
  Widget build(BuildContext context) {
    final headerRow = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 6,
          height: 28,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: SemanticTextWidget(

            text: title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
            isHeading: true,
            headingLevel: 2,
            overflow: TextOverflow.visible,
          ),
        ),
        if (trailing != null) ...[
          const SizedBox(width: 8),
          trailing!,
        ],
      ],
    );

    if (onTap == null) {
      return Container(
        key: key,
        child: headerRow,
      );
    }

    return GestureDetector(
      key: key,
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: headerRow,
    );
  }
}

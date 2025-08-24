import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/app_sizes.dart';

class NavigationButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isActive;
  final bool isMobile;
  
  const NavigationButton({
    super.key,
    required this.title,
    required this.onTap,
    this.isActive = false,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? AppSizes.md : AppSizes.lg,
            vertical: AppSizes.sm,
          ),
          child: Text(
            title,
            style: isActive 
                ? AppTextStyles.navigationSelected
                : (isMobile ? AppTextStyles.navigationMobile : AppTextStyles.navigation),
          ),
        ),
      ),
    );
  }
}

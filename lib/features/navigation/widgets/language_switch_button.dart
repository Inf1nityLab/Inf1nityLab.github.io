import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/providers/language_provider.dart';

class LanguageSwitchButton extends StatelessWidget {
  final bool isMobile;
  
  const LanguageSwitchButton({
    super.key,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, child) {
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: languageProvider.toggleLanguage,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? AppSizes.xs : AppSizes.sm,
                vertical: AppSizes.xs,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.language,
                    size: isMobile ? 20 : 18,
                    color: AppColors.primary,
                  ),
                  SizedBox(width: AppSizes.xs),
                  Text(
                    languageProvider.currentLanguageDisplayName,
                    style: (isMobile ? AppTextStyles.navigationMobile : AppTextStyles.navigation).copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

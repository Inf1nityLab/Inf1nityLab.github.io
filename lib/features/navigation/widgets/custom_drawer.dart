import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/providers/language_provider.dart';
import 'navigation_button.dart';

class CustomDrawer extends StatelessWidget {
  final int currentPageIndex;
  final Function(int) onPageChanged;
  final VoidCallback onClose;
  
  const CustomDrawer({
    super.key,
    required this.currentPageIndex,
    required this.onPageChanged,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, child) {
        return Drawer(
          width: AppSizes.drawerWidth,
          backgroundColor: AppColors.background,
          child: Column(
            children: [
              _buildDrawerHeader(),
              Expanded(
                child: _buildDrawerBody(languageProvider),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDrawerHeader() {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.border,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          // Логотип - увеличенный
          Container(
            width: 104,
            height: 104,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/img/logo.png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.business,
                    color: Colors.white,
                    size: 32,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerBody(LanguageProvider languageProvider) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        // Навигационные элементы
        ...languageProvider.navigationItems.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          return _buildNavigationItem(
            title: item['title']!,
            isActive: currentPageIndex == index,
            onTap: () {
              onPageChanged(index);
              onClose();
            },
          );
        }).toList(),
      ],
    );
  }

  Widget _buildNavigationItem({
    required String title,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.lg,
            vertical: AppSizes.sm, // Уменьшил с md на sm
          ),
          child: Row(
            children: [
              // Маленький синий квадрат слева от текста
              Container(
                width: 3,
                height: 3,
                decoration: BoxDecoration(
                  color: isActive ? AppColors.primary : Colors.transparent,
                  borderRadius: BorderRadius.circular(1.5),
                ),
              ),
              const SizedBox(width: AppSizes.md),
              // Текст навигации
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.navigationMobile.copyWith(
                    color: isActive ? AppColors.primary : AppColors.textPrimary,
                    fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

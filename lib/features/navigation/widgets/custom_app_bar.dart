import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/providers/language_provider.dart';
import 'navigation_button.dart';
import 'language_switch_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int currentPageIndex;
  final Function(int) onPageChanged;
  final VoidCallback onDrawerToggle;
  
  const CustomAppBar({
    super.key,
    required this.currentPageIndex,
    required this.onPageChanged,
    required this.onDrawerToggle,
  });

  @override
  Size get preferredSize => const Size.fromHeight(AppSizes.appBarHeight);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < AppSizes.mobileBreakpoint;
    
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, child) {
        return AppBar(
          backgroundColor: AppColors.background,
          elevation: 0,
          toolbarHeight: AppSizes.appBarHeight, // Устанавливаем высоту AppBar
          titleSpacing: 0, // Убираем стандартные отступы title
          leading: isMobile ? _buildMobileLeading() : _buildDesktopLeading(),
          title: isMobile ? null : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildDesktopLeading(),
              const Spacer(),
              _buildDesktopActions(languageProvider),
            ],
          ),
          actions: isMobile ? [_buildMobileActions()] : null,
          centerTitle: false,
        );
      },
    );
  }

  Widget _buildMobileLeading() {
    return IconButton(
      icon: const Icon(Icons.menu, color: AppColors.textPrimary),
      onPressed: onDrawerToggle,
    );
  }

  Widget _buildDesktopLeading() {
    return Container(
      width: 200, // Фиксированная ширина для логотипа
      height: AppSizes.appBarHeight, // Используем полную высоту AppBar
      padding: EdgeInsets.only(
        left: AppSizes.logoLeftOffset,
        // Убираем top padding для центрирования по вертикали
      ),
      child: Center( // Центрируем логотип по вертикали в AppBar
        child: Image.asset(
          'assets/img/logo.png',
          height: 120,
          width: 120,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            // Fallback если изображение не загружается
            return Container(
              width: 120,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  'LOGO',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  

  Widget _buildMobileActions() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const LanguageSwitchButton(isMobile: true),
        const SizedBox(width: AppSizes.sm),
      ],
    );
  }

  Widget _buildDesktopActions(LanguageProvider languageProvider) {
    return Container(
      height: AppSizes.appBarHeight, // Используем полную высоту AppBar
      child: Center( // Центрируем навигацию по вертикали в AppBar
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Сначала навигационные кнопки
            ...languageProvider.navigationItems.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm),
                child: NavigationButton(
                  title: item['title']!,
                  onTap: () => onPageChanged(index),
                  isActive: currentPageIndex == index,
                ),
              );
            }).toList(),
            
            const SizedBox(width: AppSizes.lg),
            
            // Затем переключатель языка в самом конце
            const LanguageSwitchButton(),
          ],
        ),
      ),
    );
  }
}

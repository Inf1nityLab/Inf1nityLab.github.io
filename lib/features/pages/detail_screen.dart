import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/providers/language_provider.dart';

class DetailScreen extends StatelessWidget {
  final Map<String, dynamic> appData;
  
  const DetailScreen({
    super.key,
    required this.appData,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, child) {
        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            backgroundColor: AppColors.background,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(
              'Детали приложения',
              style: AppTextStyles.h3.copyWith(
                color: AppColors.textPrimary,
                fontSize: 20,
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSizes.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Заголовок приложения
                Center(
                  child: Column(
                    children: [
                      // Иконка приложения
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          appData['icon'] as IconData,
                          size: 40,
                          color: AppColors.primary,
                        ),
                      ),
                      
                      const SizedBox(height: AppSizes.md),
                      
                      // Название приложения
                      Text(
                        _getAppName(appData['icon'] as IconData),
                        style: AppTextStyles.h2.copyWith(
                          fontSize: 28,
                          color: AppColors.textPrimary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: AppSizes.xl),
                
                // Описание приложения
                Text(
                  'Описание',
                  style: AppTextStyles.h3.copyWith(
                    color: AppColors.textPrimary,
                    fontSize: 20,
                  ),
                ),
                
                const SizedBox(height: AppSizes.md),
                
                Text(
                  appData['description'] as String,
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.textSecondary,
                    height: 1.6,
                  ),
                ),
                
                const SizedBox(height: AppSizes.xl),
                
                // Дополнительная информация
                _buildInfoSection(
                  title: 'Функции',
                  items: _getAppFeatures(appData['icon'] as IconData),
                ),
                
                const SizedBox(height: AppSizes.lg),
                
                _buildInfoSection(
                  title: 'Преимущества',
                  items: _getAppBenefits(appData['icon'] as IconData),
                ),
                
                const SizedBox(height: AppSizes.xl),
                
                // Кнопка "Скачать приложение"
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        // Здесь можно добавить логику для скачивания
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Переход к скачиванию приложения...'),
                            backgroundColor: AppColors.primary,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                      ),
                      child: Text(
                        'Скачать приложение',
                        style: AppTextStyles.button.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: AppSizes.xl),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildInfoSection({
    required String title,
    required List<String> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.h3.copyWith(
            color: AppColors.textPrimary,
            fontSize: 18,
          ),
        ),
        
        const SizedBox(height: AppSizes.sm),
        
        ...items.map((item) => Padding(
          padding: const EdgeInsets.only(bottom: AppSizes.xs),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 6,
                height: 6,
                margin: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: AppSizes.sm),
              Expanded(
                child: Text(
                  item,
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        )).toList(),
      ],
    );
  }

  String _getAppName(IconData icon) {
    switch (icon) {
      case Icons.phone_android:
        return 'Be My Eyes';
      case Icons.accessibility:
        return 'OsmAnd';
      case Icons.visibility_off:
        return 'Tap Tap See';
      default:
        return 'Мобильное приложение';
    }
  }

  List<String> _getAppFeatures(IconData icon) {
    switch (icon) {
      case Icons.phone_android:
        return [
          'Видеозвонки в реальном времени',
          'Подключение к волонтерам по всему миру',
          'Бесплатное использование',
          'Простой и интуитивный интерфейс',
        ];
      case Icons.accessibility:
        return [
          'Офлайн карты и навигация',
          'Голосовые подсказки',
          'Поддержка экранных дикторов',
          'Маршруты для разных видов транспорта',
        ];
      case Icons.visibility_off:
        return [
          'Распознавание объектов через камеру',
          'Голосовое описание окружения',
          'Интеграция с VoiceOver',
          'Фото и видео с озвучкой',
        ];
      default:
        return ['Функция 1', 'Функция 2', 'Функция 3'];
    }
  }

  List<String> _getAppBenefits(IconData icon) {
    switch (icon) {
      case Icons.phone_android:
        return [
          'Помощь в реальном времени',
          'Доступность для незрячих людей',
          'Глобальное сообщество волонтеров',
          'Быстрое решение повседневных задач',
        ];
      case Icons.accessibility:
        return [
          'Независимость в навигации',
          'Работа без интернета',
          'Доступность для всех пользователей',
          'Подробные карты и маршруты',
        ];
      case Icons.visibility_off:
        return [
          'Улучшенное восприятие окружения',
          'Независимость в повседневной жизни',
          'Технология искусственного интеллекта',
          'Простота использования',
        ];
      default:
        return ['Преимущество 1', 'Преимущество 2', 'Преимущество 3'];
    }
  }
}

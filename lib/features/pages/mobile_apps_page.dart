import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/providers/language_provider.dart';
import 'detail_screen.dart';

class MobileAppsPage extends StatelessWidget {
  const MobileAppsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, child) {
        final width = MediaQuery.of(context).size.width;
        final isMobile = width < AppSizes.mobileBreakpoint;
        
        // Данные для контейнеров
        final List<Map<String, dynamic>> appData = [
          {
            'icon': Icons.phone_android,
            'description': 'Be My Eyes — это бесплатное мобильное приложение, которое соединяет незрячих и слабовидящих людей с волонтёрами со всего мира для получения зрительной помощи через видеозвонок. Пользователь запускает приложение, и волонтёр в режиме реального времени помогает ему, например, прочитать надпись, распознать предмет или найти нужную вещь.',
          },
          {
            'icon': Icons.accessibility,
            'description': 'OsmAnd — это офлайн-картографическое приложение с голосовой навигацией, которое позволяет ориентироваться без подключения к интернету. Оно поддерживает подробные карты, маршруты для пешеходов, автомобилистов и велосипедистов, а также совместимо с экранными дикторами, что делает его удобным для незрячих пользователей.',
          },
          {
            'icon': Icons.visibility_off,
            'description': 'Tap Tap See - это мобильное приложение для камеры, разработанное  для слепых и слабовидящих пользователей. TapTapSee использует камеру вашего устройства и функции VoiceOver, чтобы сделать снимок или видео чего-либо и озвучить это для вас.',
          },
        ];
        
        // Вычисляем общую ширину контейнеров и отступов
        final containerWidth = 384.0;
        final containerSpacing = 24.0;
        final totalWidth = (containerWidth * appData.length) + (containerSpacing * (appData.length - 1));
        
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Заголовок "МОБИЛЬНЫЕ ПРИЛОЖЕНИЯ"
            Padding(
              padding: const EdgeInsets.only(top: 54.0),
              child: Text(
                'МОБИЛЬНЫЕ ПРИЛОЖЕНИЯ',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  height: 1.0,
                  color: const Color(0xFF00367D),
                ),
              ),
            ),
            
            // Отступ после заголовка
            const SizedBox(height: 35),
            
            // Контейнер с горизонтальным скроллом
            SizedBox(
              height: 450,
              child: isMobile 
                ? _buildMobileCarousel(appData)
                : _buildDesktopScrollView(appData, containerWidth, containerSpacing, totalWidth, context),
            ),
            const SizedBox(height: 54),
          ],
        );
      },
    );
  }

  // Метод для мобильной карусели
  Widget _buildMobileCarousel(List<Map<String, dynamic>> appData) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 450,
        viewportFraction: 0.85, // Показывает 85% ширины экрана
        enlargeCenterPage: true, // Центральный элемент увеличен
        enlargeFactor: 0.1, // Небольшое увеличение центрального элемента
        autoPlay: true, // Автоматическое прокручивание
        autoPlayInterval: const Duration(seconds: 4), // Интервал 4 секунды
        autoPlayAnimationDuration: const Duration(milliseconds: 800), // Длительность анимации
        autoPlayCurve: Curves.easeInOut, // Плавная анимация
        enableInfiniteScroll: true, // Бесконечная прокрутка
        initialPage: 0,
        scrollDirection: Axis.horizontal,
      ),
      items: appData.map((app) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFF949494),
                  width: 1,
                ),
                // Добавляю скругление для мобильной версии
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0), // Уменьшаю отступы для мобильной версии
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Логотип
                    Icon(
                      app['icon'] as IconData,
                      size: 40, // Уменьшаю размер иконки для мобильной версии
                      color: AppColors.primary,
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Текст
                    Text(
                      app['description'] as String,
                      style: TextStyle(
                        fontFamily: 'Instrument Sans',
                        fontWeight: FontWeight.w400,
                        fontSize: 14, // Уменьшаю размер шрифта для мобильной версии
                        height: 1.4,
                        color: const Color(0xFF000000),
                      ),
                    ),
                    
                    const Spacer(),
                    
                    // Кнопка "Узнать подробнее"
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: double.infinity, // Кнопка на всю ширину для мобильной версии
                        height: 44, // Уменьшаю высоту кнопки
                        child: ElevatedButton(
                          onPressed: () {
                            // Переход на экран деталей
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                  appData: app,
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF00367D),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Узнать подробнее',
                            style: TextStyle(
                              fontFamily: 'Instrument Sans',
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              height: 1.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  // Метод для десктопной версии (оставляю как было)
  Widget _buildDesktopScrollView(
    List<Map<String, dynamic>> appData, 
    double containerWidth, 
    double containerSpacing, 
    double totalWidth,
      BuildContext context
  ) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Center(
        child: SizedBox(
          width: totalWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(appData.length, (index) {
              final app = appData[index];
              return Container(
                width: containerWidth,
                height: 450,
                margin: EdgeInsets.only(
                  right: index < appData.length - 1 ? containerSpacing : 0,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFF949494),
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Логотип
                      Icon(
                        app['icon'] as IconData,
                        size: 48,
                        color: AppColors.primary,
                      ),
                      
                      const SizedBox(height: 20),
                      
                      // Текст
                      Text(
                        app['description'] as String,
                        style: TextStyle(
                          fontFamily: 'Instrument Sans',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          height: 1.0,
                          color: const Color(0xFF000000),
                        ),
                      ),
                      
                      const Spacer(),
                      
                      // Кнопка "Узнать подробнее"
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 240,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              // Переход на экран деталей
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                    appData: app,
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF00367D),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 46,
                                vertical: 10,
                              ),
                            ),
                            child: Text(
                              'Узнать подробнее',
                              style: TextStyle(
                                fontFamily: 'Instrument Sans',
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                height: 1.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
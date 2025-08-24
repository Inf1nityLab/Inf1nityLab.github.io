import 'package:flutter/material.dart';
import '../../../core/constants/app_sizes.dart';

class BottomPart extends StatelessWidget {
  const BottomPart({super.key});

  TextStyle get _body12 => const TextStyle(
        fontFamily: 'Instrument Sans',
        fontWeight: FontWeight.w400,
        fontSize: 12,
        height: 1.0,
        color: Colors.black,
      );

  Widget _buildDescriptionText() {
    return RichText(
      text: TextSpan(
        style: _body12,
        children: const [
          TextSpan(text: 'Цифровое решение '),
          TextSpan(
            text: '"Поводырь"',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          TextSpan(
            text:
                ' разработано в рамках Финансируемого Европейским Союзом проект «Мониторинг юстиции – Укрепление гражданского общества в продвижении прав человека в Кыргызстане». Проект направлен на усиление роли гражданского общества в мониторинге правовых реформ и защите прав человека в Кыргызстане.\n\nПроект реализуется консорциумом во главе с Фондом им. Конрада Аденауэра в сотрудничестве с Фондом Макса Планка за международный мир и верховенство права, экологическим движением «БИОМ» и женской ассоциацией «Алга».',
          ),
        ],
      ),
    );
  }

  List<String> get _logoUrls => const [
        'assets/img/eu.png',
        'assets/img/konrad.png',
        'assets/img/biom.png',
    'assets/img/alga.png',
    'assets/img/mpfpr.png',
      ];

  Widget _buildLogosList() {
    return SizedBox(
      height: 69,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          width: 120,
          height: 69,
          decoration: BoxDecoration(
            color: Colors.white, // Белый фон для логотипов
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: const Color(0xFFE2E8F0), // Светло-серая рамка
              width: 1,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.all(8.0), // Отступы для логотипов
              child: Image.asset(
                _logoUrls[index],
                fit: BoxFit.contain, // Сохраняем пропорции изображений
                errorBuilder: (context, error, stackTrace) {
                  // Fallback если изображение не загружается
                  return Center(
                    child: Text(
                      'Logo ${index + 1}',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemCount: _logoUrls.length,
      ),
    );
  }

  Widget _buildDisclaimerText() {
    return Text(
      'Содержание данного сайта не отражает официальной точки зрения Европейского Союза, содержание данного сайта отражает исключительно точку зрения автора.',
      style: _body12,
    );
  }

  List<String> get _imageUrls => const [
        'assets/img/qr.png',
        'assets/img/qr.png',
        'assets/img/qr.png',
        'assets/img/qr.png',
      ];

  Widget _buildImagesGrid() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < AppSizes.mobileBreakpoint;
        
        if (isMobile) {
          // Мобильная версия: grid на всю ширину с 4 элементами
          final itemWidth = (constraints.maxWidth - 32 - 30) / 4; // 32 - padding, 30 - spacing
          
          return Wrap(
            spacing: 10,
            runSpacing: 10,
            children: _imageUrls.asMap().entries.map((entry) {
              final index = entry.key;
              final text = entry.value;
              return Container(
                width: itemWidth,
                height: itemWidth, // Квадратные QR-коды
                decoration: BoxDecoration(
                  color: Colors.white, // Белый фон для QR-кодов
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color(0xFFE2E8F0), // Светло-серая рамка
                    width: 1,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0), // Меньшие отступы для мобильной версии
                    child: Image.asset(
                      text,
                      fit: BoxFit.contain, // Сохраняем пропорции изображений
                      errorBuilder: (context, error, stackTrace) {
                        // Fallback если изображение не загружается
                        return Center(
                          child: Text(
                            'QR ${index + 1}',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 12, // Меньший шрифт для мобильной версии
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        } else {
          // Десктопная версия: фиксированная ширина 120px
          return Wrap(
            spacing: 10,
            runSpacing: 10,
            children: _imageUrls.asMap().entries.map((entry) {
              final index = entry.key;
              final text = entry.value;
              return Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white, // Белый фон для QR-кодов
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color(0xFFE2E8F0), // Светло-серая рамка
                    width: 1,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0), // Отступы для QR-кодов
                    child: Image.asset(
                      text,
                      fit: BoxFit.contain, // Сохраняем пропорции изображений
                      errorBuilder: (context, error, stackTrace) {
                        // Fallback если изображение не загружается
                        return Center(
                          child: Text(
                            'QR ${index + 1}',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final bool isMobile = width < AppSizes.mobileBreakpoint; // < 768
    final bool isTablet = width >= AppSizes.mobileBreakpoint && width < AppSizes.desktopBreakpoint; // 768..1199

    final List<Widget> leftSection = [
      _buildDescriptionText(),
      const SizedBox(height: 15),
      _buildLogosList(),
    ];

    final List<Widget> rightSection = [
      _buildDisclaimerText(),
      const SizedBox(height: 15),
      _buildImagesGrid(),
    ];

    return Container(
      width: double.infinity,
      height: (isMobile || isTablet) ? null : 300, // Авто на моб/планшете, фикс 300 на десктопе
      color: const Color(0xFFD9D9D9),
      child: (isMobile || isTablet)
          ? Padding(
              padding: EdgeInsets.all(isMobile ? 16 : 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...leftSection,
                  const SizedBox(height: 15),
                  ...rightSection,
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.fromLTRB(120, 50, 120, 35),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: leftSection,
                    ),
                  ),
                  const SizedBox(width: 40),
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: rightSection,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

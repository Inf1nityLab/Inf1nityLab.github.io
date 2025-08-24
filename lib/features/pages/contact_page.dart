import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/providers/language_provider.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, child) {
        final double width = MediaQuery.of(context).size.width;
        final bool isMobile = width < AppSizes.mobileBreakpoint; // < 768
        final bool isTablet = width >= AppSizes.mobileBreakpoint && width < AppSizes.desktopBreakpoint; // 768..1199

        // Адаптивные размеры левого контейнера
        final double leftWidth = isMobile ? double.infinity : (isTablet ? 600 : 720);
        final double leftHeight = isMobile ? 530 : (isTablet ? 560 : 500); // Увеличил высоту для мобильного и планшета
        final double leftPadding = isMobile ? 16 : (isTablet ? 24 : 32);

        // Социальные сети с иконками
        final List<Map<String, dynamic>> socialNetworks = [
          {'name': 'Instagram', 'icon': Icons.camera_alt},
          {'name': 'Telegram', 'icon': Icons.send},
          {'name': 'Facebook', 'icon': Icons.facebook},
          {'name': 'Email', 'icon': Icons.email},
        ];

        // Адаптивные размеры полей
        final double fieldHeight = isMobile ? 44 : (isTablet ? 48 : 40); // Увеличил высоту для мобильного и планшета
        final double buttonWidth = isMobile ? 180 : 240; // Уменьшил для мобильного
        final double buttonHeight = isMobile ? 36 : 40; // Увеличил для мобильного

        Widget buildSocialIcon(Map<String, dynamic> social) {
          if (isMobile || isTablet) {
            // Горизонтальные иконки для мобильного/планшета с PNG изображениями без фона
            return Container(
              width: 48,
              height: 48,
              child: Image.asset(
                'assets/img/${_getImageName(social['name'])}.png',
                width: 48,
                height: 48,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  // Fallback на иконку если изображение не загружается
                  return Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFF58B9CF),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Icon(
                      social['icon'] as IconData,
                      color: Colors.white,
                      size: 24,
                    ),
                  );
                },
              ),
            );
          } else {
            // Вертикальные кнопки для десктопа
            return SizedBox(
              width: 180,
              height: 60,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF58B9CF),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    height: 1.0,
                  ),
                ),
                child: Text(social['name']),
              ),
            );
          }
        }

        final Widget leftPanel = Container(
          width: leftWidth,
          height: leftHeight,
          decoration: BoxDecoration(
            color: const Color(0xFF00367D),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(leftPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Заголовок
              Text(
                'Мы ценим ваше мнение!',
                style: TextStyle(
                  fontFamily: 'Instrument Sans',
                  fontWeight: FontWeight.w700,
                  fontSize: isMobile ? 20 : 24,
                  height: 1.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: isMobile ? 12 : 16),
              // Подзаголовок
              Text(
                'Напишите нам, если у вас есть предложения, пожелания или замечания — или если вы столкнулись с трудностями при использовании сайта и приложений',
                style: TextStyle(
                  fontFamily: 'Instrument Sans',
                  fontWeight: FontWeight.w700,
                  fontSize: isMobile ? 12 : 14,
                  height: 1.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: isMobile ? 16 : 32), // Уменьшил отступ для мобильного
              // Row с двумя TextFormField (адаптивно)
              if (isMobile)
                // Мобильный: вертикально
                Column(
                  children: [
                    _buildFormField('1. Ваше имя', fieldHeight),
                    const SizedBox(height: 16),
                    _buildFormField('2. Электронная почта или телефон', fieldHeight),
                  ],
                )
              else
                // Планшет/десктоп: горизонтально
                Row(
                  children: [
                    Expanded(
                      child: _buildFormField('1. Ваше имя', fieldHeight),
                    ),
                    SizedBox(width: isTablet ? 12 : 16),
                    Expanded(
                      child: _buildFormField('2. Электронная почта или телефон', fieldHeight),
                    ),
                  ],
                ),
              SizedBox(height: isMobile ? 24 : 24), // Уменьшил отступ для мобильного
              // Поле для сообщения
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '3. Ваше сообщение',
                    style: TextStyle(
                      fontFamily: 'Instrument Sans',
                      fontWeight: FontWeight.w600,
                      fontSize: isMobile ? 12 : 14,
                      height: 1.0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: isMobile ? 80 : (isTablet ? 90 : 100), // Увеличил высоту для мобильного и планшета
                    child: TextFormField(
                      maxLines: isMobile ? 3 : (isTablet ? 4 : 5), // Адаптивное количество строк
                      textAlignVertical: TextAlignVertical.top, // Для многострочного поля выравниваем по верху
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        // Адаптивные отступы для разных размеров экрана
                        contentPadding: EdgeInsets.all(isMobile ? 16 : (isTablet ? 18 : 16)), // Увеличил отступы для мобильного и планшета
                        // Убираем лишние отступы для мобильного
                        isDense: false, // Отключаем isDense для лучшего выравнивания
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: isMobile ? 20 : 20), // Уменьшил отступ для мобильного
              // Checkbox с согласием
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 14.864458084106445,
                    height: 15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 2),
                      color: Colors.transparent,
                    ),
                    child: Checkbox(
                      value: false,
                      onChanged: (value) {},
                      activeColor: Colors.white,
                      checkColor: const Color(0xFF00367D),
                      side: BorderSide.none,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Я даю согласие на обработку моих персональных данных в целях рассмотрения обращения и обратной связи, в соответствии с Законом КР «О персональных данных»',
                      style: TextStyle(
                        fontFamily: 'Instrument Sans',
                        fontWeight: FontWeight.w400,
                        fontSize: isMobile ? 12 : 14,
                        height: 1.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: isMobile ? 24 : 24), // Уменьшил отступ для мобильного
              // Кнопка "Отправить" по центру
              Center(
                child: SizedBox(
                  width: buttonWidth,
                  height: buttonHeight,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF58B9CF),
                      foregroundColor: const Color(0xFF00367D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      textStyle: TextStyle(
                        fontFamily: 'Instrument Sans',
                        fontWeight: FontWeight.w700,
                        fontSize: isMobile ? 14 : 16,
                        height: 1.0,
                      ),
                    ),
                    child: const Text('Отправить'),
                  ),
                ),
              ),
            ],
          ),
        );

        final Widget rightPanel = Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Подписывайтесь на нас!',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: isMobile ? 20 : 24,
                height: 1.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: isMobile ? 16 : 24),
            // Социальные сети (только для мобильного и десктопа)
            if (isMobile)
              // Горизонтально для мобильного
              Wrap(
                spacing: 16,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: socialNetworks.map((social) => buildSocialIcon(social)).toList(),
              )
            else if (!isTablet)
              // Вертикально для десктопа (не планшета)
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < socialNetworks.length; i++) ...[
                    buildSocialIcon(socialNetworks[i]),
                    if (i != socialNetworks.length - 1) const SizedBox(height: 16),
                  ],
                ],
              ),
          ],
        );

        // Контент секции (адаптивный)
        final Widget content = isMobile
            ? Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  leftPanel,
                  const SizedBox(height: 24),
                  rightPanel,
                  const SizedBox(height: 47), // Отступ 47 после формы
                ],
              )
            : isTablet
                ? Column(
                    // Планшет: левый контейнер + социальные сети снизу
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      leftPanel,
                      const SizedBox(height: 24),
                      // Социальные сети для планшета (горизонтально с иконками)
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Подписывайтесь на нас!',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                              height: 1.0,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Wrap(
                            spacing: 16,
                            runSpacing: 12,
                            alignment: WrapAlignment.center,
                            children: socialNetworks.map((social) => buildSocialIcon(social)).toList(),
                          ),
                        ],
                      ),
                      const SizedBox(height: 47), // Отступ 47 после формы
                    ],
                  )
                : Column(
                    // Десктоп: левый контейнер + правая панель
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          leftPanel,
                          const SizedBox(width: 93),
                          rightPanel,
                        ],
                      ),
                      const SizedBox(height: 47), // Отступ 47 после формы
                    ],
                  );

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'СВЯЗАТЬСЯ С НАМИ',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: isMobile ? 20 : 24,
                height: 1.0,
                color: const Color(0xFF00367D),
              ),
            ),
            const SizedBox(height: 35),
            // Центрируем секцию и добавляем адаптивные внешние отступы
            Padding(
              padding: AppSizes.getContentPadding(context),
              child: Center(
                child: content,
              ),
            ),
          ],
        );
      },
    );
  }

  // Вспомогательный метод для создания полей формы
  Widget _buildFormField(String label, double height) {
    final bool isMobile = height >= 44; // Определяем мобильный по высоте поля
    final bool isTablet = height >= 48; // Определяем планшет по высоте поля
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Instrument Sans',
            fontWeight: FontWeight.w600,
            fontSize: 14,
            height: 1.0,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: height,
          child: TextFormField(
            textAlignVertical: TextAlignVertical.center, // Центрируем текст по вертикали
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              // Правильные отступы для центрирования текста
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: isMobile ? 12 : (isTablet ? 14 : 12), // Адаптивные отступы
              ),
              // Отключаем isDense для лучшего выравнивания
              isDense: false,
            ),
          ),
        ),
      ],
    );
  }

  // Вспомогательный метод для получения имени изображения
  String _getImageName(String socialName) {
    switch (socialName.toLowerCase()) {
      case 'instagram':
        return 'instagram';
      case 'telegram':
        return 'telegram';
      case 'facebook':
        return 'facebook';
      case 'email':
        return 'email';
      default:
        return 'instagram'; // fallback
    }
  }
}

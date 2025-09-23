import 'package:flutter/material.dart';

import '../data/contact_screen_data.dart';
import '../widget/section_header_widget.dart';
import '../widget/semantic_text_widget.dart';
import '../../core/helpers/announce_helper.dart';
import 'package:provider/provider.dart';
import '../providers/contact_form_provider.dart';

import '../constants/app_text_styles.dart';

class ContactScreen extends StatefulWidget {
  final bool isDesktop;
  final bool isTablet;
  final bool isMobile;
  
  const ContactScreen({
    super.key, 
    required this.isDesktop, 
    required this.isTablet, 
    required this.isMobile
  });

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _consent = false;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final contactData = ContactScreenData.getContactScreenData(context);
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController messageController = TextEditingController();
    
    // Определяем размеры экрана
    final bool isMobileScreen = width < 768.0;
    final bool isTabletScreen = width >= 768.0 && width < 1200.0;
    
    // Адаптивные размеры левого контейнера
    final double leftWidth = isMobileScreen ? double.infinity : (isTabletScreen ? 600.0 : 600.0);
    final double leftPadding = isMobileScreen ? 20.0 : (isTabletScreen ? 18.0 : 20.0);
    
    // Адаптивные размеры полей
    final double fieldHeight = isMobileScreen ? 44.0 : (isTabletScreen ? 48.0 : 50.0);
    final double buttonHeight = isMobileScreen ? 44.0 : (isTabletScreen ? 48.0 : 50.0);
    final double buttonWidth = isMobileScreen ? double.infinity : (isTabletScreen ? 200.0 : 200.0);
    final double socialButtonWidth = 200.0;
    final double socialButtonHeight = 50.0;

    // Социальные сети
    final List<Map<String, dynamic>> socialNetworks = [
      {'name': 'Instagram', 'icon': Icons.camera_alt, 'image': 'assets/img/instagram.png'},
      {'name': 'Telegram', 'icon': Icons.send, 'image': 'assets/img/telegram.png'},
      {'name': 'Facebook', 'icon': Icons.facebook, 'image': 'assets/img/facebook.png'},
      {'name': 'Email', 'icon': Icons.email, 'image': 'assets/img/email.png'},
    ];

    Widget buildSocialIcon(Map<String, dynamic> social) {
      if (isMobileScreen || isTabletScreen) {
        // Горизонтальные иконки для мобильного/планшета с PNG изображениями без фона
        return SizedBox(
          width: 40.0,
          height: 40.0,
          child: Image.asset(
            'assets/img/${_getImageName(social['name'])}.png',
            width: 40.0,
            height: 40.0,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              // Fallback на иконку если изображение не загружается
              return Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  color: AppTextStyles.contactAccent,
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
          width: socialButtonWidth,
          height: socialButtonHeight,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTextStyles.contactAccent,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              textStyle: AppTextStyles.socialButton,
            ),
            child: SemanticTextWidget(
              text: social['name'],
              isButton: true,
            ),
          ),
        );
      }
    }

    final Widget leftPanel = Container(
      width: leftWidth,

      decoration: BoxDecoration(
        color: AppTextStyles.contactBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(leftPadding),
      child: Form(
        key: _formKey,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Заголовок
          SemanticTextWidget(
            text: contactData.subtitle,
            style: isMobileScreen ? AppTextStyles.contactTitleMobile : AppTextStyles.contactTitle,
            isHeading: true,
            headingLevel: 1,
          ),
          SizedBox(height: isMobileScreen ? 16.0 : 20.0),
          // Подзаголовок
          SemanticTextWidget(
            text: contactData.subtitle,
            style: isMobileScreen ? AppTextStyles.contactSubtitleMobile : AppTextStyles.contactSubtitle,
            isHeading: true,
            headingLevel: 2,
          ),
          SizedBox(height: isMobileScreen ? 16.0 : 20.0),
          // Row с двумя TextFormField (адаптивно)
          if (isMobileScreen)
            // Мобильный: вертикально
            Column(
              children: [
                _buildFormField(
                  contactData.nameLabel,
                  fieldHeight,
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      final code = Localizations.localeOf(context).languageCode;
                      return code == 'ky' ? 'Атыңызды жазыңыз' : 'Введите имя';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                _buildFormField(
                  contactData.emailLabel,
                  fieldHeight,
                  controller: emailController,
                  validator: (value) {
                    final code = Localizations.localeOf(context).languageCode;
                    if (value == null || value.trim().isEmpty) {
                      return code == 'ky' ? 'Email жазыңыз' : 'Введите email';
                    }
                    final email = value.trim();
                    final regex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
                    if (!regex.hasMatch(email)) {
                      return code == 'ky' ? 'Туура email жазыңыз' : 'Введите корректный email';
                    }
                    return null;
                  },
                ),
              ],
            )
          else
            // Планшет/десктоп: горизонтально
            Row(
              children: [
                Expanded(
                  child: _buildFormField(
                    contactData.nameLabel,
                    fieldHeight,
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        final code = Localizations.localeOf(context).languageCode;
                        return code == 'ky' ? 'Атыңызды жазыңыз' : 'Введите имя';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(width: isTabletScreen ? 12.0 : 16.0),
                Expanded(
                  child: _buildFormField(
                    contactData.emailLabel,
                    fieldHeight,
                    controller: emailController,
                    validator: (value) {
                      final code = Localizations.localeOf(context).languageCode;
                      if (value == null || value.trim().isEmpty) {
                        return code == 'ky' ? 'Email жазыңыз' : 'Введите email';
                      }
                      final email = value.trim();
                      final regex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
                      if (!regex.hasMatch(email)) {
                        return code == 'ky' ? 'Туура email жазыңыз' : 'Введите корректный email';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          SizedBox(height: 20.0),
          // Поле для сообщения
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SemanticTextWidget(
                text: contactData.messageLabel,
                style: isMobileScreen ? AppTextStyles.contactFieldLabelMobile : AppTextStyles.contactFieldLabel,
                isHeading: true,
                headingLevel: 3,
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: isMobileScreen ? 80.0 : (isTabletScreen ? 90.0 : 100.0),
                child: TextFormField(
                  controller: messageController,
                  maxLines: isMobileScreen ? 3 : (isTabletScreen ? 4 : 5),
                  textAlignVertical: TextAlignVertical.top,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      final code = Localizations.localeOf(context).languageCode;
                      return code == 'ky' ? 'Билдирүүнү жазыңыз' : 'Введите сообщение';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppTextStyles.contactFieldBackground,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.all(isMobileScreen ? 16.0 : (isTabletScreen ? 18.0 : 20.0)),
                    isDense: false,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: isMobileScreen ? 20 : 20),
          // Checkbox с согласием
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 20.0,
                height: 20.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white, width: 2.0),
                  color: Colors.transparent,
                ),
                child: Checkbox(
                  value: _consent,
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() {
                      _consent = value;
                    });
                  },
                  activeColor: Colors.white,
                  checkColor: AppTextStyles.contactBackground,
                  side: BorderSide.none,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity.compact,
                ),
              ),
              SizedBox(width: 12.0),
              Expanded(
                child: SemanticTextWidget(
                  text: contactData.consentText,
                  style: isMobileScreen ? AppTextStyles.contactConsentTextMobile : AppTextStyles.contactConsentText,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          // Кнопка "Отправить" по центру
          Center(
            child: SizedBox(
              width: buttonWidth,
              height: buttonHeight,
              child: Consumer<ContactFormProvider>(
                builder: (context, form, _) {
                  return ElevatedButton(
                    onPressed: form.isSending
                        ? null
                        : () async {
                            final code = Localizations.localeOf(context).languageCode;
                            if (!_consent) {
                              final msg = code == 'ky' ? 'Маалыматтарды иштетүүгө макул болуңуз' : 'Согласитесь на обработку персональных данных';
                              AnnounceHelper.announcePolite(msg);
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
                              }
                              return;
                            }
                            if (!(_formKey.currentState?.validate() ?? false)) {
                              final msg = code == 'ky' ? 'Талааларды туура толтуруңуз' : 'Заполните поля корректно';
                              AnnounceHelper.announcePolite(msg);
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
                              }
                              return;
                            }
                            final sendingMsg = code == 'ky' ? 'Билдирүү жөнөтүлүүдө...' : 'Сообщение отправляется...';
                            AnnounceHelper.announcePolite(sendingMsg);

                            final ok = await form.sendEmail(
                              serviceId: 'service_x3fqs91',
                              templateId: 'template_2dwrzje',
                              userId: 'mpo94eyolTRmHeEFp',
                              templateParams: {
                                'from_name': nameController.text.trim(),
                                'reply_to': emailController.text.trim(),
                                'message': messageController.text.trim(),
                              },
                            );

                            final successMsg = code == 'ky' ? 'Билдирүү ийгиликтүү жөнөтүлдү' : 'Сообщение успешно отправлено';
                            final errorMsg = code == 'ky' ? 'Ката: билдирүү жөнөтүлгөн жок' : 'Ошибка: сообщение не отправлено';
                            AnnounceHelper.announcePolite(ok ? successMsg : errorMsg);
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(ok ? successMsg : errorMsg)),
                              );
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTextStyles.contactAccent,
                      foregroundColor: AppTextStyles.contactBackground,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      textStyle: isMobileScreen ? AppTextStyles.contactButtonMobile : AppTextStyles.contactButton,
                    ),
                    child: form.isSending
                        ? const SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                          )
                        : SemanticTextWidget(
                            text: contactData.sendButton,
                            isButton: true,
                          ),
                  );
                },
              ),
            ),
          ),

        ],
      ),
    ));

    final Widget rightPanel = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SemanticTextWidget(
          text: contactData.socialTitle,
          style: isMobileScreen ? AppTextStyles.socialTitleMobile : AppTextStyles.socialTitle,
          isHeading: true,
          headingLevel: 2,
        ),
        SizedBox(height: isMobileScreen ? 16.0 : 20.0),
        // Социальные сети (только для мобильного и десктопа)
        if (isMobileScreen)
          // Горизонтально для мобильного
          Wrap(
            spacing: 16.0,
            runSpacing: 16.0,
            alignment: WrapAlignment.center,
            children: socialNetworks.map((social) => buildSocialIcon(social)).toList(),
          )
        else if (!isTabletScreen)
          // Вертикально для десктопа (не планшета)
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < socialNetworks.length; i++) ...[
                buildSocialIcon(socialNetworks[i]),
                if (i != socialNetworks.length - 1) SizedBox(height: 16.0),
              ],
            ],
          ),
      ],
    );

    // Контент секции (адаптивный)
    final Widget content = isMobileScreen
        ? Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leftPanel,
              const SizedBox(height: 24),
              rightPanel,
              const SizedBox(height: 47),
            ],
          )
        : isTabletScreen
            ? Column(
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
                        contactData.socialTitle,
                        style: AppTextStyles.socialTitle,
                      ),
                      SizedBox(height: 20.0),
                      Wrap(
                        spacing: 16.0,
                        runSpacing: 16.0,
                        alignment: WrapAlignment.center,
                        children: socialNetworks.map((social) => buildSocialIcon(social)).toList(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 47),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: leftPanel,
                  ),
                  SizedBox(width: 93.0),
                  Expanded(
                    flex: 1,
                    child: rightPanel,
                  ),
                ],
              );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SectionHeaderWidget(title: contactData.title),
        SizedBox(height: 35.0),
        // Центрируем секцию и добавляем адаптивные внешние отступы
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobileScreen ? 16 : (isTabletScreen ? 50 : 100),
          ),
          child: Center(
            child: content,
          ),
        ),
        const SizedBox(height: 54),
      ],
    );
  }

  // Вспомогательный метод для создания полей формы
  Widget _buildFormField(String label, double height, {TextEditingController? controller, String? Function(String?)? validator}) {
    final bool isMobile = height >= 44; // Определяем мобильный по высоте поля
    final bool isTablet = height >= 48; // Определяем планшет по высоте поля
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SemanticTextWidget(
          text: label,
          style: AppTextStyles.contactFieldLabel,
          isHeading: true,
          headingLevel: 3,
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: height,
          child: TextFormField(
            controller: controller,
            textAlignVertical: TextAlignVertical.center, // Центрируем текст по вертикали
            validator: validator,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppTextStyles.contactFieldBackground,
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
    return switch (socialName.toLowerCase()) {
      'instagram' => 'instagram',
      'telegram' => 'telegram',
      'facebook' => 'facebook',
      'email' => 'email',
      _ => 'instagram', // fallback
    };
  }
}
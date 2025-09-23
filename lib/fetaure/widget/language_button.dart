
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/app_text_styles.dart';
import '../../core/providers/locale_provider.dart';
import 'semantic_text_widget.dart';
import '../../core/helpers/announce_helper.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleProvider>(
      builder: (context, localeProvider, child) {
        return IconButton(
          onPressed: () {
            localeProvider.toggleLanguage();
            final currentLocale = localeProvider.currentLocale;
            final code = currentLocale.languageCode;
            final message = code == 'ky'
                ? 'Тил кыргыз тили болуп коюлду'
                : 'Язык переключен на русский ';
            AnnounceHelper.announcePolite(message);
          },
          icon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.language,
                color: const Color(0xFF000000),
              ),
              const SizedBox(width: 4),
              SemanticTextWidget(
                text: localeProvider.getLanguageName(localeProvider.getNextLocale()),
                style: AppTextStyles.languageButtonText,
                isButton: true,
              )
            ],
          ),
        );
      },
    );
  }
}

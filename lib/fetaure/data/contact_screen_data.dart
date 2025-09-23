import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';

class ContactScreenData {
  final String title;
  final String subtitle;
  final String nameLabel;
  final String emailLabel;
  final String messageLabel;
  final String consentText;
  final String sendButton;
  final String socialTitle;

  ContactScreenData({
    required this.title,
    required this.subtitle,
    required this.nameLabel,
    required this.emailLabel,
    required this.messageLabel,
    required this.consentText,
    required this.sendButton,
    required this.socialTitle,
  });

  static ContactScreenData getContactScreenData(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return ContactScreenData(
      title: l10n.contactTitle,
      subtitle: l10n.contactSubtitle,
      nameLabel: l10n.contactNameLabel,
      emailLabel: l10n.contactEmailLabel,
      messageLabel: l10n.contactMessageLabel,
      consentText: l10n.contactConsentText,
      sendButton: l10n.contactSendButton,
      socialTitle: l10n.contactSocialTitle,
    );
  }
}

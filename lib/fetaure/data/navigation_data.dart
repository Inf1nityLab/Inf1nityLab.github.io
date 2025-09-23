import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';

class NavigationData {
  static List<String> getNavigationTitles(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return [
      l10n.navigationHome,
      l10n.navigationMobileApps,
      l10n.navigationAbout,
      l10n.navigationContact,
    ];
  }
}
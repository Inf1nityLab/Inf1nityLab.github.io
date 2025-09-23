import 'package:flutter/material.dart';

class ResponsiveLayout {
  static const double mobileBreakpoint = 760;
  static const double tabletBreakpoint = 1024;

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width <= mobileBreakpoint;
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width > mobileBreakpoint && width <= tabletBreakpoint;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width > tabletBreakpoint;
  }
}

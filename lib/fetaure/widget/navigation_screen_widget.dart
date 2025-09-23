import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';


import 'app_bar_widget.dart';
import 'drawer_widget.dart';
import 'logo_widget.dart';
import '../../core/helpers/announce_helper.dart';

class NavigationScreenWidget extends StatefulWidget {
  final Widget? body;
  final List<Widget>? screens;
  final String? logoImage;
  final String? svgImage;
  final List<String> navigationTitles;
  final List<String>? navigationAnnounceMessages;
  final Widget? rightWidget;
  final Widget? bottomWidget;
  final bool showNavigation;
  final bool showLogo;
  final bool showRightWidget;
  final bool showBottomWidget;
  final ResponsiveSettings responsiveSettings;

  const NavigationScreenWidget({
    super.key,
    this.body,
    this.screens,
    this.logoImage,
    this.svgImage,
    required this.navigationTitles,
    this.navigationAnnounceMessages,
    this.rightWidget,
    this.bottomWidget,
    this.showNavigation = true,
    this.showLogo = true,
    this.showRightWidget = true,
    this.showBottomWidget = true,
    required this.responsiveSettings,
  }) : assert(body != null || screens != null, 'Either body or screens must be provided'),
       assert(logoImage != null || svgImage != null, 'Either logoImage or svgImage must be provided'),
       assert(
         navigationAnnounceMessages == null ||
         navigationAnnounceMessages.length == navigationTitles.length,
         'navigationAnnounceMessages length must match navigationTitles length',
       );

  @override
  State<NavigationScreenWidget> createState() => _NavigationScreenWidgetState();
}

class _NavigationScreenWidgetState extends State<NavigationScreenWidget> {
  int selectedIndex = 0;
  final ScrollController _scrollController = ScrollController();
  final List<GlobalKey> _sectionKeys = [];

  @override
  void initState() {
    super.initState();
    _initializeKeys();
    _scrollController.addListener(_onScrollChanged);
  }

  void _initializeKeys() {
    final screenCount = widget.screens?.length ?? 1;
    _sectionKeys.clear();
    for (int i = 0; i < screenCount; i++) {
      _sectionKeys.add(GlobalKey());
    }
  }

  @override
  void didUpdateWidget(NavigationScreenWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.screens?.length != oldWidget.screens?.length) {
      _initializeKeys();
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScrollChanged);
    _scrollController.dispose();
    super.dispose();
  }

  void _onNavigationTap(int index) {
    setState(() {
      selectedIndex = index;
    });
    _announceForIndex(index);
    if (widget.responsiveSettings.enableScrollToSection) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToSection(index);
      });
    }
  }

  void _announceForIndex(int index) {
    // Озвучиваем кастомное сообщение (или заголовок, если сообщение не задано)
    final hasCustomMessages = widget.navigationAnnounceMessages != null &&
        widget.navigationAnnounceMessages!.length > index;
    final announceText = hasCustomMessages
        ? widget.navigationAnnounceMessages![index]
        : widget.navigationTitles[index];
    AnnounceHelper.announcePolite(announceText);
  }

  void _onArrowDown() {
    final settings = widget.responsiveSettings;
    if (!settings.enableKeyboardNavigation || !settings.isDesktop(context)) return;

    if ((widget.screens?.isNotEmpty ?? false) && settings.enableScrollToSection) {
      final nextIndex = (selectedIndex + 1).clamp(0, (widget.screens!.length - 1));
      if (nextIndex != selectedIndex) {
        _onNavigationTap(nextIndex);
      }
    } else {
      _scrollBy(settings.keyboardScrollAmount);
    }
  }

  void _onArrowUp() {
    final settings = widget.responsiveSettings;
    if (!settings.enableKeyboardNavigation || !settings.isDesktop(context)) return;

    if ((widget.screens?.isNotEmpty ?? false) && settings.enableScrollToSection) {
      final prevIndex = (selectedIndex - 1).clamp(0, (widget.screens!.length - 1));
      if (prevIndex != selectedIndex) {
        _onNavigationTap(prevIndex);
      }
    } else {
      _scrollBy(-settings.keyboardScrollAmount);
    }
  }

  void _scrollBy(double delta) {
    if (!_scrollController.hasClients) return;
    final current = _scrollController.position.pixels;
    final target = (current + delta)
        .clamp(0.0, _scrollController.position.maxScrollExtent);
    _scrollController.animateTo(
      target,
      duration: Duration(milliseconds: widget.responsiveSettings.scrollDuration),
      curve: widget.responsiveSettings.scrollCurve,
    );
  }

  void _scrollToSection(int index) {
    if (index >= 0 && index < _sectionKeys.length) {
      final context = _sectionKeys[index].currentContext;
      if (context != null) {
        Scrollable.ensureVisible(
          context,
          duration: Duration(milliseconds: widget.responsiveSettings.scrollDuration),
          curve: widget.responsiveSettings.scrollCurve,
        );
      }
    }
  }

  void _onScrollChanged() {
    final settings = widget.responsiveSettings;
    if (!(widget.screens?.isNotEmpty ?? false)) return;
    if (!settings.enableAutoSelectOnScroll) return;
    if (!_scrollController.hasClients) return;

    final newIndex = _detectCurrentSectionIndex();
    if (newIndex != null && newIndex != selectedIndex) {
      setState(() {
        selectedIndex = newIndex;
      });
      _announceForIndex(newIndex);
    }
  }

  int? _detectCurrentSectionIndex() {
    // Определяем активную секцию на основе фактических оффсетов секций во вьюпорте скролла
    try {
      if (!_scrollController.hasClients) return null;
      final position = _scrollController.position;
      final anchor = position.pixels + position.viewportDimension * 0.2; // 20% от верха видимой области

      int? candidateIndex;
      double candidateTop = -double.infinity;

      int? closestIndex;
      double? closestDistance;

      for (int i = 0; i < _sectionKeys.length; i++) {
        final ctx = _sectionKeys[i].currentContext;
        if (ctx == null) continue;
        final renderObject = ctx.findRenderObject();
        if (renderObject == null) continue;
        final viewport = RenderAbstractViewport.of(renderObject);
        if (viewport == null) continue;

        final reveal = viewport.getOffsetToReveal(renderObject, 0.0).offset; // оффсет, чтобы верх секции стал видим сверху

        // Выбираем последнюю секцию, верх которой не ниже anchor
        if (reveal <= anchor && reveal >= candidateTop) {
          candidateTop = reveal;
          candidateIndex = i;
        }

        // Параллельно запоминаем ближайшую к anchor, на случай если ни одна не <= anchor
        final distance = (reveal - anchor).abs();
        if (closestDistance == null || distance < closestDistance) {
          closestDistance = distance;
          closestIndex = i;
        }
      }

      return candidateIndex ?? closestIndex;
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final settings = widget.responsiveSettings;
    final isDesktop = settings.isDesktop(context);
    final isMobile = settings.isMobile(context);
    final isTablet = settings.isTablet(context);

    return Scaffold(
      appBar: _buildAppBar(isDesktop, isMobile, isTablet),
      drawer: _buildDrawer(isDesktop, isMobile, isTablet),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget? _buildAppBar(bool isDesktop, bool isMobile, bool isTablet) {
    if (!widget.showNavigation) return null;

    if (isDesktop) {
      return AppBarWidget(
        image: widget.logoImage,
        svgImage: widget.svgImage,
        navigationTitles: widget.navigationTitles,
        selectedIndex: selectedIndex,
        rightWidget: widget.showRightWidget ? widget.rightWidget : null,
        onNavigationTitleTap: _onNavigationTap,
      );
    } else {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: widget.showLogo ? [
         LogoWidget(
           image: widget.logoImage,
           svgImage: widget.svgImage,
           width: 50, 
           height: 50,
         ),
        ] : null,
      );
    }
  }

  Widget? _buildDrawer(bool isDesktop, bool isMobile, bool isTablet) {
    if (!widget.showNavigation || isDesktop) return null;

    return DrawerWidget(
      navigationTitles: widget.navigationTitles,
      selectedIndex: selectedIndex,
      onNavigationTitleTap: _onNavigationTap,
      bottomWidget: widget.showBottomWidget ? widget.bottomWidget : null,
    );
  }

  Widget _buildBody() {
    final content = Builder(
      builder: (_) {
        if (widget.screens != null) {
          final screensWithKeys = widget.screens!.asMap().entries.map((entry) {
            final index = entry.key;
            final screen = entry.value;
            return Container(
              key: _sectionKeys[index],
              child: screen,
            );
          }).toList();

          return SingleChildScrollView(
            controller: _scrollController,
            child: Column(children: screensWithKeys),
          );
        }

        return SingleChildScrollView(
          controller: _scrollController,
          child: widget.body!,
        );
      },
    );

    if (widget.responsiveSettings.isDesktop(context) && widget.responsiveSettings.enableKeyboardNavigation) {
      return Focus(
        autofocus: true,
        canRequestFocus: true,
        onKeyEvent: (node, event) {
          if (event is! KeyDownEvent) return KeyEventResult.ignored;
          final key = event.logicalKey;
          if (key == LogicalKeyboardKey.arrowDown || key == LogicalKeyboardKey.pageDown) {
            _onArrowDown();
            return KeyEventResult.handled;
          }
          if (key == LogicalKeyboardKey.arrowUp || key == LogicalKeyboardKey.pageUp) {
            _onArrowUp();
            return KeyEventResult.handled;
          }
          if (key == LogicalKeyboardKey.home) {
            _scrollController.animateTo(
              0,
              duration: Duration(milliseconds: widget.responsiveSettings.scrollDuration),
              curve: widget.responsiveSettings.scrollCurve,
            );
            return KeyEventResult.handled;
          }
          if (key == LogicalKeyboardKey.end) {
            if (_scrollController.hasClients) {
              _scrollController.animateTo(
                _scrollController.position.maxScrollExtent,
                duration: Duration(milliseconds: widget.responsiveSettings.scrollDuration),
                curve: widget.responsiveSettings.scrollCurve,
              );
            }
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        },
        child: content,
      );
    }

    return content;
  }
}

class ResponsiveSettings {
  final double mobileBreakpoint;
  final double tabletBreakpoint;
  final bool enableScrollToSection;
  final bool enableKeyboardNavigation;
  final bool enableAutoSelectOnScroll;
  final int scrollDuration;
  final Curve scrollCurve;
  final double keyboardScrollAmount;

  const ResponsiveSettings({
    this.mobileBreakpoint = 760,
    this.tabletBreakpoint = 1024,
    this.enableScrollToSection = false,
    this.enableKeyboardNavigation = true,
    this.enableAutoSelectOnScroll = true,
    this.scrollDuration = 300,
    this.scrollCurve = Curves.easeInOut,
    this.keyboardScrollAmount = 400,
  });

  static ResponsiveSettings defaultSettings() {
    return const ResponsiveSettings();
  }

  bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width <= mobileBreakpoint;
  }

  bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width > mobileBreakpoint && width <= tabletBreakpoint;
  }

  bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width > tabletBreakpoint;
  }
}

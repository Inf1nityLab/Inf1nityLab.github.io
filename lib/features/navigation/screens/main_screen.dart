import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/providers/language_provider.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_drawer.dart';
import '../../pages/home_page.dart';
import '../../pages/mobile_apps_page.dart';
import '../../pages/about_page.dart';
import '../../pages/contact_page.dart';
import '../../pages/widgets/bottom_part.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentPageIndex = 0;

  // Ключи для секций
  final List<GlobalKey> _sectionKeys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPageIndex = index;
    });

    // Скролл к нужной секции
    final context = _sectionKeys[index].currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onDrawerToggle() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final appBarHeight = width < AppSizes.mobileBreakpoint 
        ? AppSizes.appBarHeightMobile 
        : AppSizes.appBarHeight;
    
    return Scaffold(
      key: _scaffoldKey, // Добавляем ключ для управления drawer
      backgroundColor: AppColors.background,
      drawer: CustomDrawer( // Добавляем drawer
        currentPageIndex: _currentPageIndex,
        onPageChanged: _onPageChanged,
        onClose: () => _scaffoldKey.currentState?.closeDrawer(),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: CustomAppBar(
          currentPageIndex: _currentPageIndex,
          onPageChanged: _onPageChanged,
          onDrawerToggle: _onDrawerToggle, // Передаем правильную функцию
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          // Главная секция
          SliverToBoxAdapter(
            child: Container(
              key: _sectionKeys[0],
              child: const HomePage(),
            ),
          ),
          
          // Мобильные приложения секция
          SliverToBoxAdapter(
            child: Container(
              key: _sectionKeys[1],
              child: const MobileAppsPage(),
            ),
          ),
          
          // О проекте секция
          SliverToBoxAdapter(
            child: Container(
              key: _sectionKeys[2],
              child: const AboutPage(),
            ),
          ),
          
          // Обратная связь секция
          SliverToBoxAdapter(
            child: Container(
              key: _sectionKeys[3],
              child: const ContactPage(),
            ),
          ),
          
          // Bottom Part секция (без навигации)
          SliverToBoxAdapter(
            child: Container(
              key: _sectionKeys[4],
              child: const BottomPart(),
            ),
          ),
        ],
      ),
    );
  }
}

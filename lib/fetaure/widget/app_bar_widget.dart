import 'package:flutter/material.dart';

import 'logo_widget.dart';
import 'semantic_text_widget.dart';
import '../constants/app_text_styles.dart';



class AppBarWidget extends StatefulWidget implements PreferredSizeWidget{
  final String? image;
  final String? svgImage;
  final List<String> navigationTitles;
  final Function(int) onNavigationTitleTap;
  final Widget? rightWidget; // LanguageButton или ButtonWidget
  final int selectedIndex;

  const AppBarWidget({
    super.key, 
     this.image,
    required this.navigationTitles, 
    required this.onNavigationTitleTap,
    this.rightWidget,
    this.svgImage,
    this.selectedIndex = 0,
  });

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>  const Size.fromHeight(125);
}

class _AppBarWidgetState extends State<AppBarWidget> {

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(125),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double maxWidth = constraints.maxWidth;
            // Подбираем адаптивные отступы и поведение в зависимости от ширины
            final double spacing = maxWidth < 1200 ? 24 : 40;
            final EdgeInsets itemPadding = EdgeInsets.zero;

            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Логотип
                LogoWidget(
                  image: widget.image,
                  svgImage: widget.svgImage,
                ),

                // Навигация (адаптивная). Занимает доступное пространство
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(minHeight: 0),
                      child: Wrap(
                        spacing: spacing,
                        runSpacing: 8,
                        alignment: WrapAlignment.end,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: widget.navigationTitles.asMap().entries.map((entry) {
                          final int index = entry.key;
                          final String title = entry.value;
                          final bool isSelected = widget.selectedIndex == index;

                          return Padding(
                            padding: itemPadding,
                            child: TextButton(
                              onPressed: () {
                                widget.onNavigationTitleTap(index);
                              },
                              child: SemanticTextWidget(
                                text: title,
                                overflow: TextOverflow.ellipsis,
                                style: isSelected
                                    ? AppTextStyles.appBarNavItemSelected
                                    : AppTextStyles.appBarNavItem,
                                isLink: true,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),

                // Правый виджет (язык/кнопка) с небольшим отступом
                if (widget.rightWidget != null) ...[
                  const SizedBox(width: 16),
                  widget.rightWidget!,
                ],
              ],
            );
          },
        ),
      ),
    );
  }


}





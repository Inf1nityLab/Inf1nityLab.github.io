
import 'package:flutter/material.dart';
import '../constants/app_text_styles.dart';
import 'semantic_text_widget.dart';

class DrawerWidget extends StatelessWidget {
  final List<String> navigationTitles;
  final Function(int) onNavigationTitleTap;
  final int selectedIndex;
  final Widget? bottomWidget;
  
  const DrawerWidget({
    super.key, 
    required this.navigationTitles, 
    required this.onNavigationTitleTap,
    this.selectedIndex = 0,
    this.bottomWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const SizedBox(height: 60),
          ...navigationTitles.asMap().entries.map((entry) {
            int index = entry.key;
            String title = entry.value;
            bool isSelected = selectedIndex == index;
            
            return ListTile(
              title: SemanticTextWidget(
                text: title,
                style: isSelected
                    ? AppTextStyles.appBarNavItemSelected
                    : AppTextStyles.appBarNavItem,
                isLink: true,
              ),
              onTap: () {
                Navigator.pop(context);
                onNavigationTitleTap(index);
              },
              selected: isSelected,
              selectedTileColor: Colors.grey[100],
            );
          }),
          const Spacer(),
          if (bottomWidget != null) ...[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: bottomWidget!,
            ),
          ],
        ],
      ),
    );
  }
}

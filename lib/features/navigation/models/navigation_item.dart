import 'package:flutter/material.dart';

class NavigationItem {
  final String title;
  final String key;
  final IconData? icon;
  final int pageIndex;
  
  const NavigationItem({
    required this.title,
    required this.key,
    this.icon,
    required this.pageIndex,
  });
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is NavigationItem &&
        other.title == title &&
        other.key == key &&
        other.pageIndex == pageIndex;
  }
  
  @override
  int get hashCode => title.hashCode ^ key.hashCode ^ pageIndex.hashCode;
  
  @override
  String toString() => 'NavigationItem(title: $title, key: $key, pageIndex: $pageIndex)';
}

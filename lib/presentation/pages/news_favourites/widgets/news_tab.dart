import 'package:flutter/material.dart';

/// A custom tab widget for displaying an icon and a label.
///
/// This widget is used to create a tab with a specified icon and label. 
/// It allows for customization of the icon color and ensures consistent styling.
class NewsTab extends StatelessWidget {
  /// Creates a [NewsTab] with the given icon, label, and optional icon color.
  ///
  /// The [icon] parameter is required and specifies the icon to display.
  /// The [label] parameter is required and specifies the text to display.
  /// The [iconColor] parameter is optional and allows customizing the icon color.
  const NewsTab({
    Key? key,
    required this.icon,
    required this.label,
    this.iconColor,
  }) : super(key: key);

  /// The icon to display in the tab.
  final IconData icon;

  /// The label text to display in the tab.
  final String label;

  /// The color of the icon. If not provided, the default color is used.
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 30,
          ),
          const SizedBox(width: 8.0),
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 23,
            ),
          ),
        ],
      ),
    );
  }
}

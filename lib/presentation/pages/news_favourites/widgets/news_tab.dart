import 'package:flutter/material.dart';

class NewsTab extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? iconColor;

  const NewsTab({
    Key? key,
    required this.icon,
    required this.label,
    this.iconColor,
  }) : super(key: key);

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
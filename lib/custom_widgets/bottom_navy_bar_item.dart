import 'package:flutter/material.dart';
import 'custom_texts.dart';

class BottomNavyBarItem extends StatelessWidget {
  const BottomNavyBarItem({
    Key? key,
    required this.label,
    required this.icon,
    this.color = Colors.white,
    required this.onTap,
  }) : super(key: key);
  final String label;
  final IconData icon;
  final Color? color;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: color,
          ),
          AutoSizeText10(
            text: label,
            color: color,
          ),
        ],
      ),
    );
  }
}

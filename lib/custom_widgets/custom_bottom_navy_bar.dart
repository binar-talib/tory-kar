import 'package:flutter/material.dart';
import 'package:tory_kar/modules/constants.dart';

import 'bottom_navy_bar_item.dart';

class CustomBottomNavyBar extends StatelessWidget {
  const CustomBottomNavyBar({
    Key? key,
    this.height = 55,
    this.bgColor,
    required this.children,
  }) : super(key: key);
  final double? height;
  final Color? bgColor;
  final List<BottomNavyBarItem> children;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: height,
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        decoration: kBoxDecoration.copyWith(
          color: const Color(0xFF2D7171),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: children,
        ),
      ),
    );
  }
}

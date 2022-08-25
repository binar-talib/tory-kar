import 'package:flutter/material.dart';

class BuildDots extends StatelessWidget {
  const BuildDots({
    Key? key,
    required this.currentPage,
    required this.index,
  }) : super(key: key);

  final int currentPage;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.all(3.0),
      width: currentPage == index ? 16 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: currentPage == index
            ? const Color(0xFF2B2D42)
            : const Color(0xFFC4C4C4),
        borderRadius: BorderRadius.circular(30.0),
      ),
      duration: const Duration(milliseconds: 200),
    );
  }
}

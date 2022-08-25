import 'package:flutter/material.dart';
import 'package:tory_kar/modules/constants.dart';

import 'custom_texts.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.bgcolor = const Color(0xFF2D7171),
    this.textColor = Colors.white,
    this.width = 100,
  }) : super(key: key);

  final String label;
  final Function() onPressed;
  final Color? bgcolor;
  final Color? textColor;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: width,
      decoration: kBoxDecoration.copyWith(
        color: bgcolor,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: AutoSizeText10(
          text: label,
          color: textColor,
        ),
      ),
    );
  }
}

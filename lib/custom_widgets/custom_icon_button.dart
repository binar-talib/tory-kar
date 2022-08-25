import 'package:flutter/material.dart';
import 'package:tory_kar/modules/constants.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.onPressed,
    this.icon = Icons.arrow_back_ios_new,
    this.bgColor = Colors.white,
    this.iconColor = const Color(0xFF2B2D42),
  }) : super(key: key);
  final Function() onPressed;
  final IconData icon;
  final Color bgColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: kBoxDecoration.copyWith(color: bgColor),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 18,
          color: iconColor,
        ),
      ),
    );
  }
}

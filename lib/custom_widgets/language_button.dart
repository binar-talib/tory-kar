import 'package:flutter/material.dart';
import 'package:tory_kar/modules/constants.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({
    Key? key,
    required this.icon,
    required this.title,
    required this.image,
    required this.onTap,
    this.iconColor = const Color(0xFF2B2D42),
  }) : super(key: key);
  final IconData icon;
  final String title;
  final String image;
  final Function() onTap;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15.0),
      decoration: kBoxDecoration,
      height: 50.0,
      child: TextButton(
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image.asset(
                image,
                height: 20,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF2B2D42),
              ),
            ),
            Icon(
              icon,
              color: iconColor,
            ),
          ],
        ),
      ),
    );
  }
}

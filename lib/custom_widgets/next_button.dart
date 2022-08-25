import 'package:flutter/material.dart';
import 'package:tory_kar/modules/constants.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBoxDecoration.copyWith(
        color: const Color(0xFF2D7171),
      ),
      height: 50.0,
      width: double.infinity,
      child: TextButton.icon(
        onPressed: onPressed,
        icon: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        label: Icon(
          icon,
          color: Colors.white,
          size: 15,
        ),
      ),
    );
  }
}

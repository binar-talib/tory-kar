import 'package:flutter/material.dart';
import 'package:tory_kar/modules/constants.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    Key? key,
    required this.image,
    required this.onPressed,
  }) : super(key: key);
  final String image;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: kBoxDecoration,
      child: IconButton(
        padding: const EdgeInsets.all(0.0),
        onPressed: onPressed,
        icon: ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: Image.asset(
            image,
            width: 40,
            height: 40,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tory_kar/modules/constants.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    required this.icon,
    required this.hintText,
    this.leftMargin = 20.0,
    this.rightMargin = 20.0,
    this.width,
    this.topMargin = 2.0,
    this.onChanged,
  }) : super(key: key);
  final IconData icon;
  final String hintText;
  final double leftMargin;
  final double rightMargin;
  final double topMargin;
  final double? width;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(right: rightMargin, left: leftMargin, top: topMargin),
      padding: const EdgeInsets.only(right: 15.0, left: 15.0, top: 2.0),
      height: 40.0,
      width: MediaQuery.of(context).size.width,
      decoration: kBoxDecoration,
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          suffixIcon: Icon(icon),
          suffixIconConstraints: const BoxConstraints(maxWidth: 20.0),
          isDense: true,
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 12.0,
            color: Color(0x802B2D42),
          ),
        ),
      ),
    );
  }
}

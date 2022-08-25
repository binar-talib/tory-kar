import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tory_kar/modules/constants.dart';

import 'custom_texts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.icon,
    required this.hintText,
    required this.label,
    this.suffixIcon,
    this.keyboardType,
    this.controller,
    this.onChanged,
    this.inputFormatters,
    this.obscureText = false,
  }) : super(key: key);
  final Widget icon;
  final String hintText;
  final String label;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText15(text: label),
        Container(
          margin: const EdgeInsets.only(top: 5),
          padding: const EdgeInsets.only(right: 10.0, left: 10.0, top: 2.0),
          height: 40.0,
          decoration: kBoxDecoration,
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            onChanged: onChanged,
            inputFormatters: inputFormatters,
            obscureText: obscureText,
            decoration: InputDecoration(
              prefixIcon: icon,
              suffixIcon: suffixIcon,
              border: InputBorder.none,
              isDense: true,
              suffixIconConstraints:
                  const BoxConstraints(maxHeight: 30, maxWidth: 70),
              prefixIconConstraints: const BoxConstraints(minWidth: 30.0),
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Color(0x802B2D42),
                fontSize: 12.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

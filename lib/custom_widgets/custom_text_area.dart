import 'package:flutter/material.dart';
import 'package:tory_kar/modules/constants.dart';

import 'custom_texts.dart';

class CustomTextArea extends StatelessWidget {
  const CustomTextArea({
    Key? key,
    required this.label,
    this.maxLines = 5,
    this.hintText = '',
    this.controller,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final int maxLines;
  final String hintText;
  final TextEditingController? controller;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText15(text: label),
        Container(
          decoration: kBoxDecoration,
          margin: const EdgeInsets.only(top: 5),
          padding: const EdgeInsets.only(right: 15.0, left: 15.0, top: 2.0),
          child: TextField(
            onChanged: onChanged,
            controller: controller,
            maxLines: maxLines,
            decoration: InputDecoration(
              border: InputBorder.none,
              isDense: true,
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

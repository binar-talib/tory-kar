import 'package:flutter/material.dart';
import 'package:tory_kar/modules/constants.dart';

import 'custom_texts.dart';

class CustomDropDownButton extends StatelessWidget {
  const CustomDropDownButton({
    Key? key,
    required this.label,
    required this.selectedValue,
    required this.listOfValues,
    required this.onChanged,
  }) : super(key: key);
  final String label;
  final String selectedValue;
  final List<String> listOfValues;
  final void Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText15(text: label),
        Container(
          margin: const EdgeInsets.only(top: 5),
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          height: 40.0,
          width: double.infinity,
          decoration: kBoxDecoration,
          child: DropdownButton<String>(
            underline: Container(),
            value: selectedValue,
            isExpanded: true,
            icon: const Icon(
              Icons.keyboard_arrow_down_rounded,
            ),
            elevation: 16,
            onChanged: onChanged,
            items: listOfValues.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: AutoSizeText10(
                  text: value,
                ),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}

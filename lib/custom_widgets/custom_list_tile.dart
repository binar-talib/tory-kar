import 'package:flutter/material.dart';
import 'package:tory_kar/modules/constants.dart';

import 'custom_texts.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.title,
    this.leading,
    this.trailing,
  }) : super(key: key);
  final String title;
  final Widget? leading;
  final Widget? trailing;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBoxDecoration,
      margin: const EdgeInsets.only(bottom: 17.0),
      child: ListTile(
        dense: true,
        leading: leading,
        trailing: trailing,
        title: AutoSizeText15(text: title),
      ),
    );
  }
}

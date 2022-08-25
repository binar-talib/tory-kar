import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class AutoSizeText15 extends StatelessWidget {
  const AutoSizeText15(
      {Key? key, required this.text, this.maxLine, this.color, this.textAlign})
      : super(key: key);
  final String text;
  final Color? color;
  final int? maxLine;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      maxLines: maxLine,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: 15,
        color: color,
      ),
    );
  }
}

class AutoSizeText10 extends StatelessWidget {
  const AutoSizeText10({
    Key? key,
    required this.text,
    this.maxLine,
    this.color,
  }) : super(key: key);
  final String text;
  final int? maxLine;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 10,
        color: color,
      ),
    );
  }
}

class AutoSizeText12 extends StatelessWidget {
  const AutoSizeText12({Key? key, required this.text, this.maxLine, this.color})
      : super(key: key);
  final String text;
  final int? maxLine;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      maxLines: maxLine,
      textAlign: TextAlign.justify,
      style: TextStyle(
        fontSize: 12,
        color: color,
      ),
    );
  }
}

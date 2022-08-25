import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tory_kar/modules/constants.dart';

import 'custom_texts.dart';

class WaitingCard extends StatelessWidget {
  const WaitingCard({
    Key? key,
    required this.image,
    required this.title,
    required this.company,
    required this.date,
    this.onTap,
    required this.screen,
  }) : super(key: key);

  final String image;
  final String title;
  final String company;
  final String date;
  final Function()? onTap;
  final String screen;

  @override
  Widget build(BuildContext context) {
    print(date);
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      height: 70,
      decoration: kBoxDecoration,
      child: Center(
        child: ListTile(
          onTap: onTap,
          contentPadding: const EdgeInsets.all(0.0),
          dense: true,
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image.asset(
              image,
              height: 40,
              width: 40,
              fit: BoxFit.fitWidth,
            ),
          ),
          title: Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 15.0),
          ),
          subtitle: Text(
            company,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: const Color(0xFF2B2D42).withOpacity(0.5),
              fontSize: 12.0,
            ),
          ),
          trailing: AutoSizeText10(
            text:
                "${screen == 'accepted' ? 'Meeting on:' : 'Sent on'}\n${DateFormat.yMd().format(DateTime.parse(date))}",
          ),
        ),
      ),
    );
  }
}

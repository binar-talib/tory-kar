import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tory_kar/modules/constants.dart';
import 'package:tory_kar/modules/necessary_methods.dart';

import 'custom_texts.dart';

class CompanyJobCards extends StatelessWidget {
  const CompanyJobCards({
    Key? key,
    required this.title,
    required this.salary,
    required this.type,
    required this.location,
    required this.deadline,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final int salary;
  final String type;
  final String location;
  final String deadline;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20.0,
      ),
      padding: const EdgeInsets.only(
        top: 5.0,
        right: 15.0,
        left: 15.0,
        bottom: 15.0,
      ),
      decoration: kBoxDecoration,
      child: InkWell(
        onTap: onTap,
        child: AspectRatio(
          aspectRatio: screenHeight > 700 ? 5.0 / 2.0 : 4.0 / 2.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ListTile(
                contentPadding: const EdgeInsets.all(0.0),
                dense: true,
                title: AutoSizeText15(
                  text: title,
                  maxLine: 1,
                ),
                trailing: Container(
                  height: 21,
                  width: 21,
                  decoration: BoxDecoration(
                    color: const Color(0xFF2D7171),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
                    child: Text(
                      '10',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  AutoSizeText12(
                    text: '\$$salary / month',
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                  ),
                  AutoSizeText12(
                    text: type,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.location_on,
                    size: 20,
                  ),
                  AutoSizeText12(
                    text: location,
                  ),
                ],
              ),
              AutoSizeText12(
                text:
                    "Deadline to Apply: ${DateFormat('dd/MM/yyyy').format(DateTime.parse(deadline))} - ${calculateDays(deadline)} Days Left",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

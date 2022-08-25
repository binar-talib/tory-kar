import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tory_kar/custom_widgets/auth_bottom_sheet.dart';
import 'package:tory_kar/custom_widgets/custom_app_bar.dart';
import 'package:tory_kar/custom_widgets/custom_icon_button.dart';
import 'package:tory_kar/custom_widgets/custom_texts.dart';
import 'package:tory_kar/custom_widgets/next_button.dart';
import 'package:tory_kar/modules/constants.dart';
import 'package:tory_kar/modules/necessary_methods.dart';

class JobDetailsScreen extends StatelessWidget {
  const JobDetailsScreen(
      {Key? key,
      required this.location,
      required this.title,
      required this.salary,
      required this.qualification,
      required this.description,
      required this.jobType,
      required this.deadline})
      : super(key: key);

  final String location;
  final String title;
  final int salary;
  final String qualification;
  final String description;
  final String jobType;
  final String deadline;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: CustomIconButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: 'Job Details',
        trailing: const SizedBox(
          height: 40,
          width: 40,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: kBoxDecoration,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      'assets/images/google.png',
                      height: screenWidth / 3,
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                SizedBox(
                  height: screenWidth / 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 20,
                          ),
                          AutoSizeText10(
                            text: location,
                          ),
                        ],
                      ),
                      AutoSizeText15(
                        text: title,
                        maxLine: 1,
                      ),
                      AutoSizeText10(
                        text: 'Salary: \$$salary',
                      ),
                      AutoSizeText10(
                        text: jobType,
                      ),
                      AutoSizeText10(
                        text:
                            'Deadline: ${DateFormat('dd/MM/yyyy').format(DateTime.parse(deadline))}\n${calculateDays(deadline)} Days Left',
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AutoSizeText15(text: 'Brief about the company'),
                    const SizedBox(height: 5.0),
                    AutoSizeText12(
                        color: const Color(0xFF2B2D42).withOpacity(0.75),
                        text:
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industrys standard dummy text ever since the 1500s,when an unknown printer took a galley of type and scrambled it to make a typespecimen book.'),
                    const SizedBox(height: 15.0),
                    const AutoSizeText15(text: 'Job Description'),
                    const SizedBox(height: 5.0),
                    AutoSizeText12(
                      color: const Color(0xFF2B2D42).withOpacity(0.75),
                      text: description,
                    ),
                    const SizedBox(height: 15.0),
                    const AutoSizeText15(text: 'Job Qualifications'),
                    const SizedBox(height: 5.0),
                    AutoSizeText12(
                      color: const Color(0xFF2B2D42).withOpacity(0.75),
                      text: qualification,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CustomIconButton(
              onPressed: () {},
              icon: Icons.notifications,
            ),
            const SizedBox(width: 20.0),
            Expanded(
              child: NextButton(
                icon: Icons.check,
                label: 'Apply Now',
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => AuthBottomSheet(
                      title: 'You need to sign up or \nlogin before applying',
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

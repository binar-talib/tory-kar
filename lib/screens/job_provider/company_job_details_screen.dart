import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tory_kar/custom_widgets/custom_text_button.dart';
import 'package:tory_kar/custom_widgets/custom_texts.dart';
import 'package:tory_kar/modules/constants.dart';
import 'package:tory_kar/modules/necessary_methods.dart';

import 'company_add_job_screen.dart';

class CompanyJobDetailsScreen extends StatelessWidget {
  const CompanyJobDetailsScreen({
    Key? key,
    required this.location,
    required this.title,
    required this.salary,
    required this.deadline,
    required this.jobType,
    required this.companyBrief,
    required this.description,
    required this.qualification,
    required this.id,
  }) : super(key: key);
  final String id;
  final String location;
  final String title;
  final int salary;
  final String deadline;
  final String jobType;
  final String companyBrief;
  final String description;
  final String qualification;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: screenWidth / 4.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.location_on,
                                size: 15,
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
                            text: 'Salary: $salary',
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AutoSizeText10(
                                text:
                                    "Deadline to Apply: ${DateFormat('dd/MM/yyyy').format(DateTime.parse(deadline))} - ${calculateDays(deadline)} Days Left",
                              ),
                              AutoSizeText10(
                                text: jobType,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const AutoSizeText15(text: 'Brief about the company'),
                    const SizedBox(height: 5.0),
                    AutoSizeText12(
                      color: const Color(0xFF2B2D42).withOpacity(0.75),
                      text: companyBrief,
                    ),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: screenWidth * 0.4,
              height: 50,
              child: CustomTextButton(
                label: 'Close Applying',
                bgcolor: const Color(0xFFFF0000),
                onPressed: () {},
              ),
            ),
            SizedBox(
              width: screenWidth * 0.4,
              height: 50,
              child: CustomTextButton(
                label: 'Edit Job',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CompanyAddJobScreen(
                        id: id,
                        description: description,
                        title: title,
                        appBarName: 'Edit Job',
                        deadline: deadline,
                        jobType: jobType,
                        qualification: qualification,
                        salary: salary.toString(),
                      ),
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

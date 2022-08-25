import 'package:flutter/material.dart';
import 'package:tory_kar/custom_widgets/custom_texts.dart';
import 'package:tory_kar/modules/constants.dart';

class CompanyDoneJobDetailsScreen extends StatelessWidget {
  const CompanyDoneJobDetailsScreen({Key? key}) : super(key: key);

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
                            children: const [
                              Icon(
                                Icons.location_on,
                                size: 15,
                              ),
                              AutoSizeText10(
                                text: 'location',
                              ),
                            ],
                          ),
                          const AutoSizeText15(
                            text: 'Graphics Designer',
                            maxLine: 1,
                          ),
                          const AutoSizeText10(
                            text: 'Salary: \$1000',
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              AutoSizeText10(
                                text: 'Deadline: 21/01/2020 - 50 Days Left',
                              ),
                              AutoSizeText10(
                                text: 'Full time',
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
                        text:
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industrys standard dummy text ever since the 1500s,when an unknown printer took a galley of type and scrambled it to make a typespecimen book.'),
                    const SizedBox(height: 15.0),
                    const AutoSizeText15(text: 'Job Description'),
                    const SizedBox(height: 5.0),
                    AutoSizeText12(
                        color: const Color(0xFF2B2D42).withOpacity(0.75),
                        text:
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industrys standard dummy text ever since the 1500s,when an unknown printer took a galley of type and scrambled it to make a typespecimen book.'),
                    const SizedBox(height: 15.0),
                    const AutoSizeText15(text: 'Job Qualifications'),
                    const SizedBox(height: 5.0),
                    AutoSizeText12(
                        color: const Color(0xFF2B2D42).withOpacity(0.75),
                        text:
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industrys standard dummy text ever since the 1500s,when an unknown printer took a galley of type and scrambled it to make a typespecimen book.'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

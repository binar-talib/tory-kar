import 'package:flutter/material.dart';
import 'package:tory_kar/custom_widgets/custom_app_bar.dart';
import 'package:tory_kar/custom_widgets/custom_icon_button.dart';
import 'package:tory_kar/modules/constants.dart';

import 'company_done_job_applicants.dart';
import 'company_done_job_details_screen.dart';

class CompanyDoneJobDetailsPageViewScreen extends StatefulWidget {
  const CompanyDoneJobDetailsPageViewScreen({Key? key}) : super(key: key);

  @override
  State<CompanyDoneJobDetailsPageViewScreen> createState() =>
      _CompanyJobDetailsPageViewScreenState();
}

class _CompanyJobDetailsPageViewScreenState
    extends State<CompanyDoneJobDetailsPageViewScreen> {
  PageController controller = PageController();
  int currentPage = 0;
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
      body: Column(
        children: [
          Container(
            height: 55,
            width: double.infinity,
            decoration: kBoxDecoration,
            margin: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    currentPage = 0;
                    setState(() {
                      controller.animateToPage(currentPage,
                          duration: const Duration(
                            milliseconds: 500,
                          ),
                          curve: Curves.ease);
                    });
                  },
                  child: Text(
                    'Job',
                    style: TextStyle(
                      color: currentPage == 0
                          ? const Color(0xFF2B2D42)
                          : const Color(0xFF2B2D42).withOpacity(0.5),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    currentPage = 1;
                    setState(() {
                      controller.animateToPage(currentPage,
                          duration: const Duration(
                            milliseconds: 500,
                          ),
                          curve: Curves.ease);
                    });
                  },
                  child: Text(
                    'Applicants',
                    style: TextStyle(
                      color: currentPage == 1
                          ? const Color(0xFF2B2D42)
                          : const Color(0xFF2B2D42).withOpacity(0.5),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller,
              children: const [
                CompanyDoneJobDetailsScreen(),
                CompanyDoneJobApplicants(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

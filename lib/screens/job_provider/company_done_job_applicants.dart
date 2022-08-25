import 'package:flutter/material.dart';
import 'package:tory_kar/custom_widgets/bottom_navy_bar_item.dart';
import 'package:tory_kar/custom_widgets/custom_bottom_navy_bar.dart';

import 'company_applicant_accepted_screen.dart';
import 'company_applicant_rejected_screen.dart';
import 'company_applicant_waiting_screen.dart';

class CompanyDoneJobApplicants extends StatefulWidget {
  const CompanyDoneJobApplicants({Key? key}) : super(key: key);

  @override
  State<CompanyDoneJobApplicants> createState() =>
      _CompanyDoneJobApplicantsState();
}

class _CompanyDoneJobApplicantsState extends State<CompanyDoneJobApplicants> {
  PageController controller = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller,
              children: [
                CompanyApplicantWaitingScreen(),
                CompanyApplicantAcceptedScreen(),
                CompanyApplicantRejectedScreen(),
              ],
            ),
          ),
          CustomBottomNavyBar(
            children: [
              BottomNavyBarItem(
                label: 'Waiting',
                icon: Icons.access_time_filled_rounded,
                color: currentPage == 0
                    ? Colors.white
                    : Colors.white.withOpacity(0.5),
                onTap: () {
                  currentPage = 0;
                  setState(() {
                    controller.animateToPage(currentPage,
                        duration: const Duration(
                          seconds: 1,
                        ),
                        curve: Curves.ease);
                  });
                },
              ),
              BottomNavyBarItem(
                label: 'Accepted',
                icon: Icons.insert_drive_file,
                color: currentPage == 1
                    ? Colors.white
                    : Colors.white.withOpacity(0.5),
                onTap: () {
                  currentPage = 1;
                  setState(() {
                    controller.animateToPage(currentPage,
                        duration: const Duration(
                          seconds: 1,
                        ),
                        curve: Curves.ease);
                  });
                },
              ),
              BottomNavyBarItem(
                label: 'Rejected',
                icon: Icons.close_rounded,
                color: currentPage == 2
                    ? Colors.white
                    : Colors.white.withOpacity(0.5),
                onTap: () {
                  currentPage = 2;
                  setState(() {
                    controller.animateToPage(currentPage,
                        duration: const Duration(
                          seconds: 1,
                        ),
                        curve: Curves.ease);
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

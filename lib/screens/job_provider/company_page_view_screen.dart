import 'package:flutter/material.dart';
import 'package:tory_kar/custom_widgets/bottom_navy_bar_item.dart';
import 'package:tory_kar/custom_widgets/custom_bottom_navy_bar.dart';
import 'package:tory_kar/screens/job_provider/company_home_screen.dart';

import 'company_done_screen.dart';

class CompanyPageViewScreen extends StatefulWidget {
  const CompanyPageViewScreen({Key? key}) : super(key: key);

  @override
  State<CompanyPageViewScreen> createState() => _CompanyPageViewScreenState();
}

class _CompanyPageViewScreenState extends State<CompanyPageViewScreen> {
  PageController controller = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller,
            children: [
              CompanyHomeScreen(),
              CompanyDoneScreen(),
            ],
          ),
          CustomBottomNavyBar(
            children: [
              BottomNavyBarItem(
                label: 'Published',
                icon: Icons.publish_rounded,
                color: currentPage == 0
                    ? Colors.white
                    : Colors.white.withOpacity(0.5),
                onTap: () {
                  currentPage = 0;
                  setState(() {
                    controller.animateToPage(
                      currentPage,
                      duration: const Duration(
                        seconds: 1,
                      ),
                      curve: Curves.ease,
                    );
                  });
                },
              ),
              BottomNavyBarItem(
                label: '  Done   ',
                icon: Icons.check_rounded,
                color: currentPage == 1
                    ? Colors.white
                    : Colors.white.withOpacity(0.5),
                onTap: () {
                  currentPage = 1;
                  setState(() {
                    controller.animateToPage(
                      currentPage,
                      duration: const Duration(
                        seconds: 1,
                      ),
                      curve: Curves.ease,
                    );
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

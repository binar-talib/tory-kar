import 'package:flutter/material.dart';
import 'package:tory_kar/custom_widgets/bottom_navy_bar_item.dart';
import 'package:tory_kar/custom_widgets/custom_bottom_navy_bar.dart';
import 'package:tory_kar/screens/job_seeker/applied_screen.dart';
import 'package:tory_kar/screens/job_seeker/notification_screen.dart';
import 'package:tory_kar/screens/job_seeker/saved_screen.dart';

import 'home_screen.dart';

class PagesViewScreen extends StatefulWidget {
  const PagesViewScreen({Key? key}) : super(key: key);

  @override
  _PagesViewScreenState createState() => _PagesViewScreenState();
}

class _PagesViewScreenState extends State<PagesViewScreen> {
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
              HomeScreen(),
              SavedScreen(),
              AppliedScreen(),
              NotificationScreen(),
            ],
          ),
          CustomBottomNavyBar(
            children: [
              BottomNavyBarItem(
                label: 'Home',
                icon: Icons.home,
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
                label: 'Saved',
                icon: Icons.bookmark,
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
                label: 'Applied',
                icon: Icons.check,
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
              BottomNavyBarItem(
                label: 'Notification',
                icon: Icons.notifications,
                color: currentPage == 3
                    ? Colors.white
                    : Colors.white.withOpacity(0.5),
                onTap: () {
                  currentPage = 3;
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

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:tory_kar/custom_widgets/build_dots.dart';
import 'package:tory_kar/custom_widgets/build_onboard_page.dart';
import 'package:tory_kar/custom_widgets/custom_app_bar.dart';
import 'package:tory_kar/custom_widgets/custom_icon_button.dart';
import 'package:tory_kar/custom_widgets/next_button.dart';
import 'package:tory_kar/modules/some_data.dart';
import 'package:tory_kar/screens/job_seeker/pages_view_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: CustomIconButton(
          onPressed: () {
            currentPage == 0
                ? Navigator.pop(context)
                : _pageController.animateToPage(
                    --currentPage,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeIn,
                  );
          },
        ),
        title: '',
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: PageView.builder(
                  itemBuilder: (context, index) {
                    return BuildOnboardPage(
                      image: onboardData[index]['image'],
                      title: onboardData[index]['title'],
                      description: onboardData[index]['description'],
                    );
                  },
                  itemCount: onboardData.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  onboardData.length,
                  (index) => BuildDots(
                    index: index,
                    currentPage: currentPage,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20.0, right: 20.0, left: 20.0),
        child: currentPage == onboardData.length - 1
            ? NextButton(
                icon: Icons.check,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PagesViewScreen(),
                    ),
                  );
                },
                label: 'Get Started',
              )
            : Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PagesViewScreen(),
                        ),
                      );
                    },
                    child: const Text('Skip'),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    child: NextButton(
                      icon: Icons.arrow_forward_ios,
                      label: 'Next',
                      onPressed: () {
                        _pageController.animateToPage(
                          ++currentPage,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeIn,
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

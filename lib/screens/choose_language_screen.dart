import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tory_kar/custom_widgets/language_button.dart';
import 'package:tory_kar/custom_widgets/next_button.dart';
import 'package:tory_kar/screens/job_seeker/pages_view_screen.dart';
import 'package:tory_kar/screens/onboarding_screen.dart';

import 'job_provider/company_page_view_screen.dart';

class ChooseLanguageScreen extends StatefulWidget {
  const ChooseLanguageScreen({Key? key}) : super(key: key);

  @override
  _ChooseLanguageScreenState createState() => _ChooseLanguageScreenState();
}

class _ChooseLanguageScreenState extends State<ChooseLanguageScreen> {
  String selectedLanguage = 'English';

  @override
  void initState() {
    super.initState();
    navigate();
  }

  void navigate() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString('role') == 'jobSeeker') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PagesViewScreen(),
        ),
      );
    } else if (prefs.getString('role') == 'jobProvider') {
      String jobProviderId = prefs.getString("_id")!;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CompanyPageViewScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'select_your_language',
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ).tr(),
              ListView(
                shrinkWrap: true,
                children: [
                  LanguageButton(
                    onTap: () {
                      setState(() {
                        selectedLanguage = 'Kurdish';
                        context.setLocale(const Locale('fa', 'IR'));
                      });
                    },
                    title: 'kurdish'.tr(),
                    icon: Icons.check,
                    image: 'assets/images/kurdistan.jpg',
                    iconColor: selectedLanguage == 'Kurdish'
                        ? const Color(0xFF2B2D42)
                        : Colors.transparent,
                  ),
                  LanguageButton(
                    onTap: () {
                      setState(() {
                        selectedLanguage = 'English';
                        context.setLocale(const Locale('en', 'US'));
                      });
                    },
                    title: 'english'.tr(),
                    icon: Icons.check,
                    image: 'assets/images/america.jpg',
                    iconColor: selectedLanguage == 'English'
                        ? const Color(0xFF2B2D42)
                        : Colors.transparent,
                  ),
                  LanguageButton(
                    onTap: () {
                      setState(() {
                        selectedLanguage = 'Arabic';
                        context.setLocale(const Locale('ar', 'SA'));
                      });
                    },
                    title: 'arabic'.tr(),
                    icon: Icons.check,
                    image: 'assets/images/iraq.jpg',
                    iconColor: selectedLanguage == 'Arabic'
                        ? const Color(0xFF2B2D42)
                        : Colors.transparent,
                  ),
                ],
              ),
              NextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OnboardingScreen(),
                    ),
                  );
                },
                icon: Icons.arrow_forward_ios,
                label: 'next'.tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

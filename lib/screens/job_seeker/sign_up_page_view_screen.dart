import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tory_kar/custom_widgets/build_dots.dart';
import 'package:tory_kar/custom_widgets/custom_app_bar.dart';
import 'package:tory_kar/custom_widgets/custom_icon_button.dart';
import 'package:tory_kar/custom_widgets/next_button.dart';
import 'package:tory_kar/screens/job_seeker/enter_mobile_number_screen.dart';
import 'package:tory_kar/screens/job_seeker/login_screen.dart';

import '../../networking/job_seeker.dart';
import 'enter_password_screen.dart';
import 'enter_personal_info_2_screen.dart';
import 'enter_personal_info_3_screen.dart';
import 'enter_personal_info_screen.dart';
import 'enter_verify_code_screen.dart';

class SignUpPageViewScreen extends StatefulWidget {
  const SignUpPageViewScreen({Key? key}) : super(key: key);
  @override
  State<SignUpPageViewScreen> createState() => _SignUpPageViewScreenState();
}

class _SignUpPageViewScreenState extends State<SignUpPageViewScreen> {
  int _currentPage = 0;
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        leading: CustomIconButton(
          onPressed: () {
            setState(() {
              _currentPage == 0
                  ? Navigator.pop(context)
                  : _controller.animateToPage(
                      --_currentPage,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeIn,
                    );
            });
          },
        ),
        title: 'Sign up',
        trailing: const SizedBox(
          height: 40,
          width: 40,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _controller,
              children: [
                // SignUpScreen(
                //   providerButtonOnPressed: () {
                //     role = 'jobProvider';
                //     setState(() {
                //       _controller.animateToPage(
                //         ++_currentPage,
                //         duration: const Duration(milliseconds: 200),
                //         curve: Curves.easeIn,
                //       );
                //     });
                //   },
                //   seekerButtonOnPressed: () {
                //     role = 'jobSeeker';
                //     setState(() {
                //       _controller.animateToPage(
                //         ++_currentPage,
                //         duration: const Duration(milliseconds: 200),
                //         curve: Curves.easeIn,
                //       );
                //     });
                //   },
                // ),
                EnterMobileNumberScreen(),
                const EnterPasswordScreen(),
                const EnterVerifyCodeScreen(),
                const EnterPersonalInformationScreen(),
                const EnterPersonalInformation2Screen(),
                const EnterPersonalInformation3Screen(),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              6,
              (index) => BuildDots(
                index: index,
                currentPage: _currentPage,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: NextButton(
          onPressed: () async {
            if (_currentPage == 5) {
              SharedPreferences preferences =
                  await SharedPreferences.getInstance();
              var response = await JobSeeker().createNewJobSeeker();
              if (response.statusCode == 200 || response.statusCode == 201) {
                // preferences.setString('role', 'jobSeeker');
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                    (route) => false);
              }
              print(response.statusCode);
            } else {
              setState(() {
                _controller.animateToPage(
                  ++_currentPage,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeIn,
                );
              });
            }
          },
          label: 'Next',
          icon: Icons.keyboard_arrow_right_rounded,
        ),
      ),
    );
  }
}

// _currentPage == 0
// ? Row(
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// children: [
// const AutoSizeText10(
// text: 'Already have an account?',
// ),
// CustomTextButton(
// label: 'Login',
// onPressed: () {},
// bgcolor: Colors.white,
// textColor: const Color(0xFF2B2D42),
// ),
// ],
// )
// :

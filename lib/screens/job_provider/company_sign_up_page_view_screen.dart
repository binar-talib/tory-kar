import 'package:flutter/material.dart';
import 'package:tory_kar/custom_widgets/build_dots.dart';
import 'package:tory_kar/custom_widgets/custom_app_bar.dart';
import 'package:tory_kar/custom_widgets/custom_icon_button.dart';
import 'package:tory_kar/custom_widgets/custom_text_button.dart';
import 'package:tory_kar/custom_widgets/next_button.dart';
import 'package:tory_kar/networking/job_provider.dart';

import 'comapny_enter_password_screen.dart';
import 'company_enter_mobile_number_screen.dart';
import 'company_enter_personal_info_2_screen.dart';
import 'company_enter_personal_info_3_screen.dart';
import 'company_enter_personal_info_screen.dart';
import 'company_enter_verify_code_screen.dart';

class CompanySignUpPageViewScreen extends StatefulWidget {
  const CompanySignUpPageViewScreen({Key? key, required this.role})
      : super(key: key);
  final String role;
  @override
  State<CompanySignUpPageViewScreen> createState() =>
      _CompanySignUpPageViewScreenState();
}

class _CompanySignUpPageViewScreenState
    extends State<CompanySignUpPageViewScreen> {
  int _currentPage = 0;
  final PageController _controller = PageController();

  late String role;
  @override
  initState() {
    super.initState();
    role = widget.role;
  }

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
                CompanyEnterMobileNumberScreen(),
                CompanyEnterPasswordScreen(),
                CompanyEnterVerifyCodeScreen(),
                CompanyEnterPersonalInformationScreen(),
                CompanyEnterPersonalInformation2Screen(),
                const CompanyEnterPersonalInformation3Screen(),
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
        child: _currentPage == 5
            ? SizedBox(
                height: 50.0,
                child: CustomTextButton(
                    label: 'Finish',
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              )
            : NextButton(
                onPressed: () async {
                  if (_currentPage == 4) {
                    var response = await JobProvider().createNewJobProvider();
                    if (response.statusCode == 200 &&
                        response.statusCode == 299) {
                      setState(() {
                        _controller.animateToPage(
                          ++_currentPage,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeIn,
                        );
                      });
                    }
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

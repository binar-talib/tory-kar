import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tory_kar/custom_widgets/build_dots.dart';
import 'package:tory_kar/custom_widgets/custom_app_bar.dart';
import 'package:tory_kar/custom_widgets/custom_icon_button.dart';
import 'package:tory_kar/custom_widgets/custom_text_button.dart';
import 'package:tory_kar/custom_widgets/next_button.dart';

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

  String mobileNumber = '';
  String password = '';
  String confirmPassword = '';
  String name = '';
  String dateOfStartup = '';
  String field = '';
  String bio = '';
  String email = '';
  String companyDescription = '';
  List languages = [];
  String profileImage = '';
  String CVs = '';
  String address = '';

  createNewUser() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    // print(prefs.getStringList('selectedLanguages'));
    // print(prefs.getString('gendar'));
    var url = Uri.parse('https://tory-kar-1.herokuapp.com/api/v1/jobproviders');
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: convert.jsonEncode(
        <String, dynamic>{
          "name": name,
          "dateOfStartup": dateOfStartup,
          "fields": field,
          "bio": bio,
          "email": email,
          "companyDescription": companyDescription,
          "profileImage": "no-image.jpg",
          "address": "Erbil"
        },
      ),
    );
    if (response.statusCode == 200) {
      print(convert.jsonDecode(response.body));
    } else {
      print(convert.jsonDecode(response.body));
    }
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
                CompanyEnterMobileNumberScreen(
                  onChanged: (String value) {
                    mobileNumber = value;
                  },
                ),
                CompanyEnterPasswordScreen(
                  onChangedConfirmPassword: (String value) {
                    confirmPassword = value;
                  },
                  onChangedPassword: (String value) {
                    password = value;
                  },
                ),
                CompanyEnterVerifyCodeScreen(
                  mobileNumber: mobileNumber,
                  password: password,
                  role: role,
                ),
                CompanyEnterPersonalInformationScreen(
                  bioOnChanged: (String value) {
                    bio = value;
                  },
                  dateOfStartupOnChanged: (String value) {
                    dateOfStartup = value;
                  },
                  emailOnChanged: (String value) {
                    email = value;
                  },
                  companyNameOnChanged: (String value) {
                    name = value;
                  },
                  fieldOnChanged: (String value) {
                    field = value;
                  },
                ),
                CompanyEnterPersonalInformation2Screen(
                  onChangedCompanyDescription: (String value) {
                    companyDescription = value;
                  },
                ),
                const CompanyEnterPersonalInformation3Screen(),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              7,
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
                    createNewUser();
                    setState(() {
                      _controller.animateToPage(
                        ++_currentPage,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeIn,
                      );
                    });
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

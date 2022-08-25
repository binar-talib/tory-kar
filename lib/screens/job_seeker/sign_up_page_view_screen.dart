import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tory_kar/custom_widgets/build_dots.dart';
import 'package:tory_kar/custom_widgets/custom_app_bar.dart';
import 'package:tory_kar/custom_widgets/custom_icon_button.dart';
import 'package:tory_kar/custom_widgets/next_button.dart';
import 'package:tory_kar/screens/job_seeker/enter_mobile_number_screen.dart';

import 'enter_password_screen.dart';
import 'enter_personal_info_2_screen.dart';
import 'enter_personal_info_3_screen.dart';
import 'enter_personal_info_screen.dart';
import 'enter_verify_code_screen.dart';

class SignUpPageViewScreen extends StatefulWidget {
  const SignUpPageViewScreen({Key? key, required this.role}) : super(key: key);
  final String role;
  @override
  State<SignUpPageViewScreen> createState() => _SignUpPageViewScreenState();
}

class _SignUpPageViewScreenState extends State<SignUpPageViewScreen> {
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
  String dateOfBirth = '';
  String gendar = '';
  String bio = '';
  String email = '';
  String skills = '';
  List languages = [];
  String profileImage = '';
  String CVs = '';
  String address = '';

  createNewUser() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    print(prefs.getStringList('selectedLanguages'));
    print(prefs.getString('gendar'));
    var url = Uri.parse('https://tory-kar-1.herokuapp.com/api/v1/jobseekers');
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: convert.jsonEncode(
        <String, dynamic>{
          "name": name,
          "dateOfBirth": dateOfBirth,
          "gendar": prefs.getString('gendar')!.toLowerCase(),
          "bio": bio,
          "email": email,
          "skills": skills,
          "languages": prefs.getStringList('selectedLanguages'),
          "profileImage": "no-image.jpg",
          "CVs": ["cv1.pdf", "cv2.pdf"],
          "address": "Erbil"
        },
      ),
    );
    if (response.statusCode == 200) {
      print(convert.jsonDecode(response.body));
      Navigator.pop(context);
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
                EnterMobileNumberScreen(
                  onChanged: (String value) {
                    mobileNumber = value;
                  },
                ),
                EnterPasswordScreen(
                  onChangedConfirmPassword: (String value) {
                    confirmPassword = value;
                  },
                  onChangedPassword: (String value) {
                    password = value;
                  },
                ),
                EnterVerifyCodeScreen(
                  mobileNumber: mobileNumber,
                  password: password,
                  role: role,
                ),
                EnterPersonalInformationScreen(
                  bioOnChanged: (String value) {
                    bio = value;
                  },
                  dateOfBirthOnChanged: (String value) {
                    dateOfBirth = value;
                  },
                  emailOnChanged: (String value) {
                    email = value;
                  },
                  fullNameOnChanged: (String value) {
                    name = value;
                  },
                ),
                EnterPersonalInformation2Screen(
                  onChangedSkills: (String value) {
                    skills = value;
                  },
                ),
                EnterPersonalInformation3Screen(),
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
        child: NextButton(
          onPressed: () async {
            // final prefs = await SharedPreferences.getInstance();
            if (_currentPage == 6) {
              createNewUser();
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

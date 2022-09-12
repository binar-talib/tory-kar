import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tory_kar/custom_widgets/custom_app_bar.dart';
import 'package:tory_kar/custom_widgets/custom_icon_button.dart';
import 'package:tory_kar/custom_widgets/custom_text_button.dart';
import 'package:tory_kar/custom_widgets/custom_text_field.dart';
import 'package:tory_kar/custom_widgets/custom_texts.dart';
import 'package:tory_kar/modules/constants.dart';
import 'package:tory_kar/networking/authentication.dart';
import 'package:tory_kar/screens/job_seeker/pages_view_screen.dart';
import 'package:tory_kar/screens/job_seeker/sign_up_screen.dart';

import '../job_provider/company_page_view_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  final Authentication _authentication = Authentication();

  Future<void> login() async {
    if (password.text.isNotEmpty && phone.text.isNotEmpty) {
      int statusCode = await _authentication.userLogin(
          phone: phone.text, password: password.text);
      if (statusCode == 401) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invalid phone or password'),
          ),
        );
      } else {
        if (statusCode == 200) {
          final prefs = await SharedPreferences.getInstance();
          String userRole = await _authentication.getLoggingUser(
            token: prefs.getString('token'),
          );
          String jobProviderId = prefs.getString('_id')!;
          if (userRole == 'jobSeeker') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PagesViewScreen(),
              ),
            );
          } else if (userRole == 'jobProvider') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CompanyPageViewScreen(),
              ),
            );
          }
        }
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Blank Field not allowed.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: CustomIconButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: 'Login',
        trailing: const SizedBox(
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.2,
            ),
            CustomTextField(
              controller: phone,
              icon: const Icon(Icons.call_rounded),
              hintText: '+9647501026647',
              label: 'Phone',
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 15.0),
            CustomTextField(
              controller: password,
              icon: const Icon(Icons.lock_rounded),
              hintText: '***********',
              label: 'Password',
            ),
            SizedBox(
              height: screenHeight * 0.2,
            ),
            SizedBox(
              width: screenWidth,
              child: CustomTextButton(
                onPressed: () async {
                  login();
                },
                label: 'Login',
              ),
            ),
            const SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const AutoSizeText10(
                  text: 'Do not have an account?',
                ),
                CustomTextButton(
                  label: 'Sign up',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ),
                    );
                  },
                  bgcolor: Colors.white,
                  textColor: const Color(0xFF2B2D42),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

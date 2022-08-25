import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tory_kar/custom_widgets/custom_app_bar.dart';
import 'package:tory_kar/custom_widgets/custom_icon_button.dart';
import 'package:tory_kar/custom_widgets/custom_text_button.dart';
import 'package:tory_kar/custom_widgets/custom_text_field.dart';
import 'package:tory_kar/custom_widgets/custom_texts.dart';
import 'package:tory_kar/modules/constants.dart';
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

  Future<void> login() async {
    if (password.text.isNotEmpty && phone.text.isNotEmpty) {
      var url = Uri.parse('https://tory-kar-1.herokuapp.com/api/v1/auth/login');
      var response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: convert.jsonEncode(
          <String, String>{
            'phone': phone.text,
            'password': password.text,
          },
        ),
      );
      if (response.statusCode == 401) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invalid email or phone'),
          ),
        );
      } else {
        if (response.statusCode == 200) {
          var decodedJson = convert.jsonDecode(response.body);
          final prefs = await SharedPreferences.getInstance();
          prefs.setString('token', decodedJson['token']);

          var url2 =
              Uri.parse('https://tory-kar-1.herokuapp.com/api/v1/auth/me');
          var response2 = await http.get(
            url2,
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization': 'Bearer ${decodedJson['token']}',
            },
          );
          if (response2.statusCode == 200) {
            var decodedJson2 = convert.jsonDecode(response2.body);
            var data = decodedJson2['data'];
            prefs.setString('_id', data['_id']);
            prefs.setString('role', data['role']);
            if (data['role'] == 'jobSeeker') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PagesViewScreen(),
                ),
              );
            } else if (data['role'] == 'jobProvider') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CompanyPageViewScreen(),
                ),
              );
            }
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
                        builder: (context) => SignUpScreen(),
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

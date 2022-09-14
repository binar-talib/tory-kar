import 'package:flutter/material.dart';
import 'package:tory_kar/custom_widgets/custom_text_field.dart';
import 'package:tory_kar/modules/constants.dart';

import '../../networking/authentication.dart';

class EnterPasswordScreen extends StatefulWidget {
  const EnterPasswordScreen({Key? key}) : super(key: key);
  @override
  State<EnterPasswordScreen> createState() => _EnterPasswordScreenState();
}

class _EnterPasswordScreenState extends State<EnterPasswordScreen> {
  bool obscureText1 = true;
  bool obscureText2 = true;

  final TextEditingController passwordController = TextEditingController(
    text: Authentication.password,
  );

  final TextEditingController confirmPasswordController = TextEditingController(
    text: Authentication.confirmPassword,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
        child: Column(
          children: [
            const Text(
              'Enter a password for your account',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(
              height: screenHeight * 0.15,
            ),
            CustomTextField(
              controller: passwordController,
              onChanged: (password) {
                Authentication.password = password;
              },
              obscureText: obscureText1,
              icon: const Icon(Icons.lock_rounded),
              hintText: '***********',
              label: 'Password',
              suffixIcon: IconButton(
                padding: const EdgeInsets.only(top: 3.0),
                onPressed: () {
                  setState(() {
                    obscureText1 = !obscureText1;
                  });
                },
                icon: Icon(
                  obscureText1
                      ? Icons.visibility_off_rounded
                      : Icons.visibility,
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            CustomTextField(
              controller: confirmPasswordController,
              onChanged: (confirmPassword) {
                Authentication.confirmPassword = confirmPassword;
              },
              obscureText: obscureText2,
              icon: const Icon(Icons.call_rounded),
              hintText: '***********',
              label: 'Confirm Password',
              suffixIcon: IconButton(
                padding: const EdgeInsets.only(top: 3.0),
                onPressed: () {
                  setState(() {
                    obscureText2 = !obscureText2;
                  });
                },
                icon: Icon(
                  obscureText2
                      ? Icons.visibility_off_rounded
                      : Icons.visibility,
                ),
              ),
            ),
            MediaQuery.of(context).viewInsets.bottom == 0
                ? const SizedBox(height: 0)
                : SizedBox(
                    height: screenHeight * 0.3,
                  ),
          ],
        ),
      ),
    );
  }
}

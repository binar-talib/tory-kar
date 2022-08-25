import 'package:flutter/material.dart';
import 'package:tory_kar/screens/job_seeker/login_screen.dart';
import 'package:tory_kar/screens/job_seeker/sign_up_screen.dart';

import 'custom_text_button.dart';
import 'custom_texts.dart';

class AuthBottomSheet extends StatelessWidget {
  const AuthBottomSheet({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF737373),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFFBFBFB),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: AutoSizeText15(
                  text: title,
                ),
              ),
              const SizedBox(height: 20.0),
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
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const AutoSizeText10(text: 'have an account?'),
                  CustomTextButton(
                    label: 'Login',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );

                      // showModalBottomSheet(
                      //   isScrollControlled: true,
                      //   context: context,
                      //   builder: (context) {
                      //     return UserProfileBottomSheet(
                      //       type: 'user',
                      //     );
                      //   },
                      // );
                    },
                    bgcolor: Colors.white,
                    textColor: const Color(0xFF2B2D42),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

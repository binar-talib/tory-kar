import 'package:flutter/material.dart';
import 'package:tory_kar/custom_widgets/custom_app_bar.dart';
import 'package:tory_kar/custom_widgets/custom_icon_button.dart';
import 'package:tory_kar/custom_widgets/custom_text_button.dart';
import 'package:tory_kar/custom_widgets/custom_texts.dart';
import 'package:tory_kar/modules/constants.dart';
import 'package:tory_kar/networking/authentication.dart';
import 'package:tory_kar/screens/job_provider/company_sign_up_page_view_screen.dart';
import 'package:tory_kar/screens/job_seeker/sign_up_page_view_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: CustomIconButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: 'Sign up',
        trailing: const SizedBox(
          height: 40,
          width: 40,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            const Text(
              'I am',
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 15.0),
            SizedBox(
              width: screenWidth,
              height: 50,
              child: CustomTextButton(
                onPressed: () {
                  Authentication.role = 'jobSeeker';
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpPageViewScreen(),
                    ),
                  );
                },
                label: 'Job Seeker',
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: screenWidth,
              height: 50,
              child: CustomTextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CompanySignUpPageViewScreen(
                        role: 'jobProvider',
                      ),
                    ),
                  );
                },
                label: 'Company',
              ),
            ),
            const Spacer(),
            const SizedBox(height: 15.0),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const AutoSizeText10(
              text: 'Already have an account?',
            ),
            CustomTextButton(
              label: 'Login',
              onPressed: () {},
              bgcolor: Colors.white,
              textColor: const Color(0xFF2B2D42),
            ),
          ],
        ),
      ),
    );
  }
}

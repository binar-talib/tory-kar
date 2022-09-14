import 'package:flutter/material.dart';
import 'package:tory_kar/custom_widgets/custom_drop_down_button.dart';
import 'package:tory_kar/custom_widgets/custom_text_area.dart';
import 'package:tory_kar/custom_widgets/custom_text_field.dart';
import 'package:tory_kar/modules/constants.dart';

import '../../networking/authentication.dart';

class EnterPersonalInformationScreen extends StatefulWidget {
  const EnterPersonalInformationScreen({Key? key}) : super(key: key);

  @override
  State<EnterPersonalInformationScreen> createState() =>
      _EnterPersonalInformationScreenState();
}

class _EnterPersonalInformationScreenState
    extends State<EnterPersonalInformationScreen> {
  List<String> gender = ['Select Gender', 'Male', 'Female'];
  String _selectedGender = Authentication.gendar;

  final TextEditingController fullNameController = TextEditingController(
    text: Authentication.fullName,
  );
  final TextEditingController dateOfBirthController = TextEditingController(
    text: Authentication.dateOfBirth,
  );
  final TextEditingController bioController = TextEditingController(
    text: Authentication.bio,
  );
  final TextEditingController emailController = TextEditingController(
    text: Authentication.email,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter personal information',
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 40.0),
            CustomTextField(
              label: 'Full Name',
              hintText: 'First  Middle  Last  Name',
              icon: const Icon(Icons.account_circle_rounded),
              onChanged: (fullName) {
                Authentication.fullName = fullName;
              },
              controller: fullNameController,
            ),
            const SizedBox(height: 15.0),
            CustomTextField(
              label: 'Date of Birth',
              hintText: 'YYYY-MM-DD',
              icon: const Icon(Icons.calendar_today_rounded),
              onChanged: (dateOfBirth) {
                Authentication.dateOfBirth = dateOfBirth;
              },
              controller: dateOfBirthController,
            ),
            const SizedBox(height: 15.0),
            CustomDropDownButton(
              label: 'Gender',
              selectedValue: _selectedGender,
              listOfValues: gender,
              onChanged: (newValue) {
                setState(() {
                  _selectedGender = newValue!;
                  Authentication.gendar = newValue;
                });
              },
            ),
            const SizedBox(height: 15.0),
            CustomTextArea(
              label: 'Bio',
              hintText: 'Bio about yourself',
              onChanged: (bio) {
                Authentication.bio = bio;
              },
              controller: bioController,
            ),
            const SizedBox(height: 15.0),
            CustomTextField(
              label: 'Email',
              hintText: 'example@info.com',
              icon: const Icon(Icons.mail_outline_rounded),
              onChanged: (email) {
                Authentication.email = email;
              },
              controller: emailController,
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

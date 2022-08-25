import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tory_kar/custom_widgets/custom_drop_down_button.dart';
import 'package:tory_kar/custom_widgets/custom_text_area.dart';
import 'package:tory_kar/custom_widgets/custom_text_field.dart';
import 'package:tory_kar/modules/constants.dart';

class EnterPersonalInformationScreen extends StatefulWidget {
  const EnterPersonalInformationScreen({
    Key? key,
    required this.fullNameOnChanged,
    required this.dateOfBirthOnChanged,
    required this.bioOnChanged,
    required this.emailOnChanged,
  }) : super(key: key);

  final Function(String) fullNameOnChanged;
  final Function(String) dateOfBirthOnChanged;
  final Function(String) bioOnChanged;
  final Function(String) emailOnChanged;

  @override
  State<EnterPersonalInformationScreen> createState() =>
      _EnterPersonalInformationScreenState();
}

class _EnterPersonalInformationScreenState
    extends State<EnterPersonalInformationScreen> {
  List<String> gender = ['Male', 'Female'];
  String _selectedGender = 'Male';
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
              onChanged: widget.fullNameOnChanged,
            ),
            const SizedBox(height: 15.0),
            CustomTextField(
              label: 'Date of Birth',
              hintText: 'DD/MM/YYYY',
              icon: const Icon(Icons.calendar_today_rounded),
              onChanged: widget.dateOfBirthOnChanged,
            ),
            const SizedBox(height: 15.0),
            CustomDropDownButton(
              label: 'Gender',
              selectedValue: _selectedGender,
              listOfValues: gender,
              onChanged: (String? newValue) {
                setState(() async {
                  _selectedGender = newValue!;
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setString('gendar', _selectedGender);
                });
              },
            ),
            const SizedBox(height: 15.0),
            CustomTextArea(
              label: 'Bio',
              hintText: 'Bio about yourself',
              onChanged: widget.bioOnChanged,
            ),
            const SizedBox(height: 15.0),
            CustomTextField(
              label: 'Email',
              hintText: 'example@info.com',
              icon: const Icon(Icons.mail_outline_rounded),
              onChanged: widget.emailOnChanged,
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

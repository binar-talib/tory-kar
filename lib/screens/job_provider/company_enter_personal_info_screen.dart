import 'package:flutter/material.dart';
import 'package:tory_kar/custom_widgets/custom_text_area.dart';
import 'package:tory_kar/custom_widgets/custom_text_field.dart';
import 'package:tory_kar/modules/constants.dart';

class CompanyEnterPersonalInformationScreen extends StatefulWidget {
  const CompanyEnterPersonalInformationScreen({
    Key? key,
    required this.companyNameOnChanged,
    required this.dateOfStartupOnChanged,
    required this.bioOnChanged,
    required this.emailOnChanged,
    required this.fieldOnChanged,
  }) : super(key: key);

  final Function(String) companyNameOnChanged;
  final Function(String) dateOfStartupOnChanged;
  final Function(String) bioOnChanged;
  final Function(String) emailOnChanged;
  final Function(String) fieldOnChanged;

  @override
  State<CompanyEnterPersonalInformationScreen> createState() =>
      _CompanyEnterPersonalInformationScreen();
}

class _CompanyEnterPersonalInformationScreen
    extends State<CompanyEnterPersonalInformationScreen> {
  // List<String> gender = ['Male', 'Female'];
  // String _selectedGender = 'Male';
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
              label: 'Company Name',
              hintText: 'First  Middle  Last  Name',
              icon: const Icon(Icons.account_circle_rounded),
              onChanged: widget.companyNameOnChanged,
            ),
            const SizedBox(height: 15.0),
            CustomTextField(
              label: 'Date of Startup',
              hintText: 'DD/MM/YYYY',
              icon: const Icon(Icons.calendar_today_rounded),
              onChanged: widget.dateOfStartupOnChanged,
            ),
            const SizedBox(height: 15.0),
            // CustomDropDownButton(
            //   label: 'Gender',
            //   selectedValue: _selectedGender,
            //   listOfValues: gender,
            //   onChanged: (String? newValue) {
            //     setState(() async {
            //       _selectedGender = newValue!;
            //       final prefs = await SharedPreferences.getInstance();
            //       await prefs.setString('gendar', _selectedGender);
            //     });
            //   },
            // ),
            CustomTextField(
              label: 'Field',
              hintText: 'Software',
              icon: const Icon(
                Icons.calendar_today_rounded,
                size: 0.0,
              ),
              onChanged: widget.fieldOnChanged,
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

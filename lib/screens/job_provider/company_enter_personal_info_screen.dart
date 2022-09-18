import 'package:flutter/material.dart';
import 'package:tory_kar/custom_widgets/custom_text_area.dart';
import 'package:tory_kar/custom_widgets/custom_text_field.dart';
import 'package:tory_kar/modules/constants.dart';
import 'package:tory_kar/networking/job_provider.dart';

class CompanyEnterPersonalInformationScreen extends StatefulWidget {
  const CompanyEnterPersonalInformationScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CompanyEnterPersonalInformationScreen> createState() =>
      _CompanyEnterPersonalInformationScreen();
}

class _CompanyEnterPersonalInformationScreen
    extends State<CompanyEnterPersonalInformationScreen> {
  TextEditingController nameController = TextEditingController(
    text: JobProvider.name,
  );
  TextEditingController dateOfStartupController = TextEditingController(
    text: JobProvider.dateOfStartup,
  );
  TextEditingController fieldController = TextEditingController(
    text: JobProvider.field,
  );
  TextEditingController bioController = TextEditingController(
    text: JobProvider.bio,
  );
  TextEditingController emailController = TextEditingController(
    text: JobProvider.email,
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
              label: 'Company Name',
              hintText: 'Company Name',
              icon: const Icon(Icons.account_circle_rounded),
              onChanged: (value) {
                JobProvider.name = value;
              },
              controller: nameController,
            ),
            const SizedBox(height: 15.0),
            CustomTextField(
              label: 'Date of Startup',
              hintText: 'YYYY-MM-DD',
              icon: const Icon(Icons.calendar_today_rounded),
              onChanged: (value) {
                JobProvider.dateOfStartup = value;
              },
              controller: dateOfStartupController,
            ),
            const SizedBox(height: 15.0),
            CustomTextField(
              label: 'Field',
              hintText: 'Software',
              icon: const Icon(
                Icons.calendar_today_rounded,
                size: 0.0,
              ),
              onChanged: (value) {
                JobProvider.field = value;
              },
              controller: fieldController,
            ),
            const SizedBox(height: 15.0),
            CustomTextArea(
              label: 'Bio',
              hintText: 'Bio about yourself',
              onChanged: (value) {
                JobProvider.bio = value;
              },
              controller: bioController,
            ),
            const SizedBox(height: 15.0),
            CustomTextField(
              label: 'Email',
              hintText: 'example@info.com',
              icon: const Icon(Icons.mail_outline_rounded),
              onChanged: (value) {
                JobProvider.email = value;
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

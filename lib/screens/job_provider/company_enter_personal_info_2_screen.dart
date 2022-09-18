import 'package:flutter/material.dart';
import 'package:tory_kar/custom_widgets/custom_text_area.dart';
import 'package:tory_kar/custom_widgets/custom_text_button.dart';
import 'package:tory_kar/custom_widgets/custom_texts.dart';
import 'package:tory_kar/modules/constants.dart';
import 'package:tory_kar/networking/job_provider.dart';

class CompanyEnterPersonalInformation2Screen extends StatefulWidget {
  const CompanyEnterPersonalInformation2Screen({Key? key}) : super(key: key);

  @override
  State<CompanyEnterPersonalInformation2Screen> createState() =>
      _EnterPersonalInformation2ScreenState();
}

class _EnterPersonalInformation2ScreenState
    extends State<CompanyEnterPersonalInformation2Screen> {
  TextEditingController companyDescriptionController = TextEditingController(
    text: JobProvider.companyDescription,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextArea(
              label: 'Company Description',
              hintText: 'Write your company description...',
              maxLines: 15,
              onChanged: (value) {
                JobProvider.companyDescription = value;
              },
              controller: companyDescriptionController,
            ),
            const SizedBox(height: 15),
            const AutoSizeText15(text: 'Set profile picture'),
            const SizedBox(height: 5),
            Row(
              children: [
                Container(
                  decoration: kBoxDecoration,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      'assets/images/youtube.png',
                      height: screenWidth * 0.5,
                      width: screenWidth * 0.5,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextButton(
                      onPressed: () {},
                      label: 'Upload',
                    ),
                    const SizedBox(height: 20),
                    CustomTextButton(
                      onPressed: () {},
                      label: 'Remove',
                      bgcolor: const Color(0xFFFF0000),
                    ),
                  ],
                ),
              ],
            ),
            MediaQuery.of(context).viewInsets.bottom == 0
                ? const SizedBox(height: 0)
                : SizedBox(
                    height: screenHeight * 0.4,
                  ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tory_kar/custom_widgets/custom_text_field.dart';
import 'package:tory_kar/networking/authentication.dart';

class EnterMobileNumberScreen extends StatelessWidget {
  EnterMobileNumberScreen({Key? key}) : super(key: key);
  final TextEditingController phoneController = TextEditingController(
    text: Authentication.phone,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter your\nmobile number',
              style: TextStyle(fontSize: 20.0),
            ),
            CustomTextField(
              inputFormatters: [LengthLimitingTextInputFormatter(14)],
              controller: phoneController,
              onChanged: (phone) {
                Authentication.phone = phone;
              },
              keyboardType: TextInputType.phone,
              label: '',
              icon: const Icon(Icons.call_rounded),
              hintText: '+9647501026647',
            ),
            const SizedBox(height: 40.0),
            const Text(
              'A verification code will be sent to your mobile number',
              style: TextStyle(
                fontSize: 15.0,
                color: Color(0x802B2D42),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

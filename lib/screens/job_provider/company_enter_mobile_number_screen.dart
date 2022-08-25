import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tory_kar/custom_widgets/custom_text_field.dart';

class CompanyEnterMobileNumberScreen extends StatelessWidget {
  const CompanyEnterMobileNumberScreen({Key? key, this.onChanged})
      : super(key: key);
  final Function(String)? onChanged;
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
              'Enter company\nmobile number',
              style: TextStyle(fontSize: 20.0),
            ),
            CustomTextField(
              inputFormatters: [LengthLimitingTextInputFormatter(14)],
              onChanged: onChanged,
              keyboardType: TextInputType.phone,
              label: '',
              icon: const Icon(Icons.call_rounded),
              hintText: '+9647500000000',
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

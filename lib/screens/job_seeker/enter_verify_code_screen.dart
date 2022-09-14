import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tory_kar/custom_widgets/custom_text_button.dart';
import 'package:tory_kar/modules/constants.dart';
import 'package:tory_kar/networking/authentication.dart';

class EnterVerifyCodeScreen extends StatefulWidget {
  const EnterVerifyCodeScreen({Key? key}) : super(key: key);

  @override
  State<EnterVerifyCodeScreen> createState() => _EnterVerifyCodeScreenState();
}

class _EnterVerifyCodeScreenState extends State<EnterVerifyCodeScreen> {
  @override
  void initState() {
    super.initState();
    registerUser();
  }

  final Authentication authentication = Authentication();
  String message = '';
  String _token = '';

  Future<void> registerUser() async {
    _token = await authentication.registerUser(
      role: Authentication.role,
      phone: Authentication.phone,
      password: Authentication.password,
    );
    authentication.sendSMSVerification(token: _token);
  }

  // Future<void> checkSMSVerification({required int code}) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   var url = Uri.parse('https://tory-kar.herokuapp.com/api/v1/auth/checksms');
  //   var response = await http.post(
  //     url,
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: convert.jsonEncode(
  //       <String, dynamic>{
  //         'phone': Authentication.phone,
  //         'code': code,
  //       },
  //     ),
  //   );
  //   if (response.statusCode == 200) {
  //     print('send sms successfull  ${response.statusCode}');
  //   } else {
  //     var decodedJson = convert.jsonDecode(response.body);
  //     print('send sms fail ${decodedJson['error']}');
  //   }
  //   if (response.statusCode == 200) {
  //     prefs.setBool('verified', true);
  //   } else {
  //     print(response.statusCode);
  //     print(response.body);
  //   }
  // }

  String otp1 = '0';
  String otp2 = '0';
  String otp3 = '0';
  String otp4 = '0';
  String otp5 = '0';
  String otp6 = '0';

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
              'Enter the code sent to your mobile number',
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VerifyCodeTextField(
                  onChanged: (String value) {
                    otp1 = value;
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                ),
                VerifyCodeTextField(
                  onChanged: (String value) {
                    otp2 = value;
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                ),
                VerifyCodeTextField(
                  onChanged: (String value) {
                    otp3 = value;
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                ),
                VerifyCodeTextField(
                  onChanged: (String value) {
                    otp4 = value;
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                ),
                VerifyCodeTextField(
                  onChanged: (String value) {
                    otp5 = value;
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                ),
                VerifyCodeTextField(
                  onChanged: (String value) async {
                    otp6 = value;
                    if (value.length == 1) {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setBool('verified', false);
                      int statusCode =
                          await authentication.checkSMSVerification(
                        phone: Authentication.phone,
                        code:
                            int.parse(otp1 + otp2 + otp3 + otp4 + otp5 + otp6),
                      );
                      if (statusCode == 200) {
                        setState(() {
                          message = 'Verified successfully';
                        });
                      }
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 40.0),
            Text(
              'Sent to this number: ${Authentication.phone}',
              style: const TextStyle(
                fontSize: 15.0,
                color: Color(0x802B2D42),
              ),
            ),
            const SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: screenWidth * 0.5,
                  child: const Text(
                    'If you did not get the code please tap Re-send',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0x802B2D42),
                    ),
                  ),
                ),
                CustomTextButton(
                  onPressed: () {
                    authentication.sendSMSVerification(
                      token: _token,
                    );
                  },
                  label: 'Re-Send',
                  textColor: const Color(0xFF2B2D42),
                  bgcolor: Colors.white,
                ),
              ],
            ),
            const SizedBox(height: 50),
            Center(
              child: Text(
                message,
                style: const TextStyle(
                  fontSize: 15.0,
                  color: Color(0x802B2D42),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VerifyCodeTextField extends StatelessWidget {
  const VerifyCodeTextField({
    Key? key,
    this.onChanged,
  }) : super(key: key);
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      decoration: kBoxDecoration,
      child: TextField(
        onChanged: onChanged,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.number,
        style: const TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
        decoration: const InputDecoration(
          border: InputBorder.none,
          //hintText: '0',
        ),
      ),
    );
  }
}

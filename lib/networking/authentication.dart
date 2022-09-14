import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Authentication {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  static String phone = '';
  static String role = '';
  static String password = '';
  static String confirmPassword = '';
  static String fullName = '';
  static String dateOfBirth = '';
  static String gendar = 'Select Gender';
  static String bio = '';
  static String email = '';
  static String skills = '';
  static List<String> selectedLanguages = [];

  Future<int> userLogin({
    required String phone,
    required String password,
  }) async {
    SharedPreferences prefs = await _prefs;

    var url = Uri.parse('https://tory-kar-1.herokuapp.com/api/v1/auth/login');
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'phone': phone,
          'password': password,
        },
      ),
    );
    if (response.statusCode == 401) {
      return 401;
      //'Invalid phone or password';
    } else if (response.statusCode == 200) {
      Map<String, dynamic> decodedJson = jsonDecode(response.body);
      String token = decodedJson['token'];
      prefs.setString('token', token);
      return 200;
    } else {
      return 0;
    }
  }

  Future<String> getLoggingUser({String? token}) async {
    SharedPreferences prefs = await _prefs;
    var url = Uri.parse('https://tory-kar-1.herokuapp.com/api/v1/auth/me');
    var response2 = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if (response2.statusCode == 200) {
      var decodedJson2 = jsonDecode(response2.body);
      var data = decodedJson2['data'];
      String userId = data['_id'];
      String userRole = data['role'];
      prefs.setString('_id', userId);
      prefs.setString('role', userRole);
      return userRole;
    } else {
      throw '';
    }
  }

  Future<String> registerUser({
    required String phone,
    required String password,
    required String role,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    var url = Uri.parse('https://tory-kar.herokuapp.com/api/v1/auth/register');
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, dynamic>{
          'phone': phone,
          'password': password,
          'role': role,
        },
      ),
    );
    if (response.statusCode == 200) {
      var decodedJson = jsonDecode(response.body);
      await prefs.setString('token', decodedJson['token']);
      String token = decodedJson['token'];
      print('register successful  ${response.statusCode}');
      return token;
    } else {
      var decodedJson = jsonDecode(response.body);
      throw 'register fail ${decodedJson['error']}';
    }
  }

  Future<void> sendSMSVerification({required String token}) async {
    var url = Uri.parse('https://tory-kar.herokuapp.com/api/v1/auth/sendsms');
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, dynamic>{
          'phone': Authentication.phone,
        },
      ),
    );
    if (response.statusCode == 200) {
      print('send sms successfull  ${response.statusCode}');
    } else {
      var decodedJson = jsonDecode(response.body);
      print('send sms fail ${decodedJson['error']} ${response.statusCode}');
    }
  }

  Future<int> checkSMSVerification(
      {required int code, required String phone}) async {
    final prefs = await SharedPreferences.getInstance();
    var url = Uri.parse('https://tory-kar.herokuapp.com/api/v1/auth/checksms');
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, dynamic>{
          'phone': phone,
          'code': code,
        },
      ),
    );
    if (response.statusCode == 200) {
      print('check sms successful  ${response.statusCode}');
      prefs.setBool('verified', true);
      return 200;
    } else {
      var decodedJson = jsonDecode(response.body);
      throw 'send sms fail ${decodedJson['error']}';
    }
  }
}

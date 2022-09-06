import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Authentication {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

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
}

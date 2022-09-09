import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class JobProvider {
  Future<List> getCurrentJobProvider() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var url =
        Uri.parse('https://tory-kar-1.herokuapp.com/api/v1/jobproviders/me');
    var response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      var decodedJson = jsonDecode(response.body);
      return decodedJson['data'];
    } else {
      throw 'there is problem';
    }
  }
}

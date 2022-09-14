import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/create_new_jobseeker_model.dart';

class JobSeeker {
  Future<http.Response> createNewJobSeeker() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    var url = Uri.parse('https://tory-kar.herokuapp.com/api/v1/jobseekers');
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(
        CreateNewJobSeekerModel().toJson(),
      ),
    );
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return response;
    } else {
      print(jsonDecode(response.body));
      throw 'there is a problem';
    }
  }
}

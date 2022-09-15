import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tory_kar/models/job_seeker_model.dart';

import '../models/create_new_jobseeker_model.dart';

class JobSeeker extends ChangeNotifier {
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
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      // print(jsonDecode(response.body));
      return response;
    } else {
      throw 'there is a problem ${response.statusCode}';
    }
  }

  Future<List> getCurrentJobSeeker({required String token}) async {
    var url =
        Uri.parse('https://tory-kar-1.herokuapp.com/api/v1/jobseekers/me');
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
      throw 'there is a problem ${response.statusCode}';
    }
  }

  Future<int> updateJobSeeker({
    required String id,
    required String name,
    required String dateOfBirth,
    required String bio,
    required String gendar,
    required String skills,
    required String formattedAddress,
    required List<String> jobSeekerLanguages,
    required JobSeekerModel jobSeekerModel,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    var url =
        Uri.parse('https://tory-kar-1.herokuapp.com/api/v1/jobseekers/$id');
    var response = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(
        JobSeekerModel(
          id: id,
          name: name,
          dateOfBirth: dateOfBirth,
          bio: bio,
          gendar: gendar,
          skills: skills,
          formattedAddress: formattedAddress,
          languages: jobSeekerLanguages,
          email: jobSeekerModel.email,
          userV: jobSeekerModel.userV,
          userIsVerified: jobSeekerModel.userIsVerified,
          slug: jobSeekerModel.slug,
          profileImage: jobSeekerModel.profileImage,
          idID: jobSeekerModel.idID,
          userCreatedAt: jobSeekerModel.userCreatedAt,
          createdAt: jobSeekerModel.createdAt,
          v: jobSeekerModel.v,
          country: jobSeekerModel.country,
          latitude: jobSeekerModel.latitude,
          locationType: jobSeekerModel.locationType,
          longitude: jobSeekerModel.longitude,
          state: jobSeekerModel.state,
          alerts: jobSeekerModel.alerts,
          applications: jobSeekerModel.applications,
          cvs: jobSeekerModel.cvs,
          userEmail: jobSeekerModel.userEmail,
          userId: jobSeekerModel.userId,
          userPhone: jobSeekerModel.userPhone,
          userRole: jobSeekerModel.userRole,
        ).toJson(),
      ),
    );
    if (response.statusCode == 200) {
      notifyListeners();
      return response.statusCode;
    } else {
      throw 'there is a problem ${response.statusCode}';
    }
  }
}

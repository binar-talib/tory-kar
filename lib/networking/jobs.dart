import 'dart:convert' as convert;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/add_edit_job_model.dart';

class Jobs extends ChangeNotifier {
  Future<List> getAllJobs() async {
    http.Response response = await http.get(
      Uri.parse('https://tory-kar.herokuapp.com/api/v1/jobs'),
    );
    if (response.statusCode == 200) {
      var decodedJson = convert.jsonDecode(response.body);
      var data = decodedJson['data'];
      return data;
    } else {
      throw Exception('Failed to load Jobs');
    }
  }

  Future<List> getJobsForJobProvider({required String id}) async {
    http.Response response = await http.get(
      Uri.parse('https://tory-kar.herokuapp.com/api/v1/jobproviders/$id/jobs'),
    );
    if (response.statusCode == 200) {
      var decodedJson = convert.jsonDecode(response.body);
      var data = decodedJson['data'];
      return data;
    } else {
      throw Exception('Failed to load Jobs');
    }
  }

  Future<http.Response> createJobProviderJob({
    required String id,
    required String title,
    required String deadline,
    required String description,
    required String qualification,
    required int salary,
    required String selectedJobType,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    var url = Uri.parse(
        'https://tory-kar.herokuapp.com/api/v1/jobproviders/$id/jobs');
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(
        AddEditJobModel(
          name: title,
          deadline: deadline,
          jobDescription: description,
          jobQualifications: qualification,
          salary: salary,
          jobType: selectedJobType,
        ).toJson(),
      ),
    );
    if (response.statusCode == 200) {
      notifyListeners();
      return response;
    } else {
      throw 'there is a problem';
    }
  }

  Future<http.Response> updateJob({
    required String id,
    required String title,
    required String deadline,
    required String description,
    required String qualification,
    required int salary,
    required String selectedJobType,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    var url = Uri.parse('https://tory-kar.herokuapp.com/api/v1/jobs/$id');
    var response = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(
        AddEditJobModel(
          name: title,
          deadline: deadline,
          jobDescription: description,
          jobQualifications: qualification,
          salary: salary,
          jobType: selectedJobType,
        ).toJson(),
      ),
    );
    if (response.statusCode == 200) {
      notifyListeners();
      return response;
    } else {
      throw 'there is a problem';
    }
  }

  Future<http.Response> deleteJob({required String id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    var url = Uri.parse('https://tory-kar.herokuapp.com/api/v1/jobs/$id');

    http.Response response = await http.delete(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return response;
    } else {
      throw 'Failed to load Jobs';
    }
  }
}

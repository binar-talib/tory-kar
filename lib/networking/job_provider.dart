import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/job_provider_model.dart';

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

  Future<http.Response> updateJobProvider({
    required JobProviderModel jobProviderModel,
    required String id,
    required String name,
    required String startup,
    required String description,
    required String bio,
    required String email,
    required String fields,
    required String location,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    var url =
        Uri.parse('https://tory-kar-1.herokuapp.com/api/v1/jobproviders/$id');
    var response = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(
        JobProviderModel(
          name: name,
          dateOfStartup: startup,
          companyDescription: description,
          bio: bio,
          email: email,
          fields: fields,
          location: location,
          id: jobProviderModel.id,
          v: jobProviderModel.v,
          createdAt: jobProviderModel.createdAt,
          userCreatedAt: jobProviderModel.userCreatedAt,
          phone: jobProviderModel.phone,
          idID: jobProviderModel.idID,
          profileImage: jobProviderModel.profileImage,
          jobs: jobProviderModel.jobs,
          isApproved: jobProviderModel.isApproved,
          address: jobProviderModel.address,
          role: jobProviderModel.role,
          slug: jobProviderModel.slug,
          userID: jobProviderModel.userID,
          userIsVerified: jobProviderModel.userIsVerified,
          userV: jobProviderModel.userV,
        ).toJson(),
      ),
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      throw 'there is a problem';
    }
  }
}

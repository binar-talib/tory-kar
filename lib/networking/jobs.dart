import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class Jobs {
  Future<List> getAllJobs() async {
    http.Response response = await http.get(
      Uri.parse('https://tory-kar-1.herokuapp.com/api/v1/jobs'),
    );
    if (response.statusCode == 200) {
      var decodedJson = convert.jsonDecode(response.body);
      var data = decodedJson['data'];
      //print(data);
      return data;
    } else {
      throw Exception('Failed to load Jobs');
    }
  }
}

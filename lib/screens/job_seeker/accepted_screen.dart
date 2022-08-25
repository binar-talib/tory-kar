import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tory_kar/custom_widgets/waiting_card.dart';
import 'package:tory_kar/modules/some_data.dart';

class AcceptedScreen extends StatefulWidget {
  const AcceptedScreen({Key? key, required this.acceptedList})
      : super(key: key);
  final List acceptedList;

  @override
  State<AcceptedScreen> createState() => _AcceptedScreenState();
}

class _AcceptedScreenState extends State<AcceptedScreen> {
  List<dynamic> allJobs = [];
  List<dynamic> acceptedJobs = [];

  @override
  void initState() {
    super.initState();
    getAllJobs();
  }

  Future<void> getAllJobs() async {
    http.Response response = await http.get(
      Uri.parse('https://tory-kar-1.herokuapp.com/api/v1/jobs'),
    );
    if (response.statusCode == 200) {
      var decodedJson = convert.jsonDecode(response.body);
      allJobs = decodedJson['data'];
      setState(() {
        for (int i = 0; i < widget.acceptedList.length; i++) {
          for (int j = 0; j < allJobs.length; j++) {
            if (widget.acceptedList[i]['job'] == allJobs[j]['_id']) {
              acceptedJobs.add(allJobs[j]);
            }
          }
          print(acceptedJobs);
        }
      });
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: acceptedJobs.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(20.0),
              itemCount: acceptedJobs.length,
              itemBuilder: (context, index) {
                return WaitingCard(
                  screen: 'accepted',
                  image: jobs[index]['image'],
                  title: acceptedJobs[index]['name'],
                  company: acceptedJobs[index]['jobProvider']['name'],
                  date: widget.acceptedList[index]['meetingDate'] ??
                      "2022-05-15T12:00:00.000Z",
                );
              },
            ),
    );
  }
}

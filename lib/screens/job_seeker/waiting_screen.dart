import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tory_kar/custom_widgets/waiting_card.dart';
import 'package:tory_kar/modules/some_data.dart';

class WaitingScreen extends StatefulWidget {
  const WaitingScreen({Key? key, required this.waitingList}) : super(key: key);
  final List waitingList;

  @override
  State<WaitingScreen> createState() => _WaitingScreenState();
}

class _WaitingScreenState extends State<WaitingScreen> {
  List<dynamic> allJobs = [];
  List<dynamic> waitingJobs = [];

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
        for (int i = 0; i < widget.waitingList.length; i++) {
          for (int j = 0; j < allJobs.length; j++) {
            if (widget.waitingList[i]['job'] == allJobs[j]['_id']) {
              waitingJobs.add(allJobs[j]);
            }
          }
          print(waitingJobs);
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
      body: waitingJobs.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(20.0),
              itemCount: waitingJobs.length,
              itemBuilder: (context, index) {
                return WaitingCard(
                  screen: 'waiting',
                  image: jobs[index]['image'],
                  title: jobs[index]['title'],
                  company: jobs[index]['company'],
                  date: 'Sent on:\n${jobs[index]['deadline']}',
                );
              },
            ),
    );
  }
}

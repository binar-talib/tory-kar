import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tory_kar/custom_widgets/bottom_navy_bar_item.dart';
import 'package:tory_kar/custom_widgets/custom_app_bar.dart';
import 'package:tory_kar/modules/constants.dart';
import 'package:tory_kar/screens/job_seeker/rejected_screen.dart';
import 'package:tory_kar/screens/job_seeker/waiting_screen.dart';

import 'accepted_screen.dart';

class AppliedScreen extends StatefulWidget {
  const AppliedScreen({Key? key}) : super(key: key);

  @override
  State<AppliedScreen> createState() => _AppliedScreenState();
}

class _AppliedScreenState extends State<AppliedScreen> {
  PageController controller = PageController();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  var userData = [];
  var accepted = [];
  var rejected = [];
  var waiting = [];
  Future<void> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
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
      var decodedJson = convert.jsonDecode(response.body);
      var applications = decodedJson['data'][0]['applications'];
      for (int i = 0; i < applications.length; i++) {
        if (applications[i]['status'] == 'accept') {
          accepted.add(applications[i]);
        } else if (applications[i]['status'] == 'reject') {
          rejected.add(applications[i]);
        } else {
          waiting.add(applications[i]);
        }
      }
      setState(() {
        userData = decodedJson['data'];
      });
      print(rejected);
      print(accepted);
      print(waiting);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Applied',
      ),
      body: Column(
        children: [
          Container(
            height: 55,
            width: double.infinity,
            decoration: kBoxDecoration,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottomNavyBarItem(
                  label: 'Waiting',
                  icon: Icons.access_time,
                  color: currentPage == 0
                      ? const Color(0xFF2B2D42)
                      : const Color(0xFF2B2D42).withOpacity(0.5),
                  onTap: () {
                    currentPage = 0;
                    setState(() {
                      controller.animateToPage(currentPage,
                          duration: const Duration(
                            milliseconds: 500,
                          ),
                          curve: Curves.ease);
                    });
                  },
                ),
                BottomNavyBarItem(
                  label: 'Accepted',
                  icon: Icons.insert_drive_file,
                  color: currentPage == 1
                      ? const Color(0xFF2B2D42)
                      : const Color(0xFF2B2D42).withOpacity(0.5),
                  onTap: () {
                    currentPage = 1;
                    setState(() {
                      controller.animateToPage(currentPage,
                          duration: const Duration(
                            milliseconds: 500,
                          ),
                          curve: Curves.ease);
                    });
                  },
                ),
                BottomNavyBarItem(
                  label: 'Rejected',
                  icon: Icons.close_rounded,
                  color: currentPage == 2
                      ? const Color(0xFF2B2D42)
                      : const Color(0xFF2B2D42).withOpacity(0.5),
                  onTap: () {
                    currentPage = 2;
                    setState(() {
                      controller.animateToPage(currentPage,
                          duration: const Duration(
                            milliseconds: 500,
                          ),
                          curve: Curves.ease);
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller,
              children: [
                WaitingScreen(
                  waitingList: waiting,
                ),
                AcceptedScreen(
                  acceptedList: accepted,
                ),
                RejectedScreen(
                  rejectedList: rejected,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

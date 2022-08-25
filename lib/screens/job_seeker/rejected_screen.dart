import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tory_kar/custom_widgets/custom_texts.dart';
import 'package:tory_kar/modules/constants.dart';
import 'package:tory_kar/modules/some_data.dart';

class RejectedScreen extends StatefulWidget {
  const RejectedScreen({Key? key, required this.rejectedList})
      : super(key: key);
  final List rejectedList;

  @override
  State<RejectedScreen> createState() => _RejectedScreenState();
}

class _RejectedScreenState extends State<RejectedScreen> {
  List<dynamic> allJobs = [];
  List<dynamic> rejectedJobs = [];

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
        for (int i = 0; i < widget.rejectedList.length; i++) {
          for (int j = 0; j < allJobs.length; j++) {
            if (widget.rejectedList[i]['job'] == allJobs[j]['_id']) {
              rejectedJobs.add(allJobs[j]);
            }
          }
          print(rejectedJobs);
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
      body: rejectedJobs.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(20.0),
              itemCount: rejectedJobs.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 20.0),
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  height: 70,
                  decoration: kBoxDecoration,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(0.0),
                    dense: true,
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.asset(
                        jobs[index]['image'],
                        height: 40,
                      ),
                    ),
                    title: AutoSizeText15(
                      text: rejectedJobs[index]['name'],
                      maxLine: 1,
                    ),
                    subtitle: AutoSizeText10(
                      text: rejectedJobs[index]['jobProvider']['name'],
                      color: const Color(0xFF2B2D42).withOpacity(0.5),
                    ),
                    trailing: TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              actionsPadding: const EdgeInsets.only(
                                  right: 15.0, bottom: 10.0),
                              title: const Text('Rejection reason'),
                              content: Text(
                                widget.rejectedList[index]['rejectReason'],
                                textAlign: TextAlign.justify,
                              ),
                              actions: [
                                Container(
                                  height: 40.0,
                                  decoration: kBoxDecoration.copyWith(
                                    color: const Color(0xFF2D7171),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'Ok',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                        );
                      },
                      child: const AutoSizeText10(
                        text: 'Show\nReason',
                        color: Color(0xFF2B2D42),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

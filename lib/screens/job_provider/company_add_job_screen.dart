import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tory_kar/custom_widgets/custom_app_bar.dart';
import 'package:tory_kar/custom_widgets/custom_drop_down_button.dart';
import 'package:tory_kar/custom_widgets/custom_icon_button.dart';
import 'package:tory_kar/custom_widgets/custom_text_area.dart';
import 'package:tory_kar/custom_widgets/custom_text_field.dart';
import 'package:tory_kar/custom_widgets/next_button.dart';

class CompanyAddJobScreen extends StatefulWidget {
  const CompanyAddJobScreen({
    Key? key,
    required this.title,
    required this.deadline,
    required this.description,
    required this.qualification,
    required this.jobType,
    required this.salary,
    required this.appBarName,
    required this.id,
  }) : super(key: key);
  final String id;
  final String appBarName;
  final String title;
  final String deadline;
  final String description;
  final String qualification;
  final String jobType;
  final String salary;
  @override
  State<CompanyAddJobScreen> createState() => _CompanyAddJobScreenState();
}

class _CompanyAddJobScreenState extends State<CompanyAddJobScreen> {
  String selectedJobType = 'fullTime';
  List<String> jobType = [
    'fullTime',
    'partTime',
    'freelance',
  ];
  late String id;
  late String appBarName;
  late TextEditingController title;
  late TextEditingController deadline;
  late TextEditingController description;
  late TextEditingController qualification;
  late TextEditingController salary;

  Future<void> updateJob() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    var url = Uri.parse('https://tory-kar-1.herokuapp.com/api/v1/jobs/$id');
    var response = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: convert.jsonEncode(
        <String, dynamic>{
          'name': title.text,
          'deadline': deadline.text,
          'jobDescription': description.text,
          'jobQualifications': qualification.text,
          'salary': int.parse(salary.text),
          'jobType': selectedJobType,
        },
      ),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      Navigator.pop(context);
    }
  }

  Future<void> addJob() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    var url = Uri.parse(
        'https://tory-kar-1.herokuapp.com/api/v1/jobproviders/$id/jobs');
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: convert.jsonEncode(
        <String, dynamic>{
          'name': title.text,
          'deadline': deadline.text,
          'jobDescription': description.text,
          'jobQualifications': qualification.text,
          'salary': int.parse(salary.text),
          'jobType': selectedJobType,
        },
      ),
    );
    if (response.statusCode == 200) {
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    super.initState();
    appBarName = widget.appBarName;
    title = TextEditingController(text: widget.title);
    deadline = TextEditingController(
        text: DateFormat('yyyy-MM-dd').format(DateTime.parse(widget.deadline)));
    description = TextEditingController(text: widget.description);
    qualification = TextEditingController(text: widget.qualification);
    salary = TextEditingController(text: widget.salary);
    selectedJobType = widget.jobType;
    id = widget.id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: CustomIconButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: appBarName,
        trailing: const SizedBox(
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15.0),
              CustomTextField(
                controller: title,
                label: 'Full Name',
                icon: const Icon(Icons.account_circle_rounded),
                hintText: 'Enter Full Name',
              ),
              const SizedBox(height: 15.0),
              CustomTextField(
                controller: deadline,
                label: 'DeadLine',
                icon: const Icon(Icons.date_range_rounded),
                hintText: 'YYYY-MM-DD',
              ),
              const SizedBox(height: 15.0),
              CustomTextArea(
                controller: description,
                label: 'Job Description',
                hintText: 'Description about your job...',
                maxLines: 15,
                onChanged: (String) {},
              ),
              const SizedBox(height: 15.0),
              CustomTextArea(
                controller: qualification,
                label: 'Job Qualification',
                hintText: 'Your job qualifications...',
                maxLines: 15,
                onChanged: (String) {},
              ),
              const SizedBox(height: 15.0),
              CustomDropDownButton(
                label: 'Job Type',
                selectedValue: selectedJobType,
                listOfValues: jobType,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedJobType = newValue!;
                  });
                },
              ),
              const SizedBox(height: 15.0),
              CustomTextField(
                controller: salary,
                label: 'Salary',
                icon: const Icon(Icons.attach_money_rounded),
                hintText: '1000',
              ),
              const SizedBox(height: 15.0),
              NextButton(
                label: appBarName,
                onPressed: () {
                  appBarName == 'Edit Job' ? updateJob() : addJob();
                },
                icon: appBarName == 'Edit Job' ? Icons.edit : Icons.add_rounded,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

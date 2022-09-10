import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tory_kar/custom_widgets/custom_app_bar.dart';
import 'package:tory_kar/custom_widgets/custom_icon_button.dart';
import 'package:tory_kar/custom_widgets/custom_text_area.dart';
import 'package:tory_kar/custom_widgets/custom_text_button.dart';
import 'package:tory_kar/custom_widgets/custom_text_field.dart';
import 'package:tory_kar/modules/constants.dart';

class CompanyEditProfileScreen extends StatefulWidget {
  const CompanyEditProfileScreen(
      {Key? key,
      required this.name,
      required this.startup,
      required this.bio,
      required this.email,
      required this.location,
      required this.field,
      required this.description,
      required this.id})
      : super(key: key);
  final String name;
  final String startup;
  final String bio;
  final String email;
  final String location;
  final String field;
  final String description;
  final String id;

  @override
  State<CompanyEditProfileScreen> createState() =>
      _CompanyEditProfileScreenState();
}

class _CompanyEditProfileScreenState extends State<CompanyEditProfileScreen> {
  late TextEditingController name;
  late TextEditingController startup;
  late TextEditingController bio;
  late TextEditingController email;
  late TextEditingController location;
  late TextEditingController field;
  late TextEditingController description;
  late String id;

  @override
  void initState() {
    super.initState();
    name = TextEditingController(text: widget.name);
    startup = TextEditingController(
      text: DateFormat('yyyy-MM-dd').format(DateTime.parse(widget.startup)),
    );
    bio = TextEditingController(text: widget.bio);
    email = TextEditingController(text: widget.email);
    location = TextEditingController(text: widget.location);
    field = TextEditingController(text: widget.field);
    description = TextEditingController(text: widget.description);
    id = widget.id;
  }

  Future<void> updateJobProvider() async {
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
        <String, dynamic>{
          'name': name.text,
          'dateOfBirth': startup.text,
          'companyDescription': description.text,
          'bio': bio.text,
          'email': email.text,
          'fields': field.text,
          'location': {
            'formattedAddress': location.text,
          },
        },
      ),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      Navigator.pop(context);
    }
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
        title: 'Edit Company Profile',
        trailing: SizedBox(
          height: 40,
          width: 50,
          child: CustomTextButton(
            onPressed: () {
              updateJobProvider();
            },
            label: 'Save',
            bgcolor: Colors.white,
            textColor: const Color(0xFF2B2D42),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    decoration: kBoxDecoration,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/images/google.png',
                        height: screenWidth * 0.5,
                        width: screenWidth * 0.5,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextButton(
                        onPressed: () {},
                        label: 'Upload',
                      ),
                      const SizedBox(height: 20),
                      CustomTextButton(
                        onPressed: () {},
                        label: 'Remove',
                        bgcolor: const Color(0xFFFF0000),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              CustomTextField(
                controller: name,
                label: 'Company Name',
                icon: const Icon(Icons.account_circle_rounded),
                hintText: 'Enter Company Name',
              ),
              const SizedBox(height: 15.0),
              CustomTextField(
                controller: startup,
                label: 'Date of Startup',
                icon: const Icon(Icons.date_range_rounded),
                hintText: 'DD/MM/YYYY',
              ),
              const SizedBox(height: 15.0),
              CustomTextArea(
                controller: bio,
                label: 'Bio',
                hintText: 'Bio about company',
                onChanged: (String) {},
              ),
              const SizedBox(height: 15.0),
              CustomTextField(
                controller: email,
                label: 'Email',
                icon: const Icon(Icons.mail_outline_rounded),
                hintText: 'example@info.com',
              ),
              const SizedBox(height: 15.0),
              CustomTextField(
                controller: location,
                label: 'Location',
                icon: const Icon(Icons.location_on_rounded),
                hintText: 'Location',
                suffixIcon: CustomTextButton(
                  label: 'Change',
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 15.0),
              CustomTextField(
                controller: field,
                label: 'Field',
                icon: const Icon(
                  Icons.add,
                  size: 0.0,
                ),
                hintText: 'software',
              ),
              const SizedBox(height: 15.0),
              CustomTextArea(
                controller: description,
                label: 'Company Description',
                hintText: 'Description about your company...',
                maxLines: 15,
                onChanged: (String) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

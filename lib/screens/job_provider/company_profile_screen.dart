import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tory_kar/custom_widgets/custom_app_bar.dart';
import 'package:tory_kar/custom_widgets/custom_icon_button.dart';
import 'package:tory_kar/custom_widgets/custom_texts.dart';
import 'package:tory_kar/modules/constants.dart';
import 'package:tory_kar/modules/necessary_methods.dart';

import 'company_edit_profile_screen.dart';

class CompanyProfileScreen extends StatefulWidget {
  const CompanyProfileScreen({Key? key}) : super(key: key);

  @override
  State<CompanyProfileScreen> createState() => _CompanyProfileScreenState();
}

class _CompanyProfileScreenState extends State<CompanyProfileScreen> {
  List<dynamic> jobProvider = [];

  @override
  void initState() {
    super.initState();
    getJobProvider();
  }

  Future<void> getJobProvider() async {
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
      var decodedJson = convert.jsonDecode(response.body);
      setState(() {
        jobProvider = decodedJson['data'];
      });
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
        title: 'Profile',
        trailing: CustomIconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CompanyEditProfileScreen(
                  id: jobProvider[0]['_id'],
                  description: jobProvider[0]['companyDescription'],
                  location: jobProvider[0]['location']['formattedAddress'],
                  email: jobProvider[0]['email'],
                  bio: jobProvider[0]['bio'],
                  field: jobProvider[0]['fields'].toString(),
                  name: jobProvider[0]['name'],
                  startup: jobProvider[0]['dateOfStartup'],
                ),
              ),
            );
          },
          icon: Icons.edit,
        ),
      ),
      body: jobProvider.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: getJobProvider,
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 20.0,
                            right: 20.0,
                            left: 20.0,
                          ),
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
                                        height: screenWidth / 3,
                                        width: screenWidth / 3,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10.0),
                                  SizedBox(
                                    height: screenWidth / 3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Icon(
                                              Icons.location_on,
                                              size: 20,
                                            ),
                                            AutoSizeText10(
                                              text: jobProvider[0]['location']
                                                  ['formattedAddress'],
                                            ),
                                          ],
                                        ),
                                        AutoSizeText15(
                                          text: jobProvider[0]['name'],
                                          maxLine: 1,
                                        ),
                                        const AutoSizeText10(
                                          text: 'Software',
                                        ),
                                        AutoSizeText10(
                                          text: jobProvider[0]['email'],
                                        ),
                                        AutoSizeText10(
                                          text:
                                              'Startup: ${DateFormat('dd/MM/yyyy').format(DateTime.parse(jobProvider[0]['dateOfStartup']))}\n${calculateYears(jobProvider[0]['dateOfStartup'])} years',
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20.0),
                              const AutoSizeText15(text: 'Bio'),
                              const SizedBox(height: 5.0),
                              AutoSizeText12(
                                color:
                                    const Color(0xFF2B2D42).withOpacity(0.75),
                                text: jobProvider[0]['bio'],
                              ),
                              const SizedBox(height: 15.0),
                              const AutoSizeText15(text: 'Company Description'),
                              const SizedBox(height: 5.0),
                              AutoSizeText12(
                                color:
                                    const Color(0xFF2B2D42).withOpacity(0.75),
                                text: jobProvider[0]['companyDescription'],
                              ),
                              const SizedBox(height: 15.0),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:tory_kar/custom_widgets/custom_app_bar.dart';
import 'package:tory_kar/custom_widgets/custom_icon_button.dart';
import 'package:tory_kar/custom_widgets/custom_list_tile.dart';
import 'package:tory_kar/custom_widgets/custom_text_button.dart';
import 'package:tory_kar/custom_widgets/custom_texts.dart';
import 'package:tory_kar/modules/constants.dart';
import 'package:tory_kar/modules/necessary_methods.dart';
import 'package:tory_kar/screens/job_seeker/edit_user_profile_screen.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key, this.token}) : super(key: key);
  final String? token;

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  void initState() {
    super.initState();
    getUserData();
  }

  var userData = [];
  Future<void> getUserData() async {
    var url =
        Uri.parse('https://tory-kar-1.herokuapp.com/api/v1/jobseekers/me');
    var response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${widget.token}',
      },
    );
    if (response.statusCode == 200) {
      var decodedJson2 = convert.jsonDecode(response.body);
      setState(() {
        userData = decodedJson2['data'];
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
                builder: (context) => EditUserProfileScreen(
                  id: userData[0]['id'],
                  bio: userData[0]['bio'],
                  cvs: userData[0]['CVs'],
                  dateOfBirth: userData[0]['dateOfBirth'],
                  email: userData[0]['email'],
                  fullName: userData[0]['name'],
                  gendar: userData[0]['gendar'],
                  languages: userData[0]['languages'],
                  location: userData[0]['location']['formattedAddress'],
                  skills: userData[0]['skills'].toString(),
                ),
              ),
            );
          },
          icon: Icons.edit,
        ),
      ),
      body: userData.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: getUserData,
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
                                        'assets/images/kurdistan.jpg',
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
                                              text: userData[0]['location']
                                                  ['formattedAddress'],
                                            ),
                                          ],
                                        ),
                                        AutoSizeText15(
                                          text: userData[0]['name'],
                                          maxLine: 1,
                                        ),
                                        AutoSizeText10(
                                          text: userData[0]['gendar'],
                                        ),
                                        AutoSizeText10(
                                          text: userData[0]['email'],
                                        ),
                                        AutoSizeText10(
                                          text:
                                              'Birthday: ${DateFormat('dd/MM/yyyy').format(DateTime.parse(userData[0]['dateOfBirth']))}\n${calculateYears(userData[0]['dateOfBirth'])} years old',
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
                                text: userData[0]['bio'],
                              ),
                              const SizedBox(height: 15.0),
                              const AutoSizeText15(text: 'Skills'),
                              const SizedBox(height: 5.0),
                              AutoSizeText12(
                                color:
                                    const Color(0xFF2B2D42).withOpacity(0.75),
                                text: userData[0]['skills'].toString(),
                              ),
                              const SizedBox(height: 15.0),
                              const AutoSizeText15(text: 'Languages'),
                              const SizedBox(height: 5.0),
                            ],
                          ),
                        ),
                        GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 14.0,
                            crossAxisSpacing: 14.0,
                            mainAxisExtent: 50,
                          ),
                          padding: const EdgeInsets.only(
                            left: 20.0,
                            right: 20.0,
                            top: 16.0,
                            bottom: 29.0,
                          ),
                          itemCount: userData[0]['languages'].length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return CustomTextButton(
                              label: userData[0]['languages'][index],
                              onPressed: () {},
                              textColor: const Color(0xFF2B2D42),
                              bgcolor: Colors.white,
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const AutoSizeText15(
                                text: 'CVs',
                              ),
                              const SizedBox(height: 5.0),
                              for (var i in userData[0]['CVs'])
                                CustomListTile(
                                  title: i,
                                  leading: const Icon(Icons.insert_drive_file),
                                ),
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

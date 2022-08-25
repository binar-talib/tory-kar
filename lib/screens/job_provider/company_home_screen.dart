import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tory_kar/custom_widgets/company_job_cars.dart';
import 'package:tory_kar/custom_widgets/custom_app_bar.dart';
import 'package:tory_kar/custom_widgets/custom_icon_button.dart';
import 'package:tory_kar/custom_widgets/custom_texts.dart';
import 'package:tory_kar/custom_widgets/next_button.dart';
import 'package:tory_kar/custom_widgets/profile_button.dart';
import 'package:tory_kar/custom_widgets/search_field.dart';
import 'package:tory_kar/modules/constants.dart';
import 'package:tory_kar/screens/job_provider/company_profile_screen.dart';

import 'company_add_job_screen.dart';
import 'company_job_details_page_view_screen.dart';

class CompanyHomeScreen extends StatefulWidget {
  const CompanyHomeScreen({Key? key}) : super(key: key);

  @override
  State<CompanyHomeScreen> createState() => _CompanyHomeScreenState();
}

class _CompanyHomeScreenState extends State<CompanyHomeScreen> {
  List jobProvider = [];
  List searchedJobs = [];

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
        searchedJobs = jobProvider;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        leading: CustomIconButton(
          icon: Icons.menu,
          onPressed: () {},
        ),
        title: 'Tory Kar',
        trailing: ProfileButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CompanyProfileScreen(),
              ),
            );
          },
          image: 'assets/images/google.png',
        ),
      ),
      body: RefreshIndicator(
        onRefresh: getJobProvider,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SearchField(
                      hintText: 'Search Job..',
                      icon: Icons.search,
                      leftMargin: 0.0,
                      rightMargin: 0.0,
                      onChanged: (String query) {
                        int i = 0;
                        final searchedJobs = jobProvider.where((job) {
                          final jobTitle =
                              jobProvider[0]['jobs'][i]['name'].toLowerCase();
                          final searchTitle = query.toLowerCase();
                          i++;
                          return jobTitle.contains(searchTitle);
                        }).toList();
                        setState(() {
                          this.searchedJobs = searchedJobs;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  CustomIconButton(
                    onPressed: () {},
                    icon: Icons.filter_list,
                    bgColor: const Color(0xFF2D7171),
                    iconColor: Colors.white,
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 20.0, left: 20.0, bottom: 10.0),
              child: AutoSizeText15(
                text: 'Your Published Jobs',
              ),
            ),
            searchedJobs.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                        left: 20.0,
                        right: 20.0,
                        bottom: 60.0,
                      ),
                      itemCount: searchedJobs[0]['jobs'].length,
                      itemBuilder: (context, index) {
                        return CompanyJobCards(
                          title: searchedJobs[0]['jobs'][index]['name'],
                          salary: searchedJobs[0]['jobs'][index]['salary'],
                          type: searchedJobs[0]['jobs'][index]['jobType'],
                          location: searchedJobs[0]['jobs'][index]['location']
                              ['formattedAddress'],
                          deadline: searchedJobs[0]['jobs'][index]['deadline'],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CompanyJobDetailsPageViewScreen(
                                  location: jobProvider[0]['jobs'][index]
                                      ['location']['formattedAddress'],
                                  title: jobProvider[0]['jobs'][index]['name'],
                                  salary: jobProvider[0]['jobs'][index]
                                      ['salary'],
                                  jobType: jobProvider[0]['jobs'][index]
                                      ['jobType'],
                                  deadline: jobProvider[0]['jobs'][index]
                                      ['deadline'],
                                  description: jobProvider[0]['jobs'][index]
                                      ['jobDescription'],
                                  qualification: jobProvider[0]['jobs'][index]
                                      ['jobQualifications'],
                                  companyBrief: jobProvider[0]
                                      ['companyDescription'],
                                  id: jobProvider[0]['jobs'][index]['_id'],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 60, left: screenWidth * 0.70),
        child: NextButton(
          icon: Icons.add_rounded,
          label: 'Add Job',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CompanyAddJobScreen(
                  salary: '',
                  qualification: '',
                  jobType: 'fullTime',
                  deadline: DateTime.now().toString(),
                  appBarName: 'Add Job',
                  title: '',
                  description: '',
                  id: jobProvider[0]['_id'],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

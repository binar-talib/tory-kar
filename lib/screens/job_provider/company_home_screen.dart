import 'package:flutter/material.dart';
import 'package:tory_kar/custom_widgets/company_job_cars.dart';
import 'package:tory_kar/custom_widgets/custom_app_bar.dart';
import 'package:tory_kar/custom_widgets/custom_icon_button.dart';
import 'package:tory_kar/custom_widgets/custom_texts.dart';
import 'package:tory_kar/custom_widgets/next_button.dart';
import 'package:tory_kar/custom_widgets/profile_button.dart';
import 'package:tory_kar/custom_widgets/search_field.dart';
import 'package:tory_kar/modules/constants.dart';
import 'package:tory_kar/networking/job_provider.dart';
import 'package:tory_kar/screens/job_provider/company_profile_screen.dart';

import '../../networking/models/job_provider_job_model.dart';
import '../../networking/models/job_provider_model.dart';
import 'company_add_job_screen.dart';
import 'company_job_details_page_view_screen.dart';

class CompanyHomeScreen extends StatefulWidget {
  const CompanyHomeScreen({Key? key}) : super(key: key);

  @override
  State<CompanyHomeScreen> createState() => _CompanyHomeScreenState();
}

class _CompanyHomeScreenState extends State<CompanyHomeScreen> {
  late JobProviderModel jobProvider;
  List<JobProviderJobModel> searchedJobs = [];

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
      body: Column(
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
                      // int i = 0;
                      // final searchedJobs = this.searchedJobs.where((job) {
                      //   final jobTitle =
                      //       jobProvider[0].jobs[i].name.toLowerCase();
                      //   final searchTitle = query.toLowerCase();
                      //   i++;
                      //   return jobTitle.contains(searchTitle);
                      // }).toList();
                      // setState(() {
                      //   this.searchedJobs = searchedJobs;
                      // });
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
          Expanded(
            child: FutureBuilder<List>(
              future: JobProvider().getCurrentJobProvider(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  jobProvider = JobProviderModel.fromJson(snapshot.data![0]);
                  searchedJobs = jobProvider.jobs;
                  return ListView.builder(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      left: 20.0,
                      right: 20.0,
                      bottom: 60.0,
                    ),
                    itemCount: searchedJobs.length,
                    itemBuilder: (context, index) {
                      return CompanyJobCards(
                        title: searchedJobs[index].name,
                        salary: searchedJobs[index].salary,
                        type: searchedJobs[index].jobType,
                        location: searchedJobs[index].formattedAddress,
                        deadline: searchedJobs[index].deadline,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CompanyJobDetailsPageViewScreen(
                                location: searchedJobs[index].formattedAddress,
                                title: searchedJobs[index].name,
                                salary: searchedJobs[index].salary,
                                jobType: searchedJobs[index].jobType,
                                deadline: searchedJobs[index].deadline,
                                description: searchedJobs[index].jobDescription,
                                qualification:
                                    searchedJobs[index].jobQualifications,
                                companyBrief: jobProvider.companyDescription,
                                id: searchedJobs[index].id,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.error}'),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          )
        ],
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
                  id: jobProvider.id,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

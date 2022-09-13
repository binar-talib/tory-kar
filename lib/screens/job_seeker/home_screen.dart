import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tory_kar/custom_widgets/auth_bottom_sheet.dart';
import 'package:tory_kar/custom_widgets/custom_app_bar.dart';
import 'package:tory_kar/custom_widgets/custom_icon_button.dart';
import 'package:tory_kar/custom_widgets/custom_texts.dart';
import 'package:tory_kar/custom_widgets/filter_sheet.dart';
import 'package:tory_kar/custom_widgets/profile_button.dart';
import 'package:tory_kar/custom_widgets/search_field.dart';
import 'package:tory_kar/modules/necessary_methods.dart';
import 'package:tory_kar/screens/job_seeker/user_profile_screen.dart';

import '../../custom_widgets/job_cards.dart';
import '../../models/job_model.dart';
import '../../networking/jobs.dart';
import 'job_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List> getAllJobs;
  late List<JobModel> searchedJobs = [];
  late List<JobModel> allJobs = [];

  Future<void> refresh() async {
    setState(() {
      getAllJobs = Jobs().getAllJobs();
      getAllJobs.then((value) {
        searchedJobs =
            allJobs = value.map((e) => JobModel.fromJson(e)).toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    fetch();
  }

  fetch() async {
    getAllJobs = Jobs().getAllJobs();
    getAllJobs.then((value) {
      searchedJobs = allJobs = value.map((e) => JobModel.fromJson(e)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: CustomIconButton(
          icon: Icons.menu,
          onPressed: () {},
        ),
        title: 'tory_kar'.tr(),
        trailing: ProfileButton(
          onPressed: () async {
            final prefs = await SharedPreferences.getInstance();
            if (prefs.getString('role') == 'jobSeeker') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserProfileScreen(
                    token: prefs.getString('token'),
                  ),
                ),
              );
            } else {
              showModalBottomSheet(
                context: context,
                builder: (context) => const AuthBottomSheet(
                  title: ' You need to sign up or\nlogin to see your profile',
                ),
              );
            }
          },
          image: 'assets/images/binar.jpg',
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => refresh(),
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
                        final searchedJobs = search(
                          query: query,
                          list: allJobs,
                        );
                        setState(() {
                          this.searchedJobs = searchedJobs;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  CustomIconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return const FilterSheet();
                        },
                      );
                    },
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
                text: 'Available Jobs',
              ),
            ),
            Expanded(
              child: FutureBuilder<List>(
                future: getAllJobs,
                // Provider.of<Jobs>(context).getAllJobs(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // searchedJobs = allJobs = snapshot.data!
                    //     .map((e) => JobModel.fromJson(e))
                    //     .toList();
                    return ListView.builder(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                        left: 20.0,
                        right: 20.0,
                        bottom: 60.0,
                      ),
                      itemCount: searchedJobs.length,
                      itemBuilder: (context, index) {
                        return JobCards(
                          title: searchedJobs[index].name,
                          company: searchedJobs[index].jobProviderName,
                          salary: searchedJobs[index].salary,
                          type: searchedJobs[index].jobType,
                          location: searchedJobs[index].formattedAddress,
                          deadline: searchedJobs[index].deadline,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => JobDetailsScreen(
                                  title: searchedJobs[index].name,
                                  salary: searchedJobs[index].salary,
                                  jobType: searchedJobs[index].jobType,
                                  location:
                                      searchedJobs[index].formattedAddress,
                                  deadline: searchedJobs[index].deadline,
                                  qualification:
                                      searchedJobs[index].jobQualifications,
                                  description:
                                      searchedJobs[index].jobDescription,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  } else {
                    Center(
                      child: Text('${snapshot.error}'),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// child: searchedJobs.isEmpty
// ? const Center(
// child: CircularProgressIndicator(),
// )
// : ListView.builder(
// padding: const EdgeInsets.only(
// top: 10.0,
// left: 20.0,
// right: 20.0,
// bottom: 60.0,
// ),
// itemCount: searchedJobs.length,
// itemBuilder: (context, index) {
// return JobCards(
// title: searchedJobs[index].name,
// company: searchedJobs[index].jobProviderName,
// salary: searchedJobs[index].salary,
// type: searchedJobs[index].jobType,
// location: searchedJobs[index].formattedAddress,
// deadline: searchedJobs[index].deadline,
// onTap: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => JobDetailsScreen(
// title: searchedJobs[index].name,
// salary: searchedJobs[index].salary,
// jobType: searchedJobs[index].jobType,
// location:
// searchedJobs[index].formattedAddress,
// deadline: searchedJobs[index].deadline,
// qualification:
// searchedJobs[index].jobQualifications,
// description:
// searchedJobs[index].jobDescription,
// ),
// ),
// );
// });
// },
// ),

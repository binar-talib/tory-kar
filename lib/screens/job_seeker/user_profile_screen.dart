import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tory_kar/custom_widgets/custom_app_bar.dart';
import 'package:tory_kar/custom_widgets/custom_icon_button.dart';
import 'package:tory_kar/custom_widgets/custom_list_tile.dart';
import 'package:tory_kar/custom_widgets/custom_text_button.dart';
import 'package:tory_kar/custom_widgets/custom_texts.dart';
import 'package:tory_kar/models/job_seeker_model.dart';
import 'package:tory_kar/modules/constants.dart';
import 'package:tory_kar/modules/necessary_methods.dart';
import 'package:tory_kar/networking/job_seeker.dart';
import 'package:tory_kar/screens/job_seeker/edit_user_profile_screen.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key, this.token}) : super(key: key);
  final String? token;

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  late JobSeekerModel jobSeekerModel;

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
                  id: jobSeekerModel.id,
                  bio: jobSeekerModel.bio,
                  cvs: jobSeekerModel.cvs,
                  dateOfBirth: jobSeekerModel.dateOfBirth,
                  email: jobSeekerModel.email,
                  fullName: jobSeekerModel.name,
                  gendar: jobSeekerModel.gendar,
                  jobSeekerLanguages: jobSeekerModel.languages,
                  location: jobSeekerModel.formattedAddress,
                  skills: jobSeekerModel.skills,
                  jobSeekerModel: jobSeekerModel,
                ),
              ),
            );
          },
          icon: Icons.edit,
        ),
      ),
      body: FutureBuilder<List>(
        future: Provider.of<JobSeeker>(context, listen: true)
            .getCurrentJobSeeker(token: widget.token!),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            jobSeekerModel = JobSeekerModel.fromJson(snapshot.data![0]);
            return Column(
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
                                            text:
                                                jobSeekerModel.formattedAddress,
                                          ),
                                        ],
                                      ),
                                      AutoSizeText15(
                                        text: jobSeekerModel.name,
                                        maxLine: 1,
                                      ),
                                      AutoSizeText10(
                                        text: jobSeekerModel.gendar,
                                      ),
                                      AutoSizeText10(
                                        text: jobSeekerModel.email,
                                      ),
                                      AutoSizeText10(
                                        text:
                                            'Birthday: ${DateFormat('dd/MM/yyyy').format(DateTime.parse(jobSeekerModel.dateOfBirth))}\n${calculateYears(jobSeekerModel.dateOfBirth)} years old',
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
                              color: const Color(0xFF2B2D42).withOpacity(0.75),
                              text: jobSeekerModel.bio,
                            ),
                            const SizedBox(height: 15.0),
                            const AutoSizeText15(text: 'Skills'),
                            const SizedBox(height: 5.0),
                            AutoSizeText12(
                              color: const Color(0xFF2B2D42).withOpacity(0.75),
                              text: jobSeekerModel.skills,
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
                        itemCount: jobSeekerModel.languages.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return CustomTextButton(
                            label: jobSeekerModel.languages[index],
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
                            for (var i in jobSeekerModel.cvs)
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
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

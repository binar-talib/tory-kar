import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tory_kar/custom_widgets/custom_app_bar.dart';
import 'package:tory_kar/custom_widgets/custom_icon_button.dart';
import 'package:tory_kar/custom_widgets/custom_texts.dart';
import 'package:tory_kar/modules/constants.dart';
import 'package:tory_kar/modules/necessary_methods.dart';
import 'package:tory_kar/networking/job_provider.dart';

import '../../models/job_provider_model.dart';
import 'company_edit_profile_screen.dart';

class CompanyProfileScreen extends StatefulWidget {
  const CompanyProfileScreen({Key? key}) : super(key: key);

  @override
  State<CompanyProfileScreen> createState() => _CompanyProfileScreenState();
}

class _CompanyProfileScreenState extends State<CompanyProfileScreen> {
  late JobProviderModel jobProvider;

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
                  jobProviderModel: jobProvider,
                ),
              ),
            );
          },
          icon: Icons.edit,
        ),
      ),
      body: FutureBuilder<List>(
          future: JobProvider().getCurrentJobProvider(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              jobProvider = JobProviderModel.fromJson(snapshot.data![0]);
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
                                              text: jobProvider.location,
                                            ),
                                          ],
                                        ),
                                        AutoSizeText15(
                                          text: jobProvider.name,
                                          maxLine: 1,
                                        ),
                                        const AutoSizeText10(
                                          text: 'Software',
                                        ),
                                        AutoSizeText10(
                                          text: jobProvider.email,
                                        ),
                                        AutoSizeText10(
                                          text:
                                              'Startup: ${DateFormat('dd/MM/yyyy').format(DateTime.parse(jobProvider.dateOfStartup))}\n${calculateYears(jobProvider.dateOfStartup)} years',
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
                                text: jobProvider.bio,
                              ),
                              const SizedBox(height: 15.0),
                              const AutoSizeText15(text: 'Company Description'),
                              const SizedBox(height: 5.0),
                              AutoSizeText12(
                                color:
                                    const Color(0xFF2B2D42).withOpacity(0.75),
                                text: jobProvider.companyDescription,
                              ),
                              const SizedBox(height: 15.0),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
          }),
    );
  }
}

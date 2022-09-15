import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tory_kar/custom_widgets/custom_app_bar.dart';
import 'package:tory_kar/custom_widgets/custom_drop_down_button.dart';
import 'package:tory_kar/custom_widgets/custom_icon_button.dart';
import 'package:tory_kar/custom_widgets/custom_list_tile.dart';
import 'package:tory_kar/custom_widgets/custom_text_area.dart';
import 'package:tory_kar/custom_widgets/custom_text_button.dart';
import 'package:tory_kar/custom_widgets/custom_text_field.dart';
import 'package:tory_kar/custom_widgets/custom_texts.dart';
import 'package:tory_kar/models/job_seeker_model.dart';
import 'package:tory_kar/modules/constants.dart';
import 'package:tory_kar/networking/job_seeker.dart';

import '../../modules/languages.dart';

class EditUserProfileScreen extends StatefulWidget {
  const EditUserProfileScreen({
    Key? key,
    required this.id,
    required this.fullName,
    required this.dateOfBirth,
    required this.bio,
    required this.email,
    required this.gendar,
    required this.skills,
    required this.location,
    required this.cvs,
    required this.jobSeekerLanguages,
    required this.jobSeekerModel,
  }) : super(key: key);

  final String id;
  final String fullName;
  final String dateOfBirth;
  final String bio;
  final String email;
  final String gendar;
  final String skills;
  final String location;
  final List<String> cvs;
  final List<String> jobSeekerLanguages;
  final JobSeekerModel jobSeekerModel;
  @override
  State<EditUserProfileScreen> createState() => _EditUserProfileScreenState();
}

class _EditUserProfileScreenState extends State<EditUserProfileScreen> {
  String selectedGender = 'male';
  List<String> gender = [
    'select gender',
    'male',
    'female',
  ];
  late List<String> jobSeekerLanguages;
  late List<String> cvs;
  late TextEditingController fullName;
  late TextEditingController dateOfBirth;
  late TextEditingController bio;
  late TextEditingController email;
  late TextEditingController gendar;
  late TextEditingController skills;
  late TextEditingController location;
  late String id;
  late JobSeekerModel jobSeekerModel;

  @override
  void initState() {
    super.initState();
    jobSeekerLanguages = widget.jobSeekerLanguages;
    cvs = widget.cvs;
    fullName = TextEditingController(text: widget.fullName);
    dateOfBirth = TextEditingController(
      text: DateFormat('yyyy-MM-dd').format(DateTime.parse(widget.dateOfBirth)),
    );
    bio = TextEditingController(text: widget.bio);
    email = TextEditingController(text: widget.email);
    selectedGender = widget.gendar;
    skills = TextEditingController(text: widget.skills);
    location = TextEditingController(text: widget.location);
    id = widget.id;
    jobSeekerModel = widget.jobSeekerModel;
  }

  Future<void> updateJobSeeker() async {
    int response =
        await Provider.of<JobSeeker>(context, listen: false).updateJobSeeker(
      id: id,
      name: fullName.text,
      dateOfBirth: dateOfBirth.text,
      bio: bio.text,
      gendar: selectedGender,
      skills: skills.text,
      formattedAddress: location.text,
      jobSeekerLanguages: jobSeekerLanguages,
      jobSeekerModel: jobSeekerModel,
    );
    if (response == 200) {
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
        title: 'Edit Profile',
        trailing: SizedBox(
          height: 40,
          width: 50,
          child: CustomTextButton(
            onPressed: () {
              updateJobSeeker();
            },
            label: 'save'.tr(),
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
                        'assets/images/kurdistan.jpg',
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
                        label: 'upload'.tr(),
                      ),
                      const SizedBox(height: 20),
                      CustomTextButton(
                        onPressed: () {},
                        label: 'remove'.tr(),
                        bgcolor: const Color(0xFFFF0000),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              CustomTextField(
                controller: fullName,
                label: 'Full Name',
                icon: const Icon(Icons.account_circle_rounded),
                hintText: 'Enter Full Name',
              ),
              const SizedBox(height: 15.0),
              CustomTextField(
                controller: dateOfBirth,
                label: 'Date of Birth',
                icon: const Icon(Icons.date_range_rounded),
                hintText: 'DD/MM/YYYY',
              ),
              const SizedBox(height: 15.0),
              CustomTextArea(
                controller: bio,
                label: 'Bio',
                hintText: 'Bio about yourself',
                onChanged: (value) {},
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
              CustomDropDownButton(
                label: 'Gender',
                selectedValue: selectedGender,
                listOfValues: gender,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedGender = newValue!;
                  });
                },
              ),
              const SizedBox(height: 15.0),
              CustomTextArea(
                controller: skills,
                label: 'Skills',
                hintText: 'Your skills...',
                maxLines: 15,
                onChanged: (value) {},
              ),
              const SizedBox(height: 15.0),
              const AutoSizeText15(text: 'Languages'),
              Container(
                margin: const EdgeInsets.only(
                  left: 0,
                  right: 0,
                  top: 5.0,
                ),
                padding:
                    const EdgeInsets.only(right: 15.0, left: 15.0, top: 2.0),
                height: 40.0,
                width: screenWidth,
                decoration: kBoxDecoration,
                child: TypeAheadField(
                  textFieldConfiguration: const TextFieldConfiguration(
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search_rounded),
                      suffixIconConstraints: BoxConstraints(maxWidth: 20.0),
                      isDense: true,
                      border: InputBorder.none,
                      hintText: 'Search Languages',
                      hintStyle: TextStyle(
                        fontSize: 12.0,
                        color: Color(0x802B2D42),
                      ),
                    ),
                  ),
                  suggestionsCallback: (pattern) {
                    int i = 0;
                    final selectedLanguages = languages.where((language) {
                      final languageName = languages[i].toLowerCase();
                      final searchLanguage = pattern.toLowerCase();
                      i++;
                      return languageName.contains(searchLanguage);
                    }).toList();
                    return selectedLanguages;
                  },
                  itemBuilder: (context, suggestion) {
                    return ListTile(
                      title: Text("$suggestion"),
                    );
                  },
                  onSuggestionSelected: (suggestion) {
                    setState(() {
                      jobSeekerLanguages.add("$suggestion");
                      jobSeekerLanguages = jobSeekerLanguages.toSet().toList();
                      suggestion = " ";
                    });
                  },
                ),
              ),
              Divider(
                thickness: 1.0,
                height: 30,
                endIndent: screenWidth * 0.5,
                color: const Color(0xFF2B2D42).withOpacity(0.5),
              ),
              for (var i in jobSeekerLanguages)
                CustomListTile(
                  title: i,
                  trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        jobSeekerLanguages.remove(i);
                      });
                    },
                    icon: const Icon(
                      Icons.delete_rounded,
                      color: Color(0xFFFF0000),
                    ),
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AutoSizeText15(text: 'Upload CVs'),
                      const SizedBox(height: 5.0),
                      AutoSizeText12(
                        text: 'Max ${cvs.length}/5',
                        color: const Color(0x802B2D42),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5.0, bottom: 15.0),
                        width: screenWidth * 0.5,
                        height: 1,
                        color: const Color(0xFF2B2D42).withOpacity(0.5),
                      )
                    ],
                  ),
                  CustomIconButton(
                    onPressed: () {},
                    bgColor: const Color(0xFF2D7171),
                    iconColor: Colors.white,
                    icon: Icons.add_rounded,
                  ),
                ],
              ),
              for (var i in cvs)
                CustomListTile(
                  title: i,
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete_rounded,
                      color: Color(0xFFFF0000),
                    ),
                  ),
                  leading: const Icon(Icons.insert_drive_file),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

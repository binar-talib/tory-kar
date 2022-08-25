import 'package:flutter/material.dart';
import 'package:tory_kar/custom_widgets/custom_text_area.dart';
import 'package:tory_kar/custom_widgets/custom_text_field.dart';
import 'package:tory_kar/custom_widgets/select_cv_sheet.dart';
import 'package:tory_kar/modules/constants.dart';

import 'company_applicant_reject_accept_sheet.dart';
import 'custom_icon_button.dart';
import 'custom_text_button.dart';
import 'custom_texts.dart';

class UserProfileBottomSheet extends StatefulWidget {
  const UserProfileBottomSheet({Key? key, required this.type})
      : super(key: key);
  final String type;

  @override
  State<UserProfileBottomSheet> createState() => _UserProfileBottomSheetState();
}

class _UserProfileBottomSheetState extends State<UserProfileBottomSheet> {
  List<String> languages = ['Kurdish', 'English', 'Arabic', 'Turkish'];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF737373),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFFBFBFB),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            // Divider
            Container(
              margin: const EdgeInsets.only(
                top: 40.0,
                left: 100.0,
                right: 100.0,
                bottom: 20.0,
              ),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10.0),
              ),
              height: 3,
            ),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                                  'assets/images/binar.jpg',
                                  height: screenWidth / 3,
                                  width: screenWidth / 3,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            SizedBox(
                              height: MediaQuery.of(context).size.width / 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Icon(
                                        Icons.location_on,
                                        size: 20,
                                      ),
                                      AutoSizeText10(
                                        text: 'location',
                                      ),
                                    ],
                                  ),
                                  const AutoSizeText15(
                                    text: 'Binar Talib',
                                    maxLine: 1,
                                  ),
                                  const AutoSizeText10(
                                    text: 'Male',
                                  ),
                                  const AutoSizeText10(
                                    text: 'binartalib2000@gmail.com',
                                  ),
                                  const AutoSizeText10(
                                    text: 'Birthday: 21/01/2000\n21 years old',
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
                            text:
                                'Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industrys standard dummy text ever since the 1500s,when an unknown printer took a galley of type and scrambled it to make a typespecimen book.'),
                        const SizedBox(height: 15.0),
                        const AutoSizeText15(text: 'Skills'),
                        const SizedBox(height: 5.0),
                        AutoSizeText12(
                            color: const Color(0xFF2B2D42).withOpacity(0.75),
                            text:
                                'Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industrys standard dummy text ever since the 1500s,when an unknown printer took a galley of type and scrambled it to make a typespecimen book.'
                                'Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industrys standard dummy text ever since the 1500s,when an unknown printer took a galley of type and scrambled it to make a typespecimen book.'),
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
                        left: 20.0, right: 20.0, top: 16.0, bottom: 29.0),
                    itemCount: languages.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return CustomTextButton(
                        label: languages[index],
                        onPressed: () {},
                        textColor: const Color(0xFF2B2D42),
                        bgcolor: Colors.white,
                      );
                    },
                  ),
                  SizedBox(height: widget.type == 'user' ? 15.0 : 10.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: widget.type == 'user'
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const AutoSizeText15(text: 'CV'),
                              CustomTextButton(
                                label: 'Select a CV',
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return const SelectCVSheet();
                                    },
                                  );
                                },
                              ),
                            ],
                          )
                        : const AutoSizeText15(text: 'CV'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 15.0,
                    ),
                    child: Container(
                      decoration: kBoxDecoration,
                      child: ListTile(
                        dense: true,
                        leading: const Icon(Icons.insert_drive_file),
                        title: const AutoSizeText15(text: 'Title'),
                        onTap: () {},
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: widget.type == 'user'
                        ? Row(
                            children: [
                              CustomIconButton(
                                onPressed: () {},
                                icon: Icons.edit,
                              ),
                              const SizedBox(width: 20.0),
                              Expanded(
                                child: CustomTextButton(
                                  label: 'Apply Now',
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTextButton(
                                label: 'Reject',
                                onPressed: () {
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (context) {
                                      return SingleChildScrollView(
                                        padding: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                              .viewInsets
                                              .bottom,
                                        ),
                                        child:
                                            CompanyApplicantAcceptRejectSheet(
                                          children: [
                                            CustomTextArea(
                                              label: 'Rejection Reason',
                                              maxLines: 15,
                                              hintText:
                                                  'Write why you rejected this applicant...',
                                              onChanged: (String) {},
                                            ),
                                            const SizedBox(height: 15.0),
                                            SizedBox(
                                              width: screenWidth,
                                              child: CustomTextButton(
                                                label: 'Send',
                                                onPressed: () {},
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                bgcolor: const Color(0xFFFF0000),
                              ),
                              CustomTextButton(
                                label: 'Accept',
                                onPressed: () {
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (context) {
                                      return SingleChildScrollView(
                                        padding: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                              .viewInsets
                                              .bottom,
                                        ),
                                        child:
                                            const CompanyApplicantAcceptRejectSheet(
                                          children: [
                                            CustomTextField(
                                              icon: Icon(
                                                  Icons.date_range_rounded),
                                              hintText: '21/5/2022',
                                              label: 'Meeting Date',
                                            ),
                                            SizedBox(height: 15.0),
                                            CustomTextField(
                                              icon: Icon(
                                                  Icons.access_time_rounded),
                                              hintText: '12:00',
                                              label: 'At',
                                            ),
                                            SizedBox(height: 15.0),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
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

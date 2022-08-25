import 'package:flutter/material.dart';
import 'package:tory_kar/custom_widgets/custom_icon_button.dart';
import 'package:tory_kar/custom_widgets/custom_list_tile.dart';
import 'package:tory_kar/custom_widgets/custom_text_button.dart';
import 'package:tory_kar/custom_widgets/custom_texts.dart';
import 'package:tory_kar/modules/constants.dart';

class EnterPersonalInformation3Screen extends StatefulWidget {
  const EnterPersonalInformation3Screen({Key? key}) : super(key: key);

  @override
  State<EnterPersonalInformation3Screen> createState() =>
      _EnterPersonalInformation3ScreenState();
}

class _EnterPersonalInformation3ScreenState
    extends State<EnterPersonalInformation3Screen> {
  List<String> cvs = ['Oil', 'Software', 'Web'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
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
                      'assets/images/binar.jpg',
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
            const SizedBox(height: 15),
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
    );
  }
}

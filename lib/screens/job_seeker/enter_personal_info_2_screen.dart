import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tory_kar/custom_widgets/custom_list_tile.dart';
import 'package:tory_kar/custom_widgets/custom_text_area.dart';
import 'package:tory_kar/custom_widgets/custom_texts.dart';
import 'package:tory_kar/modules/constants.dart';
import 'package:tory_kar/modules/languages.dart';

class EnterPersonalInformation2Screen extends StatefulWidget {
  const EnterPersonalInformation2Screen(
      {Key? key, required this.onChangedSkills})
      : super(key: key);
  final Function(String) onChangedSkills;

  @override
  State<EnterPersonalInformation2Screen> createState() =>
      _EnterPersonalInformation2ScreenState();
}

class _EnterPersonalInformation2ScreenState
    extends State<EnterPersonalInformation2Screen> {
  final List<String> _selectedLanguages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextArea(
              label: 'Skills',
              hintText: 'Write your skills...',
              maxLines: 15,
              onChanged: widget.onChangedSkills,
            ),
            const SizedBox(height: 15),
            const AutoSizeText15(text: 'Languages'),
            Container(
              margin: const EdgeInsets.only(
                left: 0,
                right: 0,
                top: 5.0,
              ),
              padding: const EdgeInsets.only(right: 15.0, left: 15.0, top: 2.0),
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
                  final _selectedLanguages = languages.where((language) {
                    final languageName = languages[i].toLowerCase();
                    final searchLanguage = pattern.toLowerCase();
                    i++;
                    return languageName.contains(searchLanguage);
                  }).toList();
                  return _selectedLanguages;
                },
                itemBuilder: (context, suggestion) {
                  return ListTile(
                    title: Text("$suggestion"),
                  );
                },
                onSuggestionSelected: (suggestion) {
                  setState(() async {
                    _selectedLanguages.add("$suggestion");
                    suggestion = " ";
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setStringList(
                        "selectedLanguages", _selectedLanguages);
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
            for (var i in _selectedLanguages)
              CustomListTile(
                title: i,
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      _selectedLanguages.remove(i);
                    });
                  },
                  icon: const Icon(
                    Icons.delete_rounded,
                    color: Color(0xFFFF0000),
                  ),
                ),
              ),
            MediaQuery.of(context).viewInsets.bottom == 0
                ? const SizedBox(height: 0)
                : SizedBox(
                    height: screenHeight * 0.4,
                  ),
          ],
        ),
      ),
    );
  }
}

// const SearchField(
// icon: Icons.search_rounded,
// hintText: 'Search Languages',
// leftMargin: 0,
// rightMargin: 0,
// topMargin: 5.0,
// ),

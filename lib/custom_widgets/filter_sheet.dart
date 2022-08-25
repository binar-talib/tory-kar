import 'package:flutter/material.dart';
import 'package:tory_kar/custom_widgets/search_field.dart';
import 'package:tory_kar/modules/constants.dart';

import 'custom_text_button.dart';
import 'custom_texts.dart';

class FilterSheet extends StatefulWidget {
  const FilterSheet({Key? key}) : super(key: key);

  @override
  _FilterSheetState createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  List<String> cities = [
    'Hawler',
    'Slemani',
    'Halabja',
    'Duhok',
    'Mousl',
    'Kerkuk'
  ];
  RangeValues _currentDistanceValues = const RangeValues(40, 80);
  RangeValues _currentSalaryValues = const RangeValues(1000, 5000);
  String dropDownValue = 'Hawler';
  String jobType = 'Full time';
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
        height: screenHeight * 0.65,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: AutoSizeText15(
                  text: 'Filter',
                ),
              ),
              Row(
                children: [
                  AutoSizeText10(
                    text:
                        'Find Within: ${_currentDistanceValues.start.toInt()} - ${_currentDistanceValues.end.toInt()} Km',
                  ),
                  const Spacer(),
                  const AutoSizeText10(
                    text: 'in: ',
                  ),
                  DropdownButton<String>(
                    value: dropDownValue,
                    icon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                    ),
                    elevation: 16,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropDownValue = newValue!;
                      });
                    },
                    items: cities.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: AutoSizeText10(
                          text: value,
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
              SliderTheme(
                data: const SliderThemeData(
                  rangeThumbShape:
                      RoundRangeSliderThumbShape(enabledThumbRadius: 6),
                ),
                child: RangeSlider(
                  activeColor: const Color(0xFF2B2D42),
                  inactiveColor: const Color(0xFF2B2D42).withOpacity(0.5),
                  max: 100,
                  min: 1,
                  values: _currentDistanceValues,
                  onChanged: (RangeValues values) {
                    setState(() {
                      _currentDistanceValues = values;
                    });
                  },
                ),
              ),
              AutoSizeText10(
                text:
                    'Salary: \$${_currentSalaryValues.start.toInt()} - \$${_currentSalaryValues.end.toInt()} ',
              ),
              SliderTheme(
                data: const SliderThemeData(
                  rangeThumbShape:
                      RoundRangeSliderThumbShape(enabledThumbRadius: 6),
                ),
                child: RangeSlider(
                  activeColor: const Color(0xFF2B2D42),
                  inactiveColor: const Color(0xFF2B2D42).withOpacity(0.5),
                  max: 10000,
                  min: 300,
                  values: _currentSalaryValues,
                  onChanged: (RangeValues values) {
                    setState(() {
                      _currentSalaryValues = values;
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextButton(
                    onPressed: () {
                      setState(() {
                        jobType = 'Full time';
                      });
                    },
                    label: 'Full time',
                    textColor: jobType == 'Full time'
                        ? Colors.white
                        : const Color(0xFF2B2D42),
                    bgcolor: jobType == 'Full time'
                        ? const Color(0xFF2D7171)
                        : Colors.white,
                  ),
                  CustomTextButton(
                    onPressed: () {
                      setState(() {
                        jobType = 'Part time';
                      });
                    },
                    label: 'Part time',
                    textColor: jobType == 'Part time'
                        ? Colors.white
                        : const Color(0xFF2B2D42),
                    bgcolor: jobType == 'Part time'
                        ? const Color(0xFF2D7171)
                        : Colors.white,
                  ),
                  CustomTextButton(
                    onPressed: () {
                      setState(() {
                        jobType = 'Freelancing';
                      });
                    },
                    label: 'Freelancing',
                    textColor: jobType == 'Freelancing'
                        ? Colors.white
                        : const Color(0xFF2B2D42),
                    bgcolor: jobType == 'Freelancing'
                        ? const Color(0xFF2D7171)
                        : Colors.white,
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              const SearchField(
                icon: Icons.search,
                hintText: 'Write company name...',
                leftMargin: 0.0,
                rightMargin: 0.0,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  const Spacer(),
                  CustomTextButton(
                    label: 'Cancel',
                    onPressed: () {},
                    bgcolor: Colors.white,
                    textColor: const Color(0xFF2B2D42),
                  ),
                  const SizedBox(width: 20.0),
                  CustomTextButton(label: 'Apply', onPressed: () {}),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

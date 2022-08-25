import 'package:flutter/material.dart';
import 'package:tory_kar/custom_widgets/company_job_cars.dart';
import 'package:tory_kar/custom_widgets/custom_app_bar.dart';
import 'package:tory_kar/custom_widgets/custom_icon_button.dart';
import 'package:tory_kar/custom_widgets/custom_texts.dart';
import 'package:tory_kar/custom_widgets/search_field.dart';
import 'package:tory_kar/modules/some_data.dart';

import 'company_done_job_details_page_view_screen.dart';

class CompanyDoneScreen extends StatelessWidget {
  const CompanyDoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Done',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: SearchField(
                    hintText: 'Search Job..',
                    icon: Icons.search,
                    leftMargin: 0.0,
                    rightMargin: 0.0,
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
              text: 'Your Done Jobs',
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(
                top: 10.0,
                left: 20.0,
                right: 20.0,
                bottom: 60.0,
              ),
              itemCount: jobs.length,
              itemBuilder: (context, index) {
                return CompanyJobCards(
                  title: jobs[index]['title'],
                  salary: jobs[index]['salary'],
                  type: jobs[index]['type'],
                  location: jobs[index]['location'],
                  deadline: '2022-05-16T00:00:00.000Z',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CompanyDoneJobDetailsPageViewScreen(),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

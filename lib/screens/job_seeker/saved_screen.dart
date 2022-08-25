import 'package:flutter/material.dart';
import 'package:tory_kar/custom_widgets/custom_app_bar.dart';
import 'package:tory_kar/custom_widgets/job_cards.dart';
import 'package:tory_kar/custom_widgets/search_field.dart';
import 'package:tory_kar/modules/some_data.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Saved Jobs',
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: SearchField(
              icon: Icons.search,
              hintText: 'Search Saved Jobs..',
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(
                top: 20.0,
                left: 20.0,
                right: 20.0,
                bottom: 60.0,
              ),
              itemCount: jobs.length,
              itemBuilder: (context, index) {
                return JobCards(
                  image: jobs[index]['image'],
                  title: jobs[index]['title'],
                  company: jobs[index]['company'],
                  salary: jobs[index]['salary'],
                  type: jobs[index]['type'],
                  location: jobs[index]['location'],
                  deadline: jobs[index]['deadline'],
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

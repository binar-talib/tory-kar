import 'package:flutter/material.dart';
import 'package:tory_kar/custom_widgets/user_profile_sheet.dart';
import 'package:tory_kar/custom_widgets/waiting_card.dart';

class CompanyApplicantWaitingScreen extends StatelessWidget {
  const CompanyApplicantWaitingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView.builder(
        padding: const EdgeInsets.all(20.0),
        itemCount: 5,
        itemBuilder: (context, index) {
          return WaitingCard(
            screen: 'waiting',
            image: 'assets/images/binar.jpg',
            title: 'Binar Talib Younis',
            company: 'Mobile Application Developer',
            date: '2022-01-22',
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) => UserProfileBottomSheet(type: 'company'),
              );
            },
          );
        },
      ),
    );
  }
}

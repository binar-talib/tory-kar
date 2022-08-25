import 'package:flutter/material.dart';
import 'package:tory_kar/custom_widgets/waiting_card.dart';

class CompanyApplicantAcceptedScreen extends StatelessWidget {
  const CompanyApplicantAcceptedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView.builder(
        padding: const EdgeInsets.all(20.0),
        itemCount: 8,
        itemBuilder: (context, index) {
          return WaitingCard(
            screen: 'accepted',
            image: 'assets/images/binar.jpg',
            title: 'Binar Talib Younis',
            company: 'Mobile App Developer',
            date: '2022-03-10',
          );
        },
      ),
    );
  }
}

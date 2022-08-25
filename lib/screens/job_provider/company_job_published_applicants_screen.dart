import 'package:flutter/material.dart';
import 'package:tory_kar/custom_widgets/waiting_card.dart';

class CompanyJobPublishedApplicantsScreen extends StatelessWidget {
  const CompanyJobPublishedApplicantsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView.builder(
          padding: const EdgeInsets.all(20.0),
          itemCount: 6,
          itemBuilder: (context, index) {
            return const WaitingCard(
              screen: 'published',
              title: 'Binar Talib',
              date: '2022-05-10',
              image: 'assets/images/binar.jpg',
              company: 'Mobile App Developer',
            );
          }),
    );
  }
}

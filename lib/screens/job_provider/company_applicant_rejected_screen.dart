import 'package:flutter/material.dart';
import 'package:tory_kar/custom_widgets/custom_texts.dart';
import 'package:tory_kar/modules/constants.dart';

class CompanyApplicantRejectedScreen extends StatelessWidget {
  const CompanyApplicantRejectedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView.builder(
        padding: const EdgeInsets.all(20.0),
        itemCount: 9,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 20.0),
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            height: 70,
            decoration: kBoxDecoration,
            child: ListTile(
              contentPadding: const EdgeInsets.all(0.0),
              dense: true,
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.asset(
                  'assets/images/binar.jpg',
                  height: 40,
                  width: 40,
                  fit: BoxFit.fitWidth,
                ),
              ),
              title: AutoSizeText15(
                text: 'Binar Talib Younis',
              ),
              subtitle: AutoSizeText10(
                text: 'Mobile Application Developer',
                color: const Color(0xFF2B2D42).withOpacity(0.5),
              ),
              trailing: TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        actionsPadding:
                            const EdgeInsets.only(right: 15.0, bottom: 10.0),
                        title: const Text('Rejection reason'),
                        content: Text(
                          'we rejected you because you were not suitable for this job',
                          textAlign: TextAlign.justify,
                        ),
                        actions: [
                          Container(
                            height: 40.0,
                            decoration: kBoxDecoration.copyWith(
                              color: const Color(0xFF2D7171),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Ok',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  );
                },
                child: const AutoSizeText10(
                  text: 'Show\nReason',
                  color: Color(0xFF2B2D42),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

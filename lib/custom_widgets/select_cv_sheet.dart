import 'package:flutter/material.dart';

class SelectCVSheet extends StatefulWidget {
  const SelectCVSheet({Key? key}) : super(key: key);

  @override
  State<SelectCVSheet> createState() => _SelectCVSheetState();
}

class _SelectCVSheetState extends State<SelectCVSheet> {
  List<String> cvs = ['Oil', 'Software', 'Web', 'Mobile', 'Car'];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF737373),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: Color(0xFFFBFBFB),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
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

            //
          ],
        ),
      ),
    );
  }
}

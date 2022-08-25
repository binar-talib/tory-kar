import 'package:flutter/material.dart';

class BuildOnboardPage extends StatelessWidget {
  const BuildOnboardPage({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);
  final String image;
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        const SizedBox(
          height: 20.0,
        ),
        Image.asset(
          image,
          fit: BoxFit.contain,
          height: screenHeight / 3,
        ),
        const SizedBox(
          height: 20.0,
        ),
        Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Expanded(
          child: Text(
            description,
            style: const TextStyle(
              color: Color(0xBF2B2D42),
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}

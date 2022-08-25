import 'package:flutter/material.dart';

BoxDecoration kBoxDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.15),
      blurRadius: 24.0,
      offset: const Offset(0, 8),
    ),
  ],
);

late double screenWidth;
late double screenHeight;

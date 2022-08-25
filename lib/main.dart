import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tory_kar/screens/choose_language_screen.dart';

import 'modules/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await EasyLocalization.ensureInitialized();
  screenWidth = ui.window.physicalSize.width / ui.window.devicePixelRatio;
  screenHeight = ui.window.physicalSize.height / ui.window.devicePixelRatio;
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ar', 'SA'),
        Locale('fa', 'IR'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        iconTheme: const IconThemeData(
          color: Color(0xFF2B2D42),
        ),
        appBarTheme: const AppBarTheme(
          color: Color(0xffFBFBFB),
          elevation: 0.0,
        ),
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Arial',
              bodyColor: const Color(0xFF2B2D42),
              displayColor: const Color(0xFF2B2D42),
            ),
        scaffoldBackgroundColor: const Color(0xffFBFBFB),
      ),
      home: const ChooseLanguageScreen(),
    );
  }
}

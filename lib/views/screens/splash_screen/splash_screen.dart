// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:quiz_app/config/size_config.dart';
import 'package:quiz_app/utils/colors.dart';
import 'package:quiz_app/views/screens/main_screen/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _createSplash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: SizeConfig.width15(context) + 1,
          right: SizeConfig.width15(context) + 1,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logo.png",
              width: 200,
              height: 200,
            ),
            SizedBox(height: SizeConfig.height10(context)),
            const Text(
              "GLOBUS",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: whiteColor,
              ),
            ),
            SizedBox(height: SizeConfig.height10(context)),
            const Text(
              "THE TRIVIA CONQUEST BOARD GAME COMPANION",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _createSplash() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const MainScreen(),
        ),
        (route) => false,
      );
    });
  }
}

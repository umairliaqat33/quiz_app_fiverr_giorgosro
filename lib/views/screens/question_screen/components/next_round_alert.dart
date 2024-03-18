import 'package:flutter/material.dart';
import 'package:quiz_app/config/size_config.dart';
import 'package:quiz_app/utils/colors.dart';
import 'package:quiz_app/views/screens/main_screen/main_screen.dart';
import 'package:quiz_app/views/widgets/buttons/custom_button.dart';

class NextRoundAlert extends StatelessWidget {
  const NextRoundAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          children: [
            CustomButton(
              title: "Next round",
              textColor: blackColor,
              buttonColor: whiteColor,
              onPressed: () {},
            ),
            SizedBox(height: SizeConfig.height10(context)),
            CustomButton(
              textColor: blackColor,
              buttonColor: whiteColor,
              title: "Go to main screen",
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const MainScreen(),
                  ),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

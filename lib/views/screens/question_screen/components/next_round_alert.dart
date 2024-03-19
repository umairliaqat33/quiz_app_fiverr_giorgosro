import 'package:flutter/material.dart';

import 'package:quiz_app/config/size_config.dart';
import 'package:quiz_app/utils/colors.dart';
import 'package:quiz_app/views/screens/main_screen/main_screen.dart';
import 'package:quiz_app/views/widgets/buttons/custom_button.dart';

class NextRoundAlert extends StatelessWidget {
  const NextRoundAlert({
    super.key,
    required this.nextRoundFunction,
  });
  final Function nextRoundFunction;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.only(
        left: SizeConfig.width10(context),
        right: SizeConfig.width10(context),
        top: SizeConfig.height20(context) * 2,
        bottom: SizeConfig.height20(context) * 2,
      ),
      title: const Text(
        "Round complete",
        style: TextStyle(
          fontSize: 20,
          color: whiteColor,
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            CustomButton(
              title: "Next round",
              textColor: blackColor,
              buttonColor: whiteColor,
              onPressed: () => nextRoundFunction(),
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

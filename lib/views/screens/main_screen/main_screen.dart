import 'package:flutter/material.dart';
import 'package:quiz_app/config/size_config.dart';
import 'package:quiz_app/utils/colors.dart';
import 'package:quiz_app/views/widgets/buttons/custom_button.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            left: SizeConfig.width15(context) + 1,
            right: SizeConfig.width15(context) + 1,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                title: "Start Game",
                buttonColor: whiteColor,
                onPressed: () {},
              ),
              SizedBox(height: SizeConfig.height10(context)),
              CustomButton(
                title: "Settings",
                buttonColor: whiteColor,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

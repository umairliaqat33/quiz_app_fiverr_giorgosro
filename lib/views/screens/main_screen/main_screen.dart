// ignore_for_file: unnecessary_null_comparison, use_build_context_synchronously

import 'package:flutter/material.dart';

import 'package:quiz_app/config/size_config.dart';
import 'package:quiz_app/repository/local_repository.dart';
import 'package:quiz_app/utils/colors.dart';
import 'package:quiz_app/utils/enums.dart';
import 'package:quiz_app/views/screens/question_category_selection_screen/question_category_selection_screen.dart';
import 'package:quiz_app/views/screens/settings_screen/settings_screen.dart';
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
                onPressed: () => startGame(context),
              ),
              SizedBox(height: SizeConfig.height10(context)),
              CustomButton(
                title: "Settings",
                buttonColor: whiteColor,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SettingsScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> startGame(BuildContext context) async {
    QuestionsDifficulty? qd = await LocalRepository.getFromLocalStorage();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => qd == null
            ? const SettingsScreen(
                toCategoryScreen: true,
              )
            : const QuestionCategorySelectionScreen(),
      ),
    );
  }
}

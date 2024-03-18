// ignore_for_file: public_member_api_docs, sort_constructors_first, unrelated_type_equality_checks
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:quiz_app/config/size_config.dart';
import 'package:quiz_app/controller/controller.dart';
import 'package:quiz_app/models/mcq_model/mcq_model.dart';
import 'package:quiz_app/repository/local_repository.dart';
import 'package:quiz_app/utils/colors.dart';
import 'package:quiz_app/utils/enums.dart';
import 'package:quiz_app/views/screens/main_screen/main_screen.dart';
import 'package:quiz_app/views/screens/question_screen/question_screen.dart';
import 'package:quiz_app/views/widgets/buttons/custom_button.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    super.key,
    this.questionCategory,
  });
  final QuestionCategory? questionCategory;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: _loading
            ? const Center(
                child: CircularProgressIndicator(
                  color: whiteColor,
                ),
              )
            : Padding(
                padding: EdgeInsets.only(
                  left: SizeConfig.width15(context) + 1,
                  right: SizeConfig.width15(context) + 1,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      title: QuestionsDifficulty.easy.name,
                      buttonColor: whiteColor,
                      onPressed: () => selectDifficulty(
                        QuestionsDifficulty.easy,
                        context,
                      ),
                    ),
                    SizedBox(height: SizeConfig.height10(context)),
                    CustomButton(
                      title: QuestionsDifficulty.medium.name,
                      buttonColor: whiteColor,
                      onPressed: () => selectDifficulty(
                        QuestionsDifficulty.medium,
                        context,
                      ),
                    ),
                    SizedBox(height: SizeConfig.height10(context)),
                    CustomButton(
                      title: QuestionsDifficulty.difficult.name,
                      buttonColor: whiteColor,
                      onPressed: () => selectDifficulty(
                        QuestionsDifficulty.difficult,
                        context,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Future<void> selectDifficulty(
    QuestionsDifficulty difficultyLevel,
    BuildContext context,
  ) async {
    setState(() {
      _loading = true;
    });
    if (widget.questionCategory != null) {
      final controller = Controller();
      List<MCQModel> mcqList;
      if (widget.questionCategory == QuestionCategory.geography ||
          widget.questionCategory == QuestionCategory.history ||
          widget.questionCategory == QuestionCategory.sports) {
        mcqList = await controller.getSingleMCQTypeList(
          questionCategory: widget.questionCategory!,
          difficultyLevel: difficultyLevel,
        );
      } else {
        mcqList = await controller.getMultipleMCQTypeQuestions(
          questionCategory: widget.questionCategory!,
          difficultyLevel: difficultyLevel,
        );
      }
      difficultyLevel = _getDifficultyLevel();
      log(difficultyLevel.name);
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => QuestionScreen(
            mcqList: mcqList,
            questionCategory: widget.questionCategory!,
          ),
        ),
        (route) => false,
      );
    } else {
      difficultyLevel = _getDifficultyLevel();
      log(difficultyLevel.name);
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const MainScreen(),
        ),
        (route) => false,
      );
    }
    setState(() {
      _loading = true;
    });
  }

  QuestionsDifficulty _getDifficultyLevel() {
    Future<String?> value = LocalRepository.getFromLocalStorage();
    if (value == QuestionsDifficulty.easy.name) {
      return QuestionsDifficulty.easy;
    } else if (value == QuestionsDifficulty.medium.name) {
      return QuestionsDifficulty.medium;
    } else {
      return QuestionsDifficulty.difficult;
    }
  }
}

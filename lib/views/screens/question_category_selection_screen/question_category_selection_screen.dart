// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:quiz_app/config/size_config.dart';
import 'package:quiz_app/controller/controller.dart';
import 'package:quiz_app/models/mcq_model/mcq_model.dart';
import 'package:quiz_app/repository/local_repository.dart';
import 'package:quiz_app/utils/colors.dart';
import 'package:quiz_app/utils/enums.dart';
import 'package:quiz_app/views/screens/question_screen/question_screen.dart';
import 'package:quiz_app/views/widgets/buttons/custom_button.dart';

class QuestionCategorySelectionScreen extends StatefulWidget {
  const QuestionCategorySelectionScreen({super.key});

  @override
  State<QuestionCategorySelectionScreen> createState() =>
      _QuestionCategorySelectionScreenState();
}

class _QuestionCategorySelectionScreenState
    extends State<QuestionCategorySelectionScreen> {
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
                      title: QuestionCategory.arts.name.toUpperCase(),
                      buttonColor: purpleColor,
                      textColor: whiteColor,
                      onPressed: () => selectCategory(
                        QuestionCategory.arts,
                        context,
                      ),
                    ),
                    SizedBox(height: SizeConfig.height10(context)),
                    CustomButton(
                      title: QuestionCategory.geography.name.toUpperCase(),
                      buttonColor: blueColor,
                      textColor: whiteColor,
                      onPressed: () => selectCategory(
                        QuestionCategory.geography,
                        context,
                      ),
                    ),
                    SizedBox(height: SizeConfig.height10(context)),
                    CustomButton(
                      title: QuestionCategory.history.name.toUpperCase(),
                      buttonColor: beigeColor,
                      onPressed: () => selectCategory(
                        QuestionCategory.history,
                        context,
                      ),
                    ),
                    SizedBox(height: SizeConfig.height10(context)),
                    CustomButton(
                      title: QuestionCategory.nature.name.toUpperCase(),
                      buttonColor: greenColor,
                      onPressed: () => selectCategory(
                        QuestionCategory.nature,
                        context,
                      ),
                    ),
                    SizedBox(height: SizeConfig.height10(context)),
                    CustomButton(
                      title: QuestionCategory.science.name.toUpperCase(),
                      buttonColor: yellowColor,
                      onPressed: () => selectCategory(
                        QuestionCategory.science,
                        context,
                      ),
                    ),
                    SizedBox(height: SizeConfig.height10(context)),
                    CustomButton(
                      title: QuestionCategory.sports.name.toUpperCase(),
                      buttonColor: redColor,
                      textColor: whiteColor,
                      onPressed: () => selectCategory(
                        QuestionCategory.sports,
                        context,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Future<void> selectCategory(
    QuestionCategory questionCategory,
    BuildContext context,
  ) async {
    setState(() {
      _loading = true;
    });
    final controller = Controller();
    List<MCQModel> mcqList;
    QuestionsDifficulty difficultyLevel =
        (await LocalRepository.getFromLocalStorage())!;
    if (questionCategory == QuestionCategory.geography ||
        questionCategory == QuestionCategory.history ||
        questionCategory == QuestionCategory.sports) {
      mcqList = await controller.getSingleMCQTypeList(
        questionCategory: questionCategory,
        difficultyLevel: difficultyLevel,
      );
    } else {
      mcqList = await controller.getMultipleMCQTypeQuestions(
        questionCategory: questionCategory,
        difficultyLevel: difficultyLevel,
      );
    }
    setState(() {
      _loading = false;
    });
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => QuestionScreen(
          mcqList: mcqList,
          questionCategory: questionCategory,
        ),
      ),
      (route) => false,
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quiz_app/config/size_config.dart';
import 'package:quiz_app/models/mcq_model/mcq_model.dart';
import 'package:quiz_app/utils/colors.dart';
import 'package:quiz_app/utils/enums.dart';
import 'package:quiz_app/views/screens/main_screen/main_screen.dart';
import 'package:quiz_app/views/screens/question_screen/components/next_round_alert.dart';
import 'package:quiz_app/views/screens/settings_screen/settings_screen.dart';
import 'package:quiz_app/views/widgets/buttons/custom_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    super.key,
    required this.mcqList,
    required this.questionCategory,
  });
  final List<MCQModel> mcqList;
  final QuestionCategory questionCategory;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int _index = 0;
  bool _revealed = false;
  List<Text> optionList = [];
  @override
  void initState() {
    if (widget.mcqList.isNotEmpty) {
      optionList = [
        Text(
          widget.mcqList[_index].incorrectOptions1,
          textAlign: TextAlign.start,
          style: const TextStyle(
            color: whiteColor,
            fontSize: 17,
          ),
        ),
        Text(
          widget.mcqList[_index].incorrectOptions2,
          textAlign: TextAlign.start,
          style: const TextStyle(
            color: whiteColor,
            fontSize: 17,
          ),
        ),
        Text(
          widget.mcqList[_index].incorrectOptions3,
          textAlign: TextAlign.start,
          style: const TextStyle(
            color: whiteColor,
            fontSize: 17,
          ),
        ),
        Text(
          widget.mcqList[_index].answer,
          textAlign: TextAlign.start,
          style: const TextStyle(
            color: whiteColor,
            fontSize: 17,
          ),
        ),
      ];
      optionList.shuffle();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 10,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const MainScreen(),
                  ),
                  (route) => false,
                );
              },
              icon: const Icon(
                Icons.home_filled,
                color: whiteColor,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => SettingsScreen(
                        questionCategory: widget.questionCategory,
                      ),
                    ),
                    (route) => false,
                  );
                },
                icon: const Icon(
                  Icons.settings,
                  color: whiteColor,
                ),
              ),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.only(
              left: SizeConfig.width15(context) + 1,
              right: SizeConfig.width15(context) + 1,
            ),
            child: widget.mcqList.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Someting went wrong please try again",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: whiteColor,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: SizeConfig.height10(context)),
                      CustomButton(
                        title: "Go to main screen",
                        buttonColor: whiteColor,
                        textColor: blackColor,
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
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.mcqList[_index].question,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          color: whiteColor,
                          fontSize: 20,
                        ),
                      ),
                      ListTile(
                        leading: const Text(
                          "(a)",
                          style: TextStyle(
                            color: greenColor,
                            fontSize: 17,
                          ),
                        ),
                        title: optionList[0],
                      ),
                      ListTile(
                        leading: const Text(
                          "(b)",
                          style: TextStyle(
                            color: greenColor,
                            fontSize: 17,
                          ),
                        ),
                        title: optionList[1],
                      ),
                      ListTile(
                        leading: const Text(
                          "(c)",
                          style: TextStyle(
                            color: greenColor,
                            fontSize: 17,
                          ),
                        ),
                        title: optionList[2],
                      ),
                      ListTile(
                        leading: const Text(
                          "(d)",
                          style: TextStyle(
                            color: greenColor,
                            fontSize: 17,
                          ),
                        ),
                        title: optionList[3],
                      ),
                      Visibility(
                        visible: _revealed,
                        child: Text(
                          widget.mcqList[_index].answer,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            color: whiteColor,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.height10(context),
                      ),
                      CustomButton(
                        textColor: blackColor,
                        buttonColor: whiteColor,
                        title: "Reveal answer",
                        onPressed: () => _revealAnswer(),
                      ),
                    ],
                  ),
          )),
    );
  }

  void _revealAnswer() {
    setState(() {
      _revealed = true;
    });

    Future.delayed(
      const Duration(
        seconds: 10,
      ),
      () {
        log("After 10 seconds");
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const NextRoundAlert();
          },
        );
      },
    );
  }
}

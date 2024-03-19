import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:quiz_app/config/size_config.dart';
import 'package:quiz_app/models/mcq_model/mcq_model.dart';
import 'package:quiz_app/models/question_model/question_model.dart';
import 'package:quiz_app/services/data_parcer_service.dart';
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
  int _mcqIndex = 0;
  int _questionIndex = 0;
  int _roundNumber = 1;
  bool _mcqAnswerReveal = false;
  bool _questionAnswerReveal = false;
  List<QuestionModel> _questionsList = [];
  List<Text> _optionList = [];
  late Timer _timer;
  int _secondsElapsed = 0;
  @override
  void initState() {
    if (widget.mcqList.isNotEmpty) {
      _optionList = [
        Text(
          widget.mcqList[_mcqIndex].incorrectOptions1,
          textAlign: TextAlign.start,
          style: const TextStyle(
            color: whiteColor,
            fontSize: 17,
          ),
        ),
        Text(
          widget.mcqList[_mcqIndex].incorrectOptions2,
          textAlign: TextAlign.start,
          style: const TextStyle(
            color: whiteColor,
            fontSize: 17,
          ),
        ),
        Text(
          widget.mcqList[_mcqIndex].incorrectOptions3,
          textAlign: TextAlign.start,
          style: const TextStyle(
            color: whiteColor,
            fontSize: 17,
          ),
        ),
        Text(
          widget.mcqList[_mcqIndex].answer,
          textAlign: TextAlign.start,
          style: const TextStyle(
            color: whiteColor,
            fontSize: 17,
          ),
        ),
      ];
      _getQuestionsList(widget.questionCategory);
      _optionList.shuffle();
      _questionsList.shuffle();
    }

    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
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
                : _roundNumber % 2 == 0 && _mcqIndex <= widget.mcqList.length
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            _questionsList[_questionIndex].question,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              color: whiteColor,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: SizeConfig.height10(context)),
                          Visibility(
                            visible: _questionAnswerReveal,
                            child: Text(
                              _questionsList[_questionIndex].answer,
                              style: const TextStyle(
                                color: whiteColor,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(height: SizeConfig.height10(context)),
                          CustomButton(
                            textColor: blackColor,
                            buttonColor: whiteColor,
                            title: "Reveal answer",
                            onPressed: () => _revealAnswer(),
                          ),
                          Visibility(
                            visible: _secondsElapsed != 0,
                            child: Text(
                              "($_secondsElapsed)",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: whiteColor,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.mcqList[_mcqIndex].question,
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
                            title: _optionList[0],
                          ),
                          ListTile(
                            leading: const Text(
                              "(b)",
                              style: TextStyle(
                                color: greenColor,
                                fontSize: 17,
                              ),
                            ),
                            title: _optionList[1],
                          ),
                          ListTile(
                            leading: const Text(
                              "(c)",
                              style: TextStyle(
                                color: greenColor,
                                fontSize: 17,
                              ),
                            ),
                            title: _optionList[2],
                          ),
                          ListTile(
                            leading: const Text(
                              "(d)",
                              style: TextStyle(
                                color: greenColor,
                                fontSize: 17,
                              ),
                            ),
                            title: _optionList[3],
                          ),
                          Visibility(
                            visible: _mcqAnswerReveal,
                            child: Text(
                              widget.mcqList[_mcqIndex].answer,
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
                          Visibility(
                            visible: _secondsElapsed != 0,
                            child: Text(
                              "($_secondsElapsed)",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: whiteColor,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
          )),
    );
  }

  void _revealAnswer() {
    if (_roundNumber % 2 != 0) {
      _mcqAnswerReveal = true;
      _questionAnswerReveal = false;
    } else {
      _questionAnswerReveal = true;
      _mcqAnswerReveal = false;
    }
    _startAndCancelTimer();
    setState(() {});

    Future.delayed(
      const Duration(
        seconds: 10,
      ),
      () {
        log("After 10 seconds");
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return NextRoundAlert(
              nextRoundFunction: () => _nextRound(),
            );
          },
        );
      },
    );
  }

  void _nextRound() {
    if (_roundNumber % 2 == 0 && widget.mcqList.length >= _mcqIndex) {
      _mcqIndex++;
      _optionList.clear();
      if (widget.mcqList.isNotEmpty) {
        _optionList = [
          Text(
            widget.mcqList[_mcqIndex].incorrectOptions1,
            textAlign: TextAlign.start,
            style: const TextStyle(
              color: whiteColor,
              fontSize: 17,
            ),
          ),
          Text(
            widget.mcqList[_mcqIndex].incorrectOptions2,
            textAlign: TextAlign.start,
            style: const TextStyle(
              color: whiteColor,
              fontSize: 17,
            ),
          ),
          Text(
            widget.mcqList[_mcqIndex].incorrectOptions3,
            textAlign: TextAlign.start,
            style: const TextStyle(
              color: whiteColor,
              fontSize: 17,
            ),
          ),
          Text(
            widget.mcqList[_mcqIndex].answer,
            textAlign: TextAlign.start,
            style: const TextStyle(
              color: whiteColor,
              fontSize: 17,
            ),
          ),
        ];
        _optionList.shuffle();
      }
    } else {
      _questionsList.shuffle();
      _questionIndex++;
    }
    _roundNumber++;
    _secondsElapsed = 0;
    setState(() {});
    Navigator.of(context).pop();
  }

  void _getQuestionsList(QuestionCategory questionCategory) async {
    DataParcerServices dataParcerServices = DataParcerServices();
    _questionsList = await dataParcerServices.parseTextFile(
        questionCategory: widget.questionCategory);
    _questionsList.shuffle();
  }

  void _startAndCancelTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _secondsElapsed++;
        if (_secondsElapsed == 10) {
          // Stop the timer after 10 seconds
          timer.cancel();
        }
      });
    });
  }
}

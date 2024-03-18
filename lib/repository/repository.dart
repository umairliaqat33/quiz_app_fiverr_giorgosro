import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:quiz_app/models/mcq_model/mcq_model.dart';
import 'package:quiz_app/utils/constants.dart';
import 'package:quiz_app/utils/enums.dart';

class Repository {
  Future getURLData(String url) async {
    Response response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;
      log(response.statusCode.toString());

      return jsonDecode(data);
    } else {
      log(response.statusCode.toString());
    }
  }

  Future<List<MCQModel>> getSingleMultipleTypeQuestion(
    QuestionCategory questionCategory,
    QuestionsDifficulty difficultyLevel,
  ) async {
    int category = 0;
    List<MCQModel> mcqList = [];
    try {
      if (questionCategory == QuestionCategory.geography ||
          questionCategory == QuestionCategory.history ||
          questionCategory == QuestionCategory.sports) {
        category = getSingleQuestionCategory(questionCategory);
      }

      var responseBody = await get(Uri.parse(
          '$apiURL?amount=48&category=$category&difficulty=${difficultyLevel.name}&type=multiple'));
      Map<String, dynamic> result = json.decode(responseBody.body);
      List<dynamic> list = result['results'];
      mcqList = seperateList(list);
    } catch (e) {
      log(e.toString());
    }
    return mcqList;
  }

  List<MCQModel> seperateList(List list) {
    List<MCQModel> mList = [];
    for (int i = 0; i < list.length; i++) {
      mList.add(
        MCQModel(
          question: list[i]['question'],
          answer: list[i]['correct_answer'],
          incorrectOptions1: list[i]['incorrect_answers'][0],
          incorrectOptions2: list[i]['incorrect_answers'][1],
          incorrectOptions3: list[i]['incorrect_answers'][2],
        ),
      );
    }
    return mList;
  }

  void printList(List<MCQModel> mList) {
    for (int i = 0; i < mList.length; i++) {
      log(mList[i].question);
      log(mList[i].answer);
    }
  }

  List<MCQModel> getList(String responseBody) {
    final response = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return response.map<MCQModel>((json) => MCQModel.fromJson(json)).toList();
  }

  Future<List<MCQModel>> getMultipleTypeQuestions(
    QuestionCategory questionCategory,
    QuestionsDifficulty difficultyLevel,
  ) async {
    List<int> category = [];
    List<List<MCQModel>> responseList = [];
    List<MCQModel> mcqList = [];
    if (questionCategory == QuestionCategory.science ||
        questionCategory == QuestionCategory.nature ||
        questionCategory == QuestionCategory.arts) {
      category = getMultipleQuestionCategory(questionCategory);
    }
    for (int i = 0; i < category.length; i++) {
      var responseBody = await get(Uri.parse(
          '$apiURL?amount=48&category=${category[i]}&difficulty=${difficultyLevel.name}&type=multiple'));
      Map<String, dynamic> result = json.decode(responseBody.body);
      if (result['results'] != null) {
        List<dynamic> list = result['results'];
        responseList.add(seperateList(list));
      }
    }
    for (int i = 0; i < responseList.length; i++) {
      mcqList.addAll(responseList[i]);
    }
    mcqList.shuffle();
    return mcqList;
  }

  int getSingleQuestionCategory(QuestionCategory questionCategory) {
    if (questionCategory == QuestionCategory.geography) {
      return 22;
    } else if (questionCategory == QuestionCategory.history) {
      return 23;
    } else if (questionCategory == QuestionCategory.sports) {
      return 21;
    } else {
      return 0;
    }
  }

  List<int> getMultipleQuestionCategory(QuestionCategory questionCategory) {
    if (questionCategory == QuestionCategory.science) {
      return [18, 19, 30, 17];
    } else if (questionCategory == QuestionCategory.nature) {
      return [17, 27];
    } else if (questionCategory == QuestionCategory.arts) {
      return [25, 10, 11, 12, 14];
    } else {
      return [];
    }
  }
}

import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:quiz_app/utils/enums.dart';

class LocalRepository {
  static void saveToLocalStorage(
    QuestionsDifficulty questionsDifficulty,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
      'difficultyType',
      questionsDifficulty.name,
    );
  }

  static Future<QuestionsDifficulty?> getFromLocalStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String value = prefs.getString('difficultyType').toString();
    log(value);
    if (value == QuestionsDifficulty.easy.name) {
      return QuestionsDifficulty.easy;
    } else if (value == QuestionsDifficulty.medium.name) {
      return QuestionsDifficulty.medium;
    } else if (value == QuestionsDifficulty.hard.name) {
      return QuestionsDifficulty.hard;
    } else {
      return null;
    }
  }
}

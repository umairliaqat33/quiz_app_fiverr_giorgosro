import 'package:quiz_app/utils/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  static Future<String?> getFromLocalStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('difficultyType');
  }
}

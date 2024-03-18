import 'package:quiz_app/models/mcq_model/mcq_model.dart';
import 'package:quiz_app/repository/repository.dart';
import 'package:quiz_app/utils/enums.dart';

class Controller {
  final repository = Repository();
  Future<List<MCQModel>> getSingleMCQTypeList({
    required QuestionCategory questionCategory,
    required QuestionsDifficulty difficultyLevel,
  }) async {
    return repository.getSingleMultipleTypeQuestion(
        questionCategory, difficultyLevel);
  }

  Future<List<MCQModel>> getMultipleMCQTypeQuestions({
    required QuestionCategory questionCategory,
    required QuestionsDifficulty difficultyLevel,
  }) async {
    return repository.getMultipleTypeQuestions(
      questionCategory,
      difficultyLevel,
    );
  }
}

import 'package:flutter/services.dart';

import 'package:quiz_app/models/question_model/question_model.dart';
import 'package:quiz_app/utils/enums.dart';

class DataParcerServices {
  Future<List<QuestionModel>> parseTextFile({
    required QuestionCategory questionCategory,
  }) async {
    // Load the text file as a string
    String text = await rootBundle
        .loadString('assets/questions/${questionCategory.name}.txt');

    // Split the text into lines
    List<String> lines = text.split('\n');

    // Parse each line to create QuestionModel objects
    List<QuestionModel> questionAnswers = [];
    String currentQuestion = "";
    String currentAnswer = "";

    for (String line in lines) {
      // If the line is not empty, it's either a question or an answer
      if (line.isNotEmpty) {
        // If currentQuestion is empty, it means this line is a question
        if (currentQuestion.isEmpty) {
          currentQuestion = line;
        } else {
          // If currentQuestion is not empty, it means this line is an answer
          currentAnswer = line;
          // Add the question-answer pair to the list
          questionAnswers.add(QuestionModel(
            question: currentQuestion.trim(),
            answer: currentAnswer.trim(),
          ));
          // Reset currentQuestion and currentAnswer for the next pair
          currentQuestion = "";
          currentAnswer = "";
        }
      }
    }

    return questionAnswers;
  }
}

// Future<List<QuestionModel>> parseDocFile({
//   required QuestionCategory questionCategory,
// }) async {
//   String docText = await rootBundle
//       .loadString('assets/questions/${questionCategory.name}.docx');

//   List<String> lines = docText.split('\n');

//   List<QuestionModel> questionAnswers = [];
//   for (int i = 0; i < lines.length; i = i + 2) {
//     questionAnswers.add(
//       QuestionModel(
//         question: lines[i],
//         answer: lines[i + 1],
//       ),
//     );
//   }

//   return questionAnswers;
// }

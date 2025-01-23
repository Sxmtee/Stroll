import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskone/Features/Home/models/question_model.dart';

final questionStateProvider =
    StateNotifierProvider<QuestionNotifier, QuestionState>((ref) {
  return QuestionNotifier();
});

class QuestionNotifier extends StateNotifier<QuestionState> {
  QuestionNotifier()
      : super(
          QuestionState(
            question: "What is your favorite time of day?",
            answers: [
              Answer(id: "A", text: "The peace in the early mornings"),
              Answer(id: "B", text: "The magical golden hours"),
              Answer(id: "C", text: "Wind-down time after dinners"),
              Answer(id: "D", text: "The serenity past midnight"),
            ],
          ),
        );

  Future<void> selectAnswer(String answerId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_answer', answerId);
    state = QuestionState(
      question: state.question,
      answers: state.answers,
      selectedAnswer: answerId,
    );
  }
}

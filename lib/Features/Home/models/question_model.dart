class QuestionState {
  final String question;
  final List<Answer> answers;
  final String? selectedAnswer;

  QuestionState({
    required this.question,
    required this.answers,
    this.selectedAnswer,
  });
}

class Answer {
  final String id;
  final String text;
  Answer({required this.id, required this.text});
}

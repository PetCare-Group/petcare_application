class Question {
  final int id;
  final String question;
  final String answer;

  Question({
    required this.id,
    required this.question,
    required this.answer,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['faqid'] as int,
      question: json['question'] as String,
      answer: json['answer'] as String,
    );
  }
}
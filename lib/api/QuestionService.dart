import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:petcare_application/api/Question.dart';

class QuestionService {
  static Future<List<Question>> fetchQuestions() async {
    final response =
    await http.get(Uri.parse('https://petcarebackend.azurewebsites.net/api/v1/faqs'));

    if (response.statusCode == 200) {
      List<Question> questions = (json.decode(response.body) as List)
          .map((data) => Question.fromJson(data))
          .toList();
      return questions;
    } else {
      throw Exception('Failed to load questions');
    }
  }
}
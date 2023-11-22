import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:petcare_application/api/Review.dart';

class ReviewService {
  static Future<List<Review>> fetchReviewsByService(int serviceId) async {
    final response = await http.get(Uri.parse('https://petcarebackend.azurewebsites.net/api/v1/reviews/byService/$serviceId'));

    if (response.statusCode == 200) {
      List<dynamic> reviewsJson = json.decode(response.body);
      return reviewsJson.map((json) => Review.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load reviews');
    }
  }
  static Future<void> createReview({required int serviceId, required String description, required int stars, int? userId}) async {
    final response = await http.post(
      Uri.parse('https://petcarebackend.azurewebsites.net/api/v1/reviews'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'Description': description,
        'Stars': stars,
        'UserId': userId,
        'ServiceId': serviceId,
      }),
    );

    if (response.statusCode < 200 || response.statusCode > 299) {
      throw Exception('Failed to create review. Status code: ${response.statusCode}');
    }
  }

}

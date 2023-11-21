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
}

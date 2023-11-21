import 'package:petcare_application/api/User.dart';

class Review {
  final int reviewId;
  final String description;
  final int stars;
  final User? user;

  Review({
    required this.reviewId,
    required this.description,
    required this.stars,
    this.user,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      reviewId: json['reviewId'],
      description: json['description'],
      stars: json['stars'],
      user: json['user'] != null ? User.objJson(json['user']) : null,
    );
  }
}

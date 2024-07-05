// ignore_for_file: public_member_api_docs, sort_constructors_first
class Review {
  String photo_url;
  String name;
  String review;
  double rating;
  Review({
    required this.photo_url,
    required this.name,
    required this.review,
    required this.rating,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
        photo_url: json['photo_url'],
        name: json['name'],
        review: json['review'],
        rating: json['rating']);
  }
}

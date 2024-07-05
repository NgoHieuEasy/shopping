// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:market_ecommerce/core/model/ColorWay.dart';
import 'package:market_ecommerce/core/model/ProductSize.dart';
import 'package:market_ecommerce/core/model/Review.dart';

class Product {
  List<String> image;
  String name;
  int price;
  double rating;
  String description;
  String store_name;
  List<ColorWay> colors;
  List<ProductSize> sizes;
  List<Review> reviews;
  Product({
    required this.image,
    required this.name,
    required this.price,
    required this.rating,
    required this.description,
    required this.store_name,
    required this.colors,
    required this.sizes,
    required this.reviews,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        image: List<String>.from(json['image'].map((x) => x)),
        name: json['name'],
        price: json['price'],
        rating: json['rating'],
        description: json['description'],
        store_name: json['store_name'],
        colors: (json['colors'] as List)
            .map((data) => ColorWay.fromJson(data))
            .toList(),
        sizes: (json['sizes'] as List)
            .map((data) => ProductSize.fromJson(data))
            .toList(),
        reviews: (json['reviews'] as List)
            .map((data) => Review.fromJson(data))
            .toList());
  }
}

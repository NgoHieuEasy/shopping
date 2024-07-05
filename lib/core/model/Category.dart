import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Category {
  int id;
  String iconUrl;
  String name;
  bool featured;
  Category({
    required this.featured,
    required this.iconUrl,
    required this.name,
    required this.id,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      featured: json['featured'],
      iconUrl: json['icon_url'],
      name: json['name'],
    );
  }
}

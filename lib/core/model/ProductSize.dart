// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductSize {
  String name;
  String size;
  ProductSize({
    required this.name,
    required this.size,
  });

  factory ProductSize.fromJson(Map<String, dynamic> json) {
    return ProductSize(name: json['name'], size: json['size']);
  }
}

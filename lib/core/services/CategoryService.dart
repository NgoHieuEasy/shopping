import 'package:market_ecommerce/core/model/Category.dart';

class CategoryService {
  static List<Category> categoryData =
      categoryRawData.map((data) => Category.fromJson(data)).toList();
}

var categoryRawData = [
  {
    'id': 0,
    'featured': true,
    'icon_url': 'assets/icons/Discount.svg',
    'name': 'best offer',
  },
  {
    'id': 1,
    'featured': false,
    'icon_url': 'assets/icons/High-heels.svg',
    'name': 'woman shoes',
  },
  {
    'id': 2,
    'featured': false,
    'icon_url': 'assets/icons/Woman-dress.svg',
    'name': 'woman dress',
  },
  {
    'id': 3,
    'featured': false,
    'icon_url': 'assets/icons/Man-Clothes.svg',
    'name': 'man clothes',
  },
  {
    'id': 4,
    'featured': false,
    'icon_url': 'assets/icons/Man-Pants.svg',
    'name': 'man pants',
  },
  {
    'id': 5,
    'featured': false,
    'icon_url': 'assets/icons/Man-Shoes.svg',
    'name': 'man shoes',
  },
];

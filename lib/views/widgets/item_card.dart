import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:market_ecommerce/constant/app_color.dart';
import 'package:market_ecommerce/constant/app_relative_path.dart';
import 'package:market_ecommerce/constant/app_utils.dart';
import 'package:market_ecommerce/core/model/Product.dart';
import 'package:market_ecommerce/views/screens/product_detail.dart';
import 'package:market_ecommerce/views/widgets/bag_item.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  const ItemCard({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductDetail(data: product)));
      },
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 110,
                width: double.infinity,
                child: Image.asset(
                  product.image[0],
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 13, fontFamily: "Poppins"),
                    ),
                    Container(
                      child: Text(
                        "${AppUtils.formatCurrency(product.price)}",
                        style: TextStyle(
                            color: AppColor.primary,
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 2),
                        child: Text(
                          product.store_name,
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black.withOpacity(0.3),
                              fontFamily: "Poppins"),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ))
                  ],
                ),
              )
            ],
          ),
          BagItem(
            rating: product.rating,
          )
        ],
      ),
    );
  }
}

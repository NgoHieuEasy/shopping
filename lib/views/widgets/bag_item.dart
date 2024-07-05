import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:market_ecommerce/constant/app_color.dart';
import 'package:market_ecommerce/constant/app_relative_path.dart';

class BagItem extends StatelessWidget {
  final double rating;

  const BagItem({required this.rating, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 25,
      decoration: BoxDecoration(
          color: AppColor.primary, borderRadius: BorderRadius.circular(10)),
      child: Row(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
          child: SvgPicture.asset(
            AppRelativePath.starActiveIcon,
            width: 20,
            height: 15,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          "${rating}",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        )
      ]),
    );
  }
}

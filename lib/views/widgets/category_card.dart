import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:market_ecommerce/core/model/Category.dart';

class CategoryCard extends StatelessWidget {
  final Category data;
  int? catIdx;
  final VoidCallback onTap;
  CategoryCard(
      {required this.onTap, required this.data, this.catIdx, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white.withOpacity(data.id == catIdx ? 0.15 : 0.015)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: SvgPicture.asset(data.iconUrl),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Text(
                data.name,
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}

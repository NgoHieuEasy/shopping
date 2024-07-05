import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:market_ecommerce/constant/app_color.dart';
import 'package:market_ecommerce/views/widgets/custom_icon_button_widget.dart';
import 'package:market_ecommerce/constant/app_relative_path.dart';

class DummySearchWidget1 extends StatelessWidget {
  final VoidCallback onTap;

  const DummySearchWidget1({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Row(children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: SvgPicture.asset(
              AppRelativePath.searchIcon,
              width: 18,
              height: 18,
              color: Colors.black,
            ),
          ),
          Text('Find a product...', style: TextStyle(color: Colors.grey))
        ]),
      ),
    );
  }
}

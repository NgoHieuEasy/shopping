import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:market_ecommerce/constant/app_color.dart';
import 'package:market_ecommerce/constant/app_relative_path.dart';

class CustomIconButtonWidget extends StatelessWidget {
  final int value;
  final Widget icon;
  final VoidCallback onTap;

  const CustomIconButtonWidget(
      {required this.value,
      required this.icon,
      required this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(15)),
              child: Container(
                margin: const EdgeInsets.all(14),
                child: icon,
              )),
          (value != 0)
              ? Container(
                  width: 16,
                  height: 16,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.amber),
                  child: Text(
                    "$value",
                    style: TextStyle(
                        color: AppColor.secondary,
                        fontSize: 10,
                        fontWeight: FontWeight.w600),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}

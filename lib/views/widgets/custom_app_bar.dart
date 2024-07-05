import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:market_ecommerce/constant/app_color.dart';
import 'package:market_ecommerce/constant/app_relative_path.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.name,
    required this.onTapLead,
  });

  final String name;
  final VoidCallback onTapLead;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColor.border.withOpacity(0.5)),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: SvgPicture.asset(
                  AppRelativePath.arrowLeftIcon,
                ),
              )),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 2 + 20,
          height: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.border.withOpacity(0.5)),
          child: Text(
            "${name}",
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ),
        Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColor.border.withOpacity(0.5)),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: SvgPicture.asset(AppRelativePath.bookMarkIcon),
            )),
      ]),
    );
  }
}

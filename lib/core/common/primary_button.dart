import 'package:flutter/material.dart';
import 'package:market_ecommerce/constant/app_color.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Color? colorButton;
  final VoidCallback? onPressed;

  const PrimaryButton(
      {required this.text,
      this.colorButton,
      required this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(16),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 0,
            shadowColor: Colors.transparent,
            backgroundColor: colorButton ?? AppColor.primary),
        child: Text(text),
      ),
    );
  }
}

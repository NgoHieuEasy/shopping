import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:market_ecommerce/core/common/primary_button.dart';
import 'package:market_ecommerce/constant/app_color.dart';
import 'package:market_ecommerce/constant/app_relative_path.dart';
import 'package:market_ecommerce/views/screens/login_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 32),
              width: MediaQuery.of(context).size.width,
              child: SvgPicture.asset(AppRelativePath.wlcLogo),
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 32),
                  child: const Text("MartketKy",
                      style: TextStyle(
                          fontFamily: "poppins",
                          color: AppColor.secondary,
                          fontSize: 32,
                          fontWeight: FontWeight.w700)),
                ),
                Text(
                  'Market in your pocket. Find \nyour best outfit here.',
                  style: TextStyle(
                    color: AppColor.secondary.withOpacity(0.7),
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(bottom: 5),
                child: PrimaryButton(
                    text: "Get Started",
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    }))
          ],
        ),
      ),
    );
  }
}

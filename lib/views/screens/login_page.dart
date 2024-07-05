import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:market_ecommerce/constant/app_color.dart';
import 'package:market_ecommerce/constant/app_relative_path.dart';
import 'package:market_ecommerce/core/common/primary_button.dart';
import 'package:market_ecommerce/views/screens/page_switcher.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppRelativePath.leadingIcon)),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: const Text("Sign In",
            style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600)),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        height: 48,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Don't have an account?",
              style:
                  TextStyle(fontSize: 14, color: Colors.grey.withOpacity(0.9)),
            ),
            Text(
              " Sign up",
              style: TextStyle(
                  fontSize: 16,
                  color: AppColor.primary,
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome Back Mate!",
                style: TextStyle(
                    fontSize: 19,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "lorem Ipsum is Lore of the Lorem Ipsum and Lore of the Lorem Ipsum is Lore of",
                  style: TextStyle(
                      fontSize: 16, color: Colors.grey.withOpacity(0.9)),
                ),
              ),

              //section 2
              SizedBox(height: 16),
              TextField(
                autofocus: false,
                decoration: InputDecoration(
                  prefixIcon: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SvgPicture.asset(
                      AppRelativePath.messageIcon,
                      color: AppColor.primary,
                    ),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.border, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.primary, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  fillColor: AppColor.primarySoft,
                  filled: true,
                  hintText: "youremail@gamil.com",
                ),
              ),
              SizedBox(height: 16),
              TextField(
                obscureText: obscure,
                autofocus: false,
                decoration: InputDecoration(
                  prefixIcon: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SvgPicture.asset(
                      AppRelativePath.lockIcon,
                      color: AppColor.primary,
                    ),
                  ),
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        obscure = !obscure;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SvgPicture.asset(
                        obscure
                            ? AppRelativePath.hideIcon
                            : AppRelativePath.leadingIcon,
                        color: AppColor.primary,
                      ),
                    ),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.border, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.primary, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  fillColor: AppColor.primarySoft,
                  filled: true,
                  hintText: "************",
                ),
              ),

              //forgot pass

              Container(
                alignment: Alignment.bottomRight,
                margin: const EdgeInsets.only(top: 15),
                child: Text(
                  "Forgot pass?",
                  style: TextStyle(color: Colors.grey.withOpacity(0.9)),
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(top: 25),
                  child: PrimaryButton(
                      text: "Login",
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PageSwitcher()));
                      }))
            ],
          ),
        ],
      ),
    );
  }
}

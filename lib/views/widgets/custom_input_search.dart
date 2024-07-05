import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:market_ecommerce/constant/app_relative_path.dart';

class CustomSearchInput extends StatefulWidget {
  final Function(String) onValue;
  const CustomSearchInput({required this.onValue, super.key});

  @override
  State<CustomSearchInput> createState() => _CustomSearchInputState();
}

class _CustomSearchInputState extends State<CustomSearchInput> {
  final TextEditingController _controller = TextEditingController();

  void handleSubmitted() {
    print("vo day onchange");
    widget.onValue(_controller.text);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: TextField(
        onSubmitted: (value) => {handleSubmitted()},
        controller: _controller,
        autofocus: false,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: "Find a product...",
          hintStyle:
              TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.6)),
          prefixIcon: GestureDetector(
            onTap: handleSubmitted,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: SvgPicture.asset(
                AppRelativePath.searchIcon,
                color: Colors.white,
              ),
            ),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: Colors.transparent, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: Colors.white)),
          fillColor: Colors.white.withOpacity(0.1),
          filled: true,
        ),
      ),
    );
  }
}

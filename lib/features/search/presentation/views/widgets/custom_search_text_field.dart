import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
      child: TextField(
        style: const TextStyle(fontSize: 20),
        decoration: InputDecoration(
          enabledBorder: customOutlineInputBorder(),
          focusedBorder: customOutlineInputBorder(),
          suffixIcon: const Opacity(
            opacity: .7,
            child: Icon(FontAwesomeIcons.magnifyingGlass),
          ),
          hintText: "Search",
        ),
      ),
    );
  }

  OutlineInputBorder customOutlineInputBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(
          width: 2,
          color: Colors.white.withOpacity(.8),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ));
  }
}

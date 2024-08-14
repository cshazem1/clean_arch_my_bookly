import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.borderRadius,
      required this.text,
      required this.backgroundColor,
      required this.textColor});
  final BorderRadiusGeometry borderRadius;
  final Color backgroundColor;
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 48,
        child: (TextButton(
          style: TextButton.styleFrom(
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(borderRadius: borderRadius)),
          onPressed: () {},
          child: Text(
            text,
            style: Styles.textStyle18
                .copyWith(color: textColor, fontWeight: FontWeight.w900),
          ),
        )),
      ),
    );
  }
}

import 'package:bookly/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CustomButton(
          backgroundColor: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          ),
          text: '19.19\$', textColor: Colors.black,
        ),
        CustomButton(
          textColor: Colors.white,
          backgroundColor: Colors.deepOrange,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
          text: 'Free Preview',
        ),
      ],
    );
  }
}

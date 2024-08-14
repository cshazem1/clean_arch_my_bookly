import 'package:flutter/material.dart';

class CustomBookDetailsAppBar extends StatelessWidget {
  const CustomBookDetailsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.close),
            iconSize: 30,
            tooltip: "Close,",
            style: const ButtonStyle(
              tapTargetSize:
              MaterialTapTargetSize.shrinkWrap, // the '2023' part
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
            iconSize: 30),
      ],
    );
  }
}

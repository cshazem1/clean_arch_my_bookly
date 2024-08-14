import 'package:flutter/material.dart';
import '../../../../../core/utils/assets.dart';
class CustomBookImage extends StatelessWidget {
  const CustomBookImage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6/4,
      child: Container(
        decoration:  const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                AssetsData.testJungleBook,
              ),
              fit: BoxFit.fill),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
    );
  }
}

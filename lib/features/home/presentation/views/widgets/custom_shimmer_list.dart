import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'custom_image_shimmer.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
        height: 200,
        width: 200,
        child: Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.blueGrey,
            period: const Duration(milliseconds: 800),

            child:
            SizedBox(
              height: MediaQuery.of(context).size.height * .3,
              child: ListView.builder(
                itemCount: 15,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child:        CustomImageShimmer()

                  );
                },
              ),
            )





        )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/styles.dart';

class BookRating extends StatelessWidget {
final  num? rating;
 final MainAxisAlignment mainAxisAlignment;
    const BookRating( this.rating, { this.mainAxisAlignment=MainAxisAlignment.start,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(

      mainAxisAlignment:mainAxisAlignment,
      children:  [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Colors.amber,
          size: 14,
        ),
        SizedBox(
          width: 6.3,
        ),
        Text(
          "${rating?.toString()??0}",
          style: Styles.textStyle16,
        ),
        SizedBox(
          width: 5,
        ),
        Opacity(
          opacity: .5,
          child: Text(
            '(445)',
            style: Styles.textStyle14
            ),
        )

      ],
    );
  }
}

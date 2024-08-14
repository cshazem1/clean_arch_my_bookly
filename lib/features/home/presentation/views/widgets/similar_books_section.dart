import 'package:bookly/features/home/presentation/views/widgets/similar_books_details_list_view.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "You Can Also See",
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: const SimilarBooksDetailsListView()),
      ],
    );
  }
}

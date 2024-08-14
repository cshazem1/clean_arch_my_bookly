import 'package:flutter/material.dart';

import '../../../../../core/widgets/book_list_view_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: 10, (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: BookListViewItem(),
        );
      }),
    );
  }
}

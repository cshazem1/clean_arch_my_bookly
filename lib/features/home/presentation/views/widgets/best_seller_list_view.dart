import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/book_list_view_item.dart';

class BestSellerListView extends StatefulWidget {
final  List<BookEntity> books;
  const BestSellerListView(this.books, {
    super.key,
  });




  @override
  State<BestSellerListView> createState() => _BestSellerListViewState();
}

class _BestSellerListViewState extends State<BestSellerListView> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: widget.books.length, (context, index) {
        return  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: BookListViewItem(widget.books[index]),
        );
      }),
    );
  }
}

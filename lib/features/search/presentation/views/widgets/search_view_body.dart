import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/book_list_view_item.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [CustomSearchTextField(),
        SizedBox(height: 10,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
            "Best Seller",
            style: Styles.textStyle18,
          ),
        ),
         SizedBox(
          height: 20,
        ),
      SearchResultListView()
      ],
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return
      Expanded(
        child: ListView.builder(
          itemCount: 10,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),

                child: BookListViewItem(),
              );
            },
           ),
      );
  }
}


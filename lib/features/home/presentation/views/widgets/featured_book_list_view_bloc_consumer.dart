import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/functions/build_snack_bar.dart';
import '../../../domain/entities/book_entity.dart';
import '../../manager/fetch_featured_books_cubit/fetch_featured_books_cubit.dart';
import 'featured_books_list_view.dart';

class FeaturedBookListViewBlocConsumer extends StatefulWidget {
  const FeaturedBookListViewBlocConsumer({
    super.key,
  });

  @override
  State<FeaturedBookListViewBlocConsumer> createState() => _FeaturedBookListViewBlocConsumerState();
}

class _FeaturedBookListViewBlocConsumerState extends State<FeaturedBookListViewBlocConsumer> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchFeaturedBooksCubit, FetchFeaturedBooksState>(
      listener: (context, state) {
        if (state is FetchFeaturedBooksSuccess) {
          setState(() {
            books.addAll(state.books);
          });
        } else if ( state is FetchFeaturedBooksPaginationFailure) {
          showErrorSnackBar(context, state.error.toString());
        }
      },
      builder: (context, state) {
        if (state is FetchFeaturedBooksSuccess || state is FetchFeaturedBooksPaginationLoading||state is FetchFeaturedBooksPaginationFailure) {
          return FeaturedBooksListView(books: books);
        } else if (state is FetchFeaturedBooksFailure) {
          return Center(child: Text(state.error));
        } else if (state is FetchFeaturedBooksPaginationFailure) {
          return Center(child: Text(state.error));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

}


import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/manager/fetch_featured_books_cubit/fetch_featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_book_image.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({super.key, required this.books});
  final List<BookEntity> books;

  @override
  _FeaturedBooksListViewState createState() => _FeaturedBooksListViewState();
}
int nextNumber=1;
class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  final ScrollController _scrollController = ScrollController();
bool loading=false;
  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() async {
      var currentPosition=_scrollController.position.pixels;
      if (currentPosition>= _scrollController.position.maxScrollExtent * 0.7) {
        if(!loading) {
          loading=true;
          await BlocProvider.of<FetchFeaturedBooksCubit>(context)
              .fetchFeatureBooks(pageNumber: nextNumber++);
          loading=false;
        }
        print("Fetch more books"); // Replace with actual fetchBooks call
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: widget.books.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CustomBookImage(
              image: widget.books[index].image??"",
            ),
          );
        },
      ),
    );
  }
}

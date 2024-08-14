import 'package:bookly/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';
import 'book_details_section.dart';
import 'books_action.dart';
import 'custom_book_details_app_bar.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomBookDetailsAppBar(),
                  BookDetailsSection(),
                  SizedBox(
                    height: 37,
                  ),
                  BooksAction(),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                    ),
                  ),
                  SimilarBooksSection(),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}



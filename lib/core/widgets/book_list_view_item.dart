import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/views/widgets/custom_book_image.dart';
import '../utils/app_roter.dart';
import '../utils/assets.dart';
import '../utils/styles.dart';
import '../../features/home/presentation/views/widgets/book_rating.dart';

class BookListViewItem extends StatelessWidget {
 final BookEntity book;
  const BookListViewItem(this.book, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 150,
        child: Row(
          children: [
            CustomBookImage(image: book.image??"",),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child:  Text(
                     book.title??"",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                   Text(
                    book.authorName?.toString()??'',
                    style: Styles.textStyle14,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${book.price}\$',
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                       BookRating(book.rating)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

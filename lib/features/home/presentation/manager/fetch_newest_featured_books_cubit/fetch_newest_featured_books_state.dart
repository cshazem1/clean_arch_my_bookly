part of 'fetch_newest_featured_books_cubit.dart';

@immutable
sealed class FetchNewestFeaturedBooksState {}

final class FetchNewestFeaturedBooksInitial extends FetchNewestFeaturedBooksState {}
final class FetchNewestFeaturedBooksLoading extends FetchNewestFeaturedBooksState {}
final class FetchNewestFeaturedBooksPaginationLoading extends FetchNewestFeaturedBooksState {}
final class FetchNewestFeaturedBooksPaginationFailure extends FetchNewestFeaturedBooksState {
  String error;
  FetchNewestFeaturedBooksPaginationFailure({required this.error});
}

final class FetchNewestFeaturedBooksSuccess extends FetchNewestFeaturedBooksState {
  List<BookEntity>books;
  FetchNewestFeaturedBooksSuccess({required this.books});
}
final class FetchNewestFeaturedBooksFailure extends FetchNewestFeaturedBooksState {
  String error;
  FetchNewestFeaturedBooksFailure({required this.error});
}

part of 'fetch_featured_books_cubit.dart';

@immutable
sealed class FetchFeaturedBooksState {}

final class FetchFeaturedBooksInitial extends FetchFeaturedBooksState {}
final class FetchFeaturedBooksLoading extends FetchFeaturedBooksState {}
final class FetchFeaturedBooksSuccess extends FetchFeaturedBooksState {
  List<BookEntity>books;
  FetchFeaturedBooksSuccess({required this.books});
}
final class FetchFeaturedBooksFailure extends FetchFeaturedBooksState {
  String error;
  FetchFeaturedBooksFailure({required this.error});
}

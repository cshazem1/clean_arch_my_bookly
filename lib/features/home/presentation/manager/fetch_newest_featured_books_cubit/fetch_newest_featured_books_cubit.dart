import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_feature_books_use_case.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/book_entity.dart';

part 'fetch_newest_featured_books_state.dart';

class FetchNewestFeaturedBooksCubit extends Cubit<FetchNewestFeaturedBooksState> {
  final FetchNewestBooksUseCase fetchNewestFeatureBooksUseCase;
  FetchNewestFeaturedBooksCubit({required this.fetchNewestFeatureBooksUseCase}) : super(FetchNewestFeaturedBooksInitial());
  Future<void>fetchFeatureBooks() async {
    emit(FetchNewestFeaturedBooksLoading());
    var result=await fetchNewestFeatureBooksUseCase.call();
    result.fold((failure) {
      emit(FetchNewestFeaturedBooksFailure(error: failure.message));

    }, (books) {
      emit(FetchNewestFeaturedBooksSuccess(books: books));

    },);


  }
}

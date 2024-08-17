import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_feature_books_use_case.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/book_entity.dart';

part 'fetch_featured_books_state.dart';

class FetchFeaturedBooksCubit extends Cubit<FetchFeaturedBooksState> {
  final FetchFeatureBooksUseCase featureBooksUseCase;
  FetchFeaturedBooksCubit({required this.featureBooksUseCase}) : super(FetchFeaturedBooksInitial());
  Future<void>fetchFeatureBooks() async {
    emit(FetchFeaturedBooksLoading());
    var result=await featureBooksUseCase.call();
    result.fold((failure) {
      emit(FetchFeaturedBooksFailure(error: failure.message));

    }, (books) {
      emit(FetchFeaturedBooksSuccess(books: books));

    },);


  }
}

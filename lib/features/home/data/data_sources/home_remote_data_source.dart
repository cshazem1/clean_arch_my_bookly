import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/models/data_models/BookModel.dart';

import '../../domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var result = await apiService.get(
        endpoints: "volumes?Filtering=free-ebooks&q=programming");
    List<BookEntity> books = getBooksList(result);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> result) {
    List<BookEntity> books = [];
    for (var bookMp in result["items"]) {
      books.add(BookModel.fromJson(bookMp));
    }
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var result = await apiService.get(
        endpoints:
            "volumes?q=programming&sorting=newest&filtering=free-ebooks");
    List<BookEntity> books = getBooksList(result);
    return books;
  }
}

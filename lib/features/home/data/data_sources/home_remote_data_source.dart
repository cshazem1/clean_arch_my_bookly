import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/models/data_models/BookModel.dart';
import '../../../../constans.dart';
import '../../../../core/utils/functions/save_books_data.dart';
import '../../domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks([int pageNumber=0]);
  Future<List<BookEntity>> fetchNewestBooks([int pageNumber=0]);
}

class HomeRemoteSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteSourceImpl({required this.apiService});
  @override
  Future<List<BookEntity>> fetchFeaturedBooks([int pageNumber=0]) async {
    var result = await apiService.get(
        endpoints: "volumes?Filtering=free-ebooks&q=programming&startIndex=${pageNumber*10}");
    List<BookEntity> books = getBooksList(result);

    saveBooksData(books,KFeaturedBox);
    return books;
  }




  @override
  Future<List<BookEntity>> fetchNewestBooks([int pageNumber=0]) async {
    var result = await apiService.get(
        endpoints:
            "volumes?q=sports&sorting=newest&filtering=free-ebooks&startIndex=${pageNumber*10}");
    List<BookEntity> books = getBooksList(result);
    saveBooksData(books, KNewestFeaturedBox);

    return books;
  }
}



List<BookEntity> getBooksList(Map<String, dynamic> result) {
  List<BookEntity> books = [];
  for (var bookMp in result["items"]) {
    books.add(BookModel.fromJson(bookMp));
  }
  return books;
}
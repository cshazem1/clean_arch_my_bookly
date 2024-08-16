import 'package:bookly/constans.dart';
import 'package:hive/hive.dart';

import '../../domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
 List<BookEntity> fetchFeaturedBooks();
List<BookEntity> fetchNewestBooks();
}
class HomeLocalDataSourceImpl extends HomeLocalDataSource{
  @override
  List<BookEntity> fetchFeaturedBooks() {
    var box=Hive.box<BookEntity>(KFeaturedBox);
return box.values.toList();

  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box=Hive.box<BookEntity>(KNewestFeaturedBox);
    return box.values.toList();
  }



}
import 'package:hive/hive.dart';

import '../../../constans.dart';
import '../../../features/home/domain/entities/book_entity.dart';

Future<void> saveBooksData(List<BookEntity> books,String boxName) async {
  var box=Hive.box<BookEntity>(KFeaturedBox);
 await box.addAll(books);
}

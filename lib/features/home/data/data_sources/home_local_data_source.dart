import 'package:bookly/constans.dart';
import 'package:hive/hive.dart';

import '../../domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
 List<BookEntity> fetchFeaturedBooks({int numberPage=0});
List<BookEntity> fetchNewestBooks();
}
class HomeLocalDataSourceImpl extends HomeLocalDataSource{
  @override
  List<BookEntity> fetchFeaturedBooks({int numberPage=0}) {
    int startIndex=numberPage*10;
    int endIndex=(numberPage+1)*10;
    
    var box=Hive.box<BookEntity>(KFeaturedBox);
    int length=box.length;
    if(startIndex>=length||endIndex>length)
      {return [];}
return box.values.toList().sublist(startIndex,endIndex);

  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box=Hive.box<BookEntity>(KNewestFeaturedBox);
    return box.values.toList();
  }



}
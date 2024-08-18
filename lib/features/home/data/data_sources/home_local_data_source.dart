import 'package:bookly/constans.dart';
import 'package:hive/hive.dart';

import '../../domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
 List<BookEntity> fetchFeaturedBooks({int pageNumber=0});
List<BookEntity> fetchNewestBooks({int pageNumber=0});
}
class HomeLocalDataSourceImpl extends HomeLocalDataSource{
  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber=0}) {
    int startIndex=pageNumber*10;
    int endIndex=(pageNumber+1)*10;
    
    var box=Hive.box<BookEntity>(KFeaturedBox);
    int length=box.length;
    if(startIndex>=length||endIndex>length)
      {return [];}
return box.values.toList().sublist(startIndex,endIndex);

  }

  @override
  List<BookEntity> fetchNewestBooks({int pageNumber=0}) {
    int numberStart=pageNumber*10;
    int numberEnd=(pageNumber+1)*10;
    var box=Hive.box<BookEntity>(KNewestFeaturedBox);
    int length=box.length;
    if(numberStart>=length||numberEnd>length) {
      return [];
    } else {
      return box.values.toList().sublist(numberStart,numberEnd);
    }
  }



}
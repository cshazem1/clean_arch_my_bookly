import 'package:bookly/core/errors/failure_Server.dart';
import 'package:bookly/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl extends HomeRepo{
 final HomeRemoteDataSource homeRemoteDataSource;
final  HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl({required this.homeRemoteDataSource,required this.homeLocalDataSource});
  @override
  Future<Either<FailureServer, List<BookEntity>>> fetchFeaturedBooks() async {

try {
  var localBooks=  homeLocalDataSource.fetchFeaturedBooks();
  if(localBooks.isNotEmpty)
  {  return right(localBooks);}

  var remoteBooks= await  homeRemoteDataSource.fetchFeaturedBooks();
 return right(remoteBooks);

} on Exception catch (e) {
  return left(FailureServer(message: e.toString()));

}

  }

  @override
  Future<Either<FailureServer, List<BookEntity>>> fetchNewestBooks() async {
try {
  var localBooks= homeLocalDataSource.fetchNewestBooks();
  if(localBooks.isNotEmpty)
    {
      return right(localBooks);
    }
  var remoteBooks=await homeRemoteDataSource.fetchNewestBooks();
return right(remoteBooks);

}
catch (e)
    {
      return left(FailureServer(message: e.toString()));
    }

  }





}
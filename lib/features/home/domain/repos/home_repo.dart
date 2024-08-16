
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure_Server.dart';
import '../entities/book_entity.dart';

abstract class HomeRepo {
Future<Either<FailureServer,List<BookEntity>>>fetchFeaturedBooks();
Future<Either<FailureServer,List<BookEntity>>>fetchNewestBooks();

}
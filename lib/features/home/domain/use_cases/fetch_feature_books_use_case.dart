import 'package:bookly/features/home/domain/repos/home_repo.dart';
import 'package:either_dart/either.dart';

import '../../../../core/errors/failure_Server.dart';
import '../entities/book_entity.dart';

class FetchFeatureBooksUseCase{

  final HomeRepo homeRepo;
  FetchFeatureBooksUseCase({required this.homeRepo});
  Future<Either<FailureServer,List<BookEntity>>>fetchFeaturedBooks()  {

    return homeRepo.fetchFeaturedBooks();
  }



}
import 'package:bookly/core/errors/failure_Server.dart';
import 'package:bookly/core/use_cases/use_case.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/repos/home_repo.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_feature_books_use_case.dart';
import 'package:dartz/dartz.dart';

class FetchNewestBooksUseCase extends UseCase<List<BookEntity>,NoParam>{
  HomeRepo homeRepo;
  FetchNewestBooksUseCase({required this.homeRepo});
  @override
  Future<Either<FailureServer, List<BookEntity>>> call([NoParam? p]) async {
return await homeRepo.fetchNewestBooks();


  }





}
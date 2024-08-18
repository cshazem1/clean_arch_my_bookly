import 'package:dartz/dartz.dart';

import '../errors/failure_Server.dart';

abstract class UseCase<Type,Param>{
  Future<Either<Failure,Type>>call([Param param]);
}
import 'package:either_dart/either.dart';

import '../errors/failure_Server.dart';

abstract class UseCase<Type,Param>{
  Future<Either<FailureServer,Type>>call([Param p]);
}
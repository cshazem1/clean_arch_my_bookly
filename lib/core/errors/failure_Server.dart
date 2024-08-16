import 'package:dio/dio.dart';

abstract class Failure{
 final String message;

  Failure(this.message);
}
 class ServerFailure extends Failure{
  ServerFailure(super.message);
factory ServerFailure.fromDioException(DioException e){
  switch(e.type){
    case DioExceptionType.connectionTimeout:
     return ServerFailure("connectionTimeout");
    case DioExceptionType.sendTimeout:
     return ServerFailure("sendTimeout");
    case DioExceptionType.receiveTimeout:
     return ServerFailure("receiveTimeout");
    case DioExceptionType.badCertificate:
     return ServerFailure("badCertificate");
    case DioExceptionType.badResponse:
   return  ServerFailure.fromBadResponse(e.response!.statusCode!,e.response!.data);
    case DioExceptionType.cancel:
     return ServerFailure("cancel");
    case DioExceptionType.connectionError:
     return ServerFailure("connectionError");
    case DioExceptionType.unknown:
     return ServerFailure("unknown");
     default:return ServerFailure("default");
  }


}
  factory ServerFailure.fromBadResponse(int statusCode,dynamic response){
    if(statusCode==404) {
      return ServerFailure('your request was not found, please try later');

    }
    else if(statusCode==500) {
      return ServerFailure('there is a problem with server,please try again');

    }
    else if(statusCode==400||statusCode==401||statusCode==403) {
      return ServerFailure(response['error']);

    }
    else       {return ServerFailure('there was an error ,please try again');}








  }

}


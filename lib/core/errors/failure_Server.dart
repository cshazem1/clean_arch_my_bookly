import 'package:dio/dio.dart';

class FailureServer {
  String message;

  FailureServer({required this.message});
 factory FailureServer.dioException( DioExceptionType exception)
  {
   switch(exception){


     case DioExceptionType.connectionTimeout:
       return FailureServer(message: "connectionTimeout");
     case DioExceptionType.sendTimeout:
       return FailureServer(message: "sendTimeout");
     case DioExceptionType.receiveTimeout:
       return FailureServer(message: "receiveTimeout");
     case DioExceptionType.badCertificate:
       return FailureServer(message: "badCertificate");
     case DioExceptionType.badResponse:

     case DioExceptionType.cancel:
     return FailureServer(message: "cancel");
     case DioExceptionType.connectionError:
       return FailureServer(message: "connectionError");
     case DioExceptionType.unknown:
       return FailureServer(message: "unknown");
   }

  }


}
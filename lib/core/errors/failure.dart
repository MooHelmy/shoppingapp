import 'package:dio/dio.dart';

abstract class Failure {
  final String errormessage;

  Failure(this.errormessage);
}

class ServerFailuer extends Failure {
  ServerFailuer(super.errormessage);
  factory ServerFailuer.fromDioerror(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailuer('Connection Timeout with Api');
      case DioExceptionType.sendTimeout:
        return ServerFailuer('Send Timeout with Api');
      case DioExceptionType.receiveTimeout:
        return ServerFailuer('Recive Timeout with Api');
      case DioExceptionType.badCertificate:
        return ServerFailuer('incorrect certificate as configured with Api');
      case DioExceptionType.badResponse:
        return ServerFailuer.frombadrespons(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailuer('Request to Apiservev Was cansel ');
      case DioExceptionType.connectionError:
        return ServerFailuer('No internet connection,please try later!');
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailuer('No internet connection');
        }
        return ServerFailuer('unexpected Error ,please try again!');
      default:
        return ServerFailuer('opps there was error,please try again');
    }
  }
  factory ServerFailuer.frombadrespons(int statescode, dynamic respons) {
    if (statescode == 400 || statescode == 401 || statescode == 403) {
      return ServerFailuer(respons['error']['message']);
    } else if (statescode == 404) {
      return ServerFailuer('Your request not found ,please try later!');
    } else if (statescode == 500) {
      return ServerFailuer('Internet servier Error,please try later!');
    }

    return ServerFailuer('opps there was error,please try again');
  }
}

import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessagel;

  Failure(this.errMessagel);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessagel);

  factory ServerFailure.fromDioExeotion(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure('Receive timeout with ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceld');
      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection');
      case DioExceptionType.unknown:
        return ServerFailure('Unkown Error, Please try again!');
      default:
        return ServerFailure('Opps There was an error ,Please try later!');
    }
  }

  factory ServerFailure.fromBadResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your requist not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internet Server error, Please try later!');
    }
    return ServerFailure('Opps There was an error ,Please try later!');
  }
}

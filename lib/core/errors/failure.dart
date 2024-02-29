import 'package:dio/dio.dart';

abstract class failure {
  final String errmessage;

  failure(this.errmessage);
}

class serverfailure extends failure {
  serverfailure(super.errmessage);

  factory serverfailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.badCertificate:
        return serverfailure("Bad certificate with Api server .");
      case DioExceptionType.badResponse:
        return serverfailure.fromResponse(
            e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        return serverfailure("Request with Api was canceled .");
      case DioExceptionType.connectionError:
        return serverfailure(
            "There was a problem in internet connection , please try again .");
      case DioExceptionType.connectionTimeout:
        return serverfailure("Connection time out .");
      case DioExceptionType.receiveTimeout:
        return serverfailure("Recieve time out .");
      case DioExceptionType.sendTimeout:
        return serverfailure("Send time out .");
      case DioExceptionType.unknown:
        return serverfailure("There was an Error , please try again .");
    }
  }

  factory serverfailure.fromResponse(int statuscode, dynamic response) {
    if (statuscode == 400) {
      return serverfailure("Your request was not found .");
    } else if (statuscode == 401 || statuscode == 403 || statuscode == 404) {
      return serverfailure(response["error"]["message"]);
    } else if (statuscode == 500) {
      return serverfailure("There is a prblem with Apiserver .");
    } else {
      return serverfailure("Try again");
    }
  }
}

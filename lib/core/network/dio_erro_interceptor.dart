import 'package:dio/dio.dart';

class DioErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    //Now Handling Server Error
    if (err.response != null) {
      if (err.response!.statusCode! >= 300) {
        err = DioException(
            requestOptions: err.requestOptions,
            response: err.response,
            error: err.response!.data['message'] ?? err.response!.statusMessage,
            type: err.type);
      } else {
        err = DioException(
            requestOptions: err.requestOptions,
            response: err.response,
            error: 'Something Went Wrong',
            type: err.type);
      }
    } else {
      // Handle connection error
      err = DioException(
        requestOptions: err.requestOptions,
        error: 'Connection error',
        type: err.type,
      );
    }
    super.onError(err, handler);
  }
}

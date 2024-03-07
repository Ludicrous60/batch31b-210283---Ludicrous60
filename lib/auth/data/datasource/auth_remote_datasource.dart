import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/auth/data/model/auth_api_model.dart';
import 'package:e_commerce/auth/domain/entity/auth_entity.dart';
import 'package:e_commerce/config/constants/api_endpoints.dart';
import 'package:e_commerce/core/common/failure.dart';
import 'package:e_commerce/core/network/http_service.dart';
import 'package:e_commerce/core/sharedPref/user_shared_pref.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRemoteDataSourceProvider =
    Provider<AuthRemoteDataSource>((ref) => AuthRemoteDataSource(
          dio: ref.read(httpServiceProvider),
          userSharedPref: ref.read(userSharedPrefsProvider),
        ));

class AuthRemoteDataSource {
  final Dio dio;
  final UserSharedPref userSharedPref;
  AuthRemoteDataSource({required this.dio, required this.userSharedPref});

  // Converts an AuthEntity to an AuthApiModel before making the HTTP request.

  Future<Either<Failure, bool>> register(AuthEntity freelancer) async {
    try {
      AuthApiModel authApiModel = AuthApiModel.fromEntity(freelancer);
      Response response = await dio.post(ApiEndpoints.register, data: {
        "firstName": authApiModel.firstName,
        "lastName": authApiModel.lastName,
        "email": authApiModel.email,
        "password": authApiModel.password,
      });
      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return Left(Failure(
            error: response.data['message'],
            statusCode: response.statusCode.toString()));
      }
    } on DioException catch (e) {
      return Left(Failure(
          error: e.error.toString(),
          statusCode: e.response!.statusCode.toString() ?? '0'));
    }
  }

  //Login AuthRemoteDataSource
  Future<Either<Failure, bool>> login(String email, String password) async {
    try {
      Response response = await dio.post(ApiEndpoints.login,
          data: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        //Retriving Token
        String token = response.data['token'];
        final storedToken = await userSharedPref.setUserToken(token);
        final storeUser =
            await userSharedPref.setUserId(response.data['user']['_id']);
        print('Stored Token is: $storedToken');
        print('Stored user is: $storeUser');
        return Right(true);
      } else {
        return Left(Failure(
            error: response.data['message'],
            statusCode: response.statusCode.toString()));
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }

  Future<Either<Failure, AuthEntity>> getUser(String email) async {
    try {
      Response response = await dio.post(
        ApiEndpoints.userProfile,
        data: {
          "email": email,
        },
      );

      if (response.statusCode == 200) {
        var user = AuthApiModel.fromJson(response.data['data']).toEntity();

        return Right(user);
      } else {
        return Left(
          Failure(
            error: response.data["message"],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }
}

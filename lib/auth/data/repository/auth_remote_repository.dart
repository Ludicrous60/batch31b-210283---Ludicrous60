import 'package:dartz/dartz.dart';
import 'package:e_commerce/auth/data/datasource/auth_remote_datasource.dart';
import 'package:e_commerce/auth/domain/entity/auth_entity.dart';
import 'package:e_commerce/auth/domain/repository/auth_repository.dart';
import 'package:e_commerce/core/common/failure.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRemoteRepositoryProvider = Provider<AuthRepository>(
    (ref) => AuthRemoteRepository(ref.read(authRemoteDataSourceProvider)));


class AuthRemoteRepository implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRemoteRepository(this.authRemoteDataSource);

  @override
  Future<Either<Failure, bool>> register(AuthEntity freelancer) async {
    return await authRemoteDataSource.register(freelancer);
  }
  
  @override
  Future<Either<Failure, bool>> login(String email, String password) async {
    return await authRemoteDataSource.login(email, password);
  }
  @override
  Future<Either<Failure, AuthEntity>> getUser(String email) {
    return authRemoteDataSource.getUser(email);
  }
}

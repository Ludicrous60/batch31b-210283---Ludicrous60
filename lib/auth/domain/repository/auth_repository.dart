import 'package:dartz/dartz.dart';
import 'package:e_commerce/auth/data/repository/auth_remote_repository.dart';
import 'package:e_commerce/auth/domain/entity/auth_entity.dart';
import 'package:e_commerce/core/common/failure.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider =
    Provider((ref) => ref.read(authRemoteRepositoryProvider));

abstract class AuthRepository {
  Future<Either<Failure, bool>> register(AuthEntity authEntity);
  Future<Either<Failure, bool>> login(String email, String password);
  Future<Either<Failure, AuthEntity>> getUser(String email);
}

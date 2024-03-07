import 'package:dartz/dartz.dart';
import 'package:e_commerce/auth/domain/entity/auth_entity.dart';
import 'package:e_commerce/auth/domain/repository/auth_repository.dart';
import 'package:e_commerce/core/common/failure.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signUpUseCaseProvider = Provider.autoDispose<SignUpUseCase>(
    (ref) => SignUpUseCase(ref.read(authRepositoryProvider)));

class SignUpUseCase {
  final AuthRepository authRepository;
  SignUpUseCase(this.authRepository);

  Future<Either<Failure, bool>> register(AuthEntity entity) async {
    return await authRepository.register(entity);
  }
}

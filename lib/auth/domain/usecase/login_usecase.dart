import 'package:dartz/dartz.dart';
import 'package:e_commerce/auth/domain/repository/auth_repository.dart';
import 'package:e_commerce/core/common/failure.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginUseCaseProvider = Provider.autoDispose<LoginUseCase>(
    (ref) => LoginUseCase(ref.watch(authRepositoryProvider)));

class LoginUseCase {
  final AuthRepository authRepository;
  LoginUseCase(this.authRepository);

  Future<Either<Failure, bool>> login(
      String email, String password) async {
    return await authRepository.login(email, password);
  }
}

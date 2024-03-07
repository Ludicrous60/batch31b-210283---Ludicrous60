import 'package:dartz/dartz.dart';
import 'package:e_commerce/auth/domain/entity/auth_entity.dart';
import 'package:e_commerce/auth/domain/repository/auth_repository.dart';
import 'package:e_commerce/core/common/failure.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileUseCaseProvider = Provider.autoDispose<ProfileUseCase>(
    (ref) => ProfileUseCase(ref.read(authRepositoryProvider)));

class ProfileUseCase {
  final AuthRepository authRepository;
  ProfileUseCase(this.authRepository);

  Future<Either<Failure,AuthEntity>> getUser(String email) async {
    return await authRepository.getUser(email);
  }
}

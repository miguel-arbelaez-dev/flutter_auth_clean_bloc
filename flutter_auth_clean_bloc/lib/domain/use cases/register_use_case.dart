import 'package:flutter_auth_clean_bloc/data/repository/auth_repository_impl.dart';
import 'package:flutter_auth_clean_bloc/domain/entities/user_entity.dart';
import 'package:flutter_auth_clean_bloc/domain/repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase({AuthRepository? repository})
    : repository = repository ?? AuthRepositoryImpl();

  Future<UserEntity> call({
    required String email,
    required String password,
  }) async {
    return await repository.register(email: email, password: password);
  }
}

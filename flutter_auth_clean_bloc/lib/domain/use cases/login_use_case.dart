import 'package:flutter_auth_clean_bloc/data/repository/auth_repository_impl.dart';
import 'package:flutter_auth_clean_bloc/domain/entities/user_entity.dart';
import 'package:flutter_auth_clean_bloc/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase({AuthRepository? repository})
    : repository = repository ?? AuthRepositoryImpl();

  Future<UserEntity> call({
    required String username,
    required String password,
  }) async {
    return await repository.login(username: username, password: password);
  }
}

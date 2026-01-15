import 'package:flutter_auth_clean_bloc/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> login({
    required String username,
    required String password,
  });
}

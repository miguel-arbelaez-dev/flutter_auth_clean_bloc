import 'package:flutter_auth_clean_bloc/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_auth_clean_bloc/data/models/auth_remote_data_source.dart';
import 'package:flutter_auth_clean_bloc/domain/entities/user_entity.dart';
import 'package:flutter_auth_clean_bloc/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({AuthRemoteDataSource? remoteDataSource})
    : remoteDataSource = remoteDataSource ?? AuthRemoteDataSource();

  @override
  Future<UserEntity> login({
    required String email,
    required String password,
  }) async {
    final Map<String, dynamic> response = await remoteDataSource.login(
      email: email,
      password: password,
    );

    final UserModel userModel = UserModel.fromMap(response);
    return UserEntity(token: userModel.token);
  }

  @override
  Future<UserEntity> register({
    required String email,
    required String password,
  }) async {
    final Map<String, dynamic> response = await remoteDataSource.register(
      email: email,
      password: password,
    );

    final UserModel userModel = UserModel.fromMap(response);
    return UserEntity(token: userModel.token);
  }
}

import 'package:flutter_auth_clean_bloc/data/datasources/remote%20data%20source/auth_remote_data_source.dart';
import 'package:flutter_auth_clean_bloc/data/models/user_model.dart';
import 'package:flutter_auth_clean_bloc/domain/entities/user_entity.dart';
import 'package:flutter_auth_clean_bloc/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({AuthRemoteDataSource? remoteDataSource})
    : remoteDataSource = remoteDataSource ?? AuthRemoteDataSource();

  @override
  Future<UserEntity> login({
    required String username,
    required String password,
  }) async {
    final response = await remoteDataSource.login(
      username: username,
      password: password,
    );

    final userModel = UserModel.fromMap(response);
    return UserEntity(token: userModel.token);
  }
}

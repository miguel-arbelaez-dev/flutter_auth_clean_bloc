import 'package:flutter_auth_clean_bloc/data/datasources/local%20data%20source/auth_local_data_source.dart';
import 'package:flutter_auth_clean_bloc/domain/use%20cases/login_use_case.dart';
import 'package:flutter_auth_clean_bloc/presentation/bloc/auth_event.dart';
import 'package:flutter_auth_clean_bloc/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final AuthLocalDataSource _localDataSource = AuthLocalDataSource();

  AuthBloc({required this.loginUseCase}) : super(const AuthState()) {
    on<LoginEvent>(_onLogin);
    on<LogoutEvent>(_onLogout);
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(loading: true, errorMessage: null));

    try {
      final user = await loginUseCase(
        username: event.username,
        password: event.password,
      );

      await _localDataSource.saveToken(user.token);

      emit(state.copyWith(loading: false, token: user.token));
    } catch (e) {
      emit(state.copyWith(loading: false, errorMessage: e.toString()));
    }
  }

  Future<void> _onLogout(LogoutEvent event, Emitter<AuthState> emit) async {
    await _localDataSource.clearToken();
    emit(const AuthState());
  }
}

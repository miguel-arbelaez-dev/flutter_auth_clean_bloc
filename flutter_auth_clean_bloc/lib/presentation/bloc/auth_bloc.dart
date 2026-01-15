import 'package:flutter_auth_clean_bloc/domain/use%20cases/login_use_case.dart';
import 'package:flutter_auth_clean_bloc/domain/use%20cases/register_use_case.dart';
import 'package:flutter_auth_clean_bloc/presentation/bloc/auth_event.dart';
import 'package:flutter_auth_clean_bloc/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;

  AuthBloc({required this.loginUseCase, required this.registerUseCase})
    : super(const AuthState()) {
    on<LoginEvent>(_onLogin);
    on<RegisterEvent>(_onRegister);
    on<LogoutEvent>(_onLogout);
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(loading: true, errorMessage: null));

    try {
      final user = await loginUseCase(
        email: event.email,
        password: event.password,
      );

      emit(state.copyWith(loading: false, token: user.token));
    } catch (e) {
      emit(state.copyWith(loading: false, errorMessage: e.toString()));
    }
  }

  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(loading: true, errorMessage: null));

    try {
      final user = await registerUseCase(
        email: event.email,
        password: event.password,
      );

      emit(state.copyWith(loading: false, token: user.token));
    } catch (e) {
      emit(state.copyWith(loading: false, errorMessage: e.toString()));
    }
  }

  void _onLogout(LogoutEvent event, Emitter<AuthState> emit) {
    emit(const AuthState());
  }
}

class AuthState {
  final bool loading;
  final String? token;
  final String? errorMessage;

  const AuthState({this.loading = false, this.token, this.errorMessage});

  AuthState copyWith({bool? loading, String? token, String? errorMessage}) {
    return AuthState(
      loading: loading ?? this.loading,
      token: token ?? this.token,
      errorMessage: errorMessage,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_auth_clean_bloc/domain/use%20cases/login_use_case.dart';
import 'package:flutter_auth_clean_bloc/presentation/bloc/auth_bloc.dart';
import 'package:flutter_auth_clean_bloc/presentation/routes/app_routes.dart';
import 'package:flutter_auth_clean_bloc/presentation/theme/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(loginUseCase: LoginUseCase()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        initialRoute: AppRoutes.splash,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}

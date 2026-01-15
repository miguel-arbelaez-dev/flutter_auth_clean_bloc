import 'package:flutter/material.dart';
import 'package:flutter_auth_clean_bloc/domain/use%20cases/login_use_case.dart';
import 'package:flutter_auth_clean_bloc/domain/use%20cases/register_use_case.dart';
import 'package:flutter_auth_clean_bloc/presentation/bloc/auth_bloc.dart';
import 'package:flutter_auth_clean_bloc/presentation/routes/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(
        loginUseCase: LoginUseCase(),
        registerUseCase: RegisterUseCase(),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Auth Clean BLoC',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: AppRoutes.login,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_auth_clean_bloc/presentation/bloc/auth_bloc.dart';
import 'package:flutter_auth_clean_bloc/presentation/bloc/auth_event.dart';
import 'package:flutter_auth_clean_bloc/presentation/bloc/auth_state.dart';
import 'package:flutter_auth_clean_bloc/presentation/routes/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.token != null) {
            Navigator.pushReplacementNamed(context, AppRoutes.home);
          }

          if (state.errorMessage != null) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
          }
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),

                Text('Welcome back', style: theme.textTheme.headlineLarge),
                const SizedBox(height: 8),
                Text('Login to continue', style: theme.textTheme.bodyLarge),

                const SizedBox(height: 50),

                TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                ),

                const SizedBox(height: 20),

                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock_outline),
                  ),
                ),

                const SizedBox(height: 32),

                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state.loading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    return SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<AuthBloc>().add(
                            LoginEvent(
                              username: _usernameController.text.trim(),
                              password: _passwordController.text.trim(),
                            ),
                          );
                        },
                        child: const Text('Login'),
                      ),
                    );
                  },
                ),

                const Spacer(),

                Center(
                  child: Text(
                    'Demo credentials\nUsername: mor_2314\nPassword: 83r5^_',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

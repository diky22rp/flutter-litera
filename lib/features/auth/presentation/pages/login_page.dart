import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_litera/core/utils/app_snackbar.dart';
import 'package:flutter_litera/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_litera/features/auth/presentation/pages/widgets/login_form.dart';
import 'package:flutter_litera/features/hub/presentation/pages/hub_selection_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listenWhen: (_, current) => current is AuthResultState,
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            if (state.source == AuthSource.login) {
              AppSnackbar.showSuccess(
                context,
                "Berhasil masuk! Selamat datang.",
              );
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const HubSelectionPage()),
              );
            }
          }

          if (state is AuthError) {
            AppSnackbar.showError(context, state.message);
          }
        },
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: const LoginForm(),
            ),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthLoading) {
                  return Container(
                    color: Colors.black38,
                    child: const Center(child: CircularProgressIndicator()),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_litera/core/constants/app_colors.dart';

import 'package:flutter_litera/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_litera/features/hub/presentation/bloc/hub_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        context.read<AuthBloc>().add(const AuthEvent.checkAuthStatus());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            state.maybeWhen(
              authenticated: (user, source) {
                context.read<HubBloc>().add(const HubEvent.checkHubSelection());
              },
              unauthenticated: () {
                context.goNamed('login');
              },
              error: (msg) {
                context.goNamed('login');
              },
              orElse: () {},
            );
          },
        ),

        BlocListener<HubBloc, HubState>(
          listener: (context, state) {
            state.maybeWhen(
              hubSelected: (hubId) {
                context.goNamed('home');
              },
              hubNotSelected: () {
                context.goNamed('hub-selection');
              },
              orElse: () {},
            );
          },
        ),
      ],

      // TAMPILAN UI
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.book_rounded,
                size: 80,
                color: AppColors.primary,
              ),
              const SizedBox(height: 16),
              const Text(
                "LITERA",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Baca Semaumu, Bayar Seperlunya",
                style: TextStyle(color: AppColors.textGrey),
              ),
              const SizedBox(height: 48),
              const CircularProgressIndicator(color: AppColors.action),
            ],
          ),
        ),
      ),
    );
  }
}

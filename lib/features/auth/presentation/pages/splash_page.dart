import 'package:flutter/material.dart';
import 'package:flutter_litera/core/constants/app_colors.dart';
import 'package:flutter_litera/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_litera/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_litera/features/hub/domain/repositories/hub_repository.dart';
import 'package:flutter_litera/features/hub/presentation/pages/hub_selection_page.dart';
import 'package:flutter_litera/features/main/presentation/pages/main_page.dart';
import 'package:flutter_litera/injection_container.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _checkStatus();
  }

  Future<void> _checkStatus() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    final isLoggedIn = await sl<AuthRepository>().isLoggedIn();

    if (!mounted) return;

    if (isLoggedIn) {
      final hubResult = await sl<HubRepository>().getSavedHubID();

      hubResult.fold(
        (failure) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const HubSelectionPage()),
          );
        },
        (hubId) {
          if (hubId != null && hubId.isNotEmpty) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const MainPage()),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const HubSelectionPage()),
            );
          }
        },
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.book_rounded, size: 80, color: AppColors.primary),
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
    );
  }
}

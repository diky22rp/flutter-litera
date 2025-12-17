import 'package:flutter/material.dart';
import 'package:flutter_litera/core/constants/app_colors.dart';
import 'package:flutter_litera/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_litera/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_litera/features/hub/domain/repositories/hub_repository.dart';
import 'package:flutter_litera/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DummyHomePage extends StatelessWidget {
  const DummyHomePage({super.key});

  // Fungsi untuk mengambil Data dari Repository
  Future<Map<String, String?>> _getSavedData() async {
    final repo = sl<HubRepository>();

    final idResult = await repo.getSavedHubID();
    String id = idResult.fold((l) => "-", (r) => r ?? "-");

    final nameResult = await repo.getSavedHubName();
    String name = nameResult.fold((l) => "-", (r) => r ?? "-");

    return {"id": id, "name": name};
  }

  // Logout & Reset (Testing purposes)
  Future<void> _logout(BuildContext context) async {
    await sl<AuthRepository>().logout();

    final prefs = sl<SharedPreferences>();
    await prefs.clear();

    if (context.mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text("Dummy Home")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, size: 64, color: AppColors.success),
            const SizedBox(height: 24),
            const Text(
              "Setup Berhasil!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text("Lokasi Hub tersimpan di Memory HP:"),
            const SizedBox(height: 24),

            FutureBuilder<Map<String, String?>>(
              future: _getSavedData(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const CircularProgressIndicator();

                final data = snapshot.data!;
                return Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(color: AppColors.shadow, blurRadius: 10),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "LOKASI AKTIF",
                        style: TextStyle(color: AppColors.textGrey),
                      ),
                      const SizedBox(height: 8),
                      // TAMPILKAN NAMA
                      Text(
                        data['name'] ?? "Unknown",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textMain,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      // TAMPILKAN ID
                      Text(
                        "ID: ${data['id']}",
                        style: const TextStyle(
                          fontSize: 12,
                          fontFamily: 'Courier',
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () => _logout(context),
              icon: const Icon(Icons.logout),
              label: const Text("Reset & Logout"),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.error,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

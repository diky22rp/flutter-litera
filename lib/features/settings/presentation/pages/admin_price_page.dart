import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_litera/core/constants/app_colors.dart';
import 'package:flutter_litera/core/presentation/widgets/litera_loading.dart';
import 'package:flutter_litera/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:flutter_litera/injection.dart'; // Buat sl<>

class AdminPricePage extends StatelessWidget {
  const AdminPricePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SettingsCubit>()..loadSettings(),
      child: const _AdminPriceView(),
    );
  }
}

class _AdminPriceView extends StatefulWidget {
  const _AdminPriceView();

  @override
  State<_AdminPriceView> createState() => _AdminPriceViewState();
}

class _AdminPriceViewState extends State<_AdminPriceView> {
  final TextEditingController _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Atur Harga Sewa",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: BlocConsumer<SettingsCubit, SettingsState>(
        listener: (context, state) {
          state.maybeWhen(
            successUpdate: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Harga berhasil disimpan!"),
                  backgroundColor: Colors.green,
                ),
              );
            },
            error: (msg) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(msg), backgroundColor: Colors.red),
              );
            },
            loaded: (settings) {
              _priceController.text = settings.rentalPricePerDay.toString();
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          if (state == const SettingsState.loading()) {
            return const LiteraLoading(isOverlay: false);
          }

          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Harga Sewa Per Hari (Rp)",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _priceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixText: "Rp ",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Harga ini akan berlaku global untuk semua buku.",
                  style: TextStyle(color: Colors.grey),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      final val = int.tryParse(_priceController.text);
                      if (val != null) {
                        context.read<SettingsCubit>().updatePrice(val);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "SIMPAN PERUBAHAN",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

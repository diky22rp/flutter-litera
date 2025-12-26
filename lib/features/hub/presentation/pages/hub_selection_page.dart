import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_litera/injection.dart';
import 'package:go_router/go_router.dart'; // 👈 Import GoRouter
import 'package:flutter_litera/core/constants/app_colors.dart';
import 'package:flutter_litera/core/utils/app_snackbar.dart';
import 'package:flutter_litera/features/hub/presentation/bloc/hub_bloc.dart';

class HubSelectionPage extends StatelessWidget {
  final bool isEditMode;

  const HubSelectionPage({super.key, this.isEditMode = false});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HubBloc>()..add(const HubEvent.fetchAllHubs()),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: const Text("Pilih Lokasi Hub"),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.textMain,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Di mana kamu ingin mengambil buku?",
                style: TextStyle(fontSize: 16, color: AppColors.textGrey),
              ),
              const SizedBox(height: 20),

              // EXPANDED LIST
              Expanded(
                child: BlocListener<HubBloc, HubState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      hubNameLoaded: (name) {
                        if (isEditMode) {
                          context.pop(true);
                          AppSnackbar.showSuccess(
                            context,
                            "Lokasi berubah ke $name",
                          );
                        } else {
                          context.goNamed('home');
                          AppSnackbar.showSuccess(
                            context,
                            "Anda memilih lokasi $name",
                          );
                        }
                      },
                      error: (msg) => AppSnackbar.showError(context, msg),
                      orElse: () {},
                    );
                  },
                  child: BlocBuilder<HubBloc, HubState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        loading: () =>
                            const Center(child: CircularProgressIndicator()),

                        error: (message) => Center(child: Text(message)),

                        loaded: (hubs) {
                          if (hubs.isEmpty) {
                            return const Center(
                              child: Text("Belum ada Hub tersedia."),
                            );
                          }

                          return ListView.separated(
                            itemCount: hubs.length,
                            separatorBuilder: (_, __) =>
                                const SizedBox(height: 16),
                            itemBuilder: (context, index) {
                              final hub = hubs[index];

                              return Container(
                                margin: const EdgeInsets.only(bottom: 4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: AppColors.shadow,
                                      blurRadius: 10,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Material(
                                  color: AppColors.surface,
                                  borderRadius: BorderRadius.circular(20),
                                  clipBehavior: Clip.antiAlias,
                                  child: InkWell(
                                    onTap: () {
                                      context.read<HubBloc>().add(
                                        HubEvent.selectHub(hub),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Row(
                                        children: [
                                          // Icon Toko
                                          Container(
                                            padding: const EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                255,
                                                236,
                                                236,
                                                255,
                                              ).withValues(alpha: 26),
                                              shape: BoxShape.circle,
                                            ),
                                            child: const Icon(
                                              Icons
                                                  .store_mall_directory_rounded,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                          const SizedBox(width: 16),

                                          // Teks Info Hub
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  hub.name,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    color: AppColors.textMain,
                                                  ),
                                                ),
                                                const SizedBox(height: 4),
                                                Text(
                                                  hub.location,
                                                  style: const TextStyle(
                                                    color: AppColors.textGrey,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          // Arrow Icon
                                          const Icon(
                                            Icons.arrow_forward_ios,
                                            size: 16,
                                            color: AppColors.textGrey,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },

                        orElse: () => const SizedBox(),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

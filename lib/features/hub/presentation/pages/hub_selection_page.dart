import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_litera/core/constants/app_colors.dart';
import 'package:flutter_litera/core/utils/app_snackbar.dart';
import 'package:flutter_litera/features/home/presentation/pages/dummy_home_page.dart';
import 'package:flutter_litera/features/hub/presentation/bloc/hub_bloc.dart';
import 'package:flutter_litera/injection_container.dart';

class HubSelectionPage extends StatelessWidget {
  const HubSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HubBloc>()..add(FetchAllHubs()),
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
              Expanded(
                child: BlocConsumer<HubBloc, HubState>(
                  listener: (context, state) {
                    if (state is HubSelectedSuccess) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const DummyHomePage(),
                        ),
                      );

                      AppSnackbar.showSuccess(
                        context,
                        "Lokasi tersimpan! Menuju katalog...",
                      );
                    }
                  },
                  builder: (context, state) {
                    return BlocBuilder<HubBloc, HubState>(
                      builder: (context, state) {
                        if (state is HubLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is HubError) {
                          return Center(child: Text(state.message));
                        } else if (state is HubLoaded) {
                          if (state.hubs.isEmpty) {
                            return const Center(
                              child: Text("Belum ada Hub tersedia."),
                            );
                          }
                          return ListView.separated(
                            itemCount: state.hubs.length,
                            separatorBuilder: (_, __) =>
                                const SizedBox(height: 16),
                            itemBuilder: (context, index) {
                              final hub = state.hubs[index];
                              return InkWell(
                                onTap: () {
                                  //event select hub
                                  context.read<HubBloc>().add(SelectHub(hub));
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: AppColors.surface,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: AppColors.shadow,
                                        blurRadius: 10,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
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
                                          Icons.store_mall_directory_rounded,
                                          color: AppColors.primary,
                                        ),
                                      ),
                                      const SizedBox(width: 16),
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
                                      const Icon(
                                        Icons.arrow_forward_ios,
                                        size: 16,
                                        color: AppColors.textGrey,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                        return const SizedBox();
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

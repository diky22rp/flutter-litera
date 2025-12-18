import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_litera/core/constants/app_colors.dart';
import 'package:flutter_litera/features/home/presentation/pages/home_page.dart';
import 'package:flutter_litera/features/main/presentation/cubit/main_cubit.dart';
import 'package:flutter_litera/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter_litera/features/transaction/presentation/pages/history_page.dart';
import 'package:flutter_litera/injection_container.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const HomePage(),
      const Scaffold(body: Center(child: Text("Search (Coming Soon)"))),
      const HistoryPage(),
      const ProfilePage(),
    ];

    return BlocProvider(
      create: (context) => sl<MainCubit>(),
      child: BlocBuilder<MainCubit, int>(
        builder: (context, currentIndex) {
          return Scaffold(
            body: IndexedStack(index: currentIndex, children: pages),
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadow,
                    blurRadius: 20,
                    offset: Offset(0, -5),
                  ),
                ],
              ),
              child: NavigationBarTheme(
                data: NavigationBarThemeData(
                  // Update: Ganti withOpacity jadi withValues sesuai saran linting
                  indicatorColor: AppColors.primary.withValues(alpha: 0.1),
                  labelTextStyle: WidgetStateProperty.all(
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                ),
                child: NavigationBar(
                  height: 70,
                  elevation: 0,
                  backgroundColor: AppColors.surface,
                  selectedIndex: currentIndex,
                  onDestinationSelected: (index) {
                    context.read<MainCubit>().changeTab(index);
                  },
                  destinations: const [
                    NavigationDestination(
                      icon: Icon(Icons.home_outlined),
                      selectedIcon: Icon(
                        Icons.home_rounded,
                        color: AppColors.primary,
                      ),
                      label: 'Home',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.search),
                      selectedIcon: Icon(
                        Icons.search,
                        color: AppColors.primary,
                      ),
                      label: 'Search',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.receipt_long_outlined),
                      selectedIcon: Icon(
                        Icons.receipt_long_rounded,
                        color: AppColors.primary,
                      ),
                      label: 'Activity',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.person_outline_rounded),
                      selectedIcon: Icon(
                        Icons.person_rounded,
                        color: AppColors.primary,
                      ),
                      label: 'Profile',
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

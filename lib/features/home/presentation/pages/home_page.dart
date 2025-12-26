import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_litera/core/constants/app_colors.dart';
import 'package:flutter_litera/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_litera/features/home/presentation/pages/widgets/location_section.dart';
import 'package:flutter_litera/features/home/presentation/pages/widgets/new_book_section.dart';
import 'package:flutter_litera/features/home/presentation/pages/widgets/search_bar_section.dart';
import 'package:flutter_litera/features/home/presentation/pages/widgets/user_profile_section.dart';
import 'package:flutter_litera/features/hub/presentation/bloc/hub_bloc.dart';
import 'package:flutter_litera/injection.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    context.read<HubBloc>().add(const HubEvent.getSavedHubName());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<HomeBloc>()..add(const HomeEvent.fetchHomeBooks()),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserProfileSection(),

                const SizedBox(height: 20),

                LocationSection(),

                const SizedBox(height: 16),

                SearchBarSection(),

                const SizedBox(height: 24),

                NewBookSection(),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

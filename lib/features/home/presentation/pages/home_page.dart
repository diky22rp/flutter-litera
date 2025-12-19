import 'package:flutter/material.dart';
import 'package:flutter_litera/core/constants/app_colors.dart';
import 'package:flutter_litera/features/home/presentation/pages/widgets/location_section.dart';
import 'package:flutter_litera/features/home/presentation/pages/widgets/new_book_section.dart';
import 'package:flutter_litera/features/home/presentation/pages/widgets/search_bar_section.dart';
import 'package:flutter_litera/features/home/presentation/pages/widgets/user_profile_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}

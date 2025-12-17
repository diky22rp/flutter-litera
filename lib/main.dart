import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_litera/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_litera/features/auth/presentation/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';
import 'injection_container.dart' as di;
import 'core/constants/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;

  //Init Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  //Init Service Locator
  await di.init();

  runApp(const LiteraApp());
}

class LiteraApp extends StatelessWidget {
  const LiteraApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => di.sl<AuthBloc>())],
      child: MaterialApp(
        title: 'LITERA',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.background,
          primaryColor: AppColors.primary,

          colorScheme: const ColorScheme.light(
            primary: AppColors.primary,
            secondary: AppColors.action,
            surface: AppColors.surface,
            error: AppColors.error,
          ),

          textTheme:
              GoogleFonts.plusJakartaSansTextTheme(
                ThemeData.light().textTheme,
              ).apply(
                bodyColor: AppColors.textMain,
                displayColor: AppColors.textMain,
              ),

          useMaterial3: true,
        ),
        home: const LoginPage(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_litera/core/providers/global_providers.dart';
import 'package:flutter_litera/core/routes/app_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';
import 'core/constants/app_colors.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'injection.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load .env
  await dotenv.load(fileName: ".env");

  //Init Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  //Init Service Locator
  // await di.init();
  await configureDependencies();

  await initializeDateFormatting('id_ID', null);

  runApp(const LiteraApp());
}

class LiteraApp extends StatelessWidget {
  const LiteraApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: globalBlocProviders,
      child: MaterialApp.router(
        title: dotenv.env['APP_NAME'] ?? 'Litera',
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
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
        // home: const SplashPage(),
      ),
    );
  }
}

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// Import your features
import 'package:flutter_litera/features/admin/presentation/pages/admin_dashboard_page.dart';
import 'package:flutter_litera/features/admin/presentation/pages/admin_hub_page.dart';
import 'package:flutter_litera/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_litera/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_litera/features/auth/presentation/pages/register_page.dart';
import 'package:flutter_litera/features/auth/presentation/pages/splash_page.dart';
import 'package:flutter_litera/features/book/domain/entities/banner_entity.dart';
import 'package:flutter_litera/features/book/domain/entities/book_entity.dart';
import 'package:flutter_litera/features/book/presentation/pages/book_detail_page.dart';
import 'package:flutter_litera/features/book/presentation/pages/search/search_page.dart';
import 'package:flutter_litera/features/home/presentation/pages/home_page.dart';
import 'package:flutter_litera/features/home/presentation/pages/widgets/home_banner_detail_page.dart';
import 'package:flutter_litera/features/hub/presentation/pages/hub_selection_page.dart';
import 'package:flutter_litera/features/main/presentation/pages/main_page.dart';
import 'package:flutter_litera/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter_litera/features/settings/presentation/pages/admin_price_page.dart';
import 'package:flutter_litera/features/transaction/domain/entities/transaction_entity.dart';
import 'package:flutter_litera/features/transaction/presentation/pages/booking_success_page.dart';
import 'package:flutter_litera/features/transaction/presentation/pages/history_page.dart';
import 'package:flutter_litera/features/transaction/presentation/pages/rental_order_page.dart';
import 'package:flutter_litera/features/transaction/presentation/pages/transaction_detail_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    debugLogDiagnostics: true,

    redirect: (context, state) {
      final authState = context.read<AuthBloc>().state;

      final bool isLoggedIn = authState.maybeWhen(
        authenticated: (user, source) => true,
        orElse: () => false,
      );

      final isGoingToAuth =
          state.matchedLocation == '/login' ||
          state.matchedLocation == '/register' ||
          state.matchedLocation == '/';

      if (!isLoggedIn && !isGoingToAuth) {
        return '/login';
      }

      if (isLoggedIn) {
        final user = authState.maybeWhen(
          authenticated: (user, source) => user,
          orElse: () => null,
        );

        final isGoingToAdmin = state.matchedLocation.startsWith('/admin');

        if (isGoingToAdmin && user != null && user.role != 'admin') {
          return '/home';
        }
      }

      return null;
    },

    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashPage()),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/hub-selection',
        name: 'hub-selection',
        builder: (context, state) {
          final isEditMode = state.extra as bool? ?? false;
          return HubSelectionPage(isEditMode: isEditMode);
        },
      ),
      GoRoute(
        path: '/register',
        name: 'register',
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: '/book-detail',
        name: 'book-detail',
        builder: (context, state) {
          final book = state.extra as BookEntity;
          return BookDetailPage(book: book);
        },
      ),
      GoRoute(
        path: '/rental-order',
        name: 'rental-order',
        builder: (context, state) {
          final book = state.extra as BookEntity;
          return RentalOrderPage(book: book);
        },
      ),
      GoRoute(
        path: '/booking-success',
        name: 'booking-success',
        builder: (context, state) {
          final code = state.extra as String;
          return BookingSuccessPage(pickupCode: code);
        },
      ),
      GoRoute(
        path: '/transaction-detail',
        name: 'transaction-detail',
        builder: (context, state) {
          final transaction = state.extra as TransactionEntity;
          return TransactionDetailPage(transaction: transaction);
        },
      ),
      GoRoute(
        path: '/promo-detail',
        name: 'promo-detail',
        builder: (context, state) {
          final banner = state.extra as BannerEntity;
          return HomeBannerDetailPage(banner: banner);
        },
      ),

      // 👮 ADMIN ROUTES
      GoRoute(
        path: '/admin',
        name: 'admin',
        builder: (context, state) => const AdminDashboardPage(),
      ),
      GoRoute(
        path: '/admin/hub',
        name: 'admin-hub',
        builder: (context, state) => const AdminHubPage(),
      ),
      GoRoute(
        path: '/admin/price',
        name: 'admin-price',
        builder: (context, state) => const AdminPricePage(),
      ),

      // 🏠 USER ROUTES (Shell Route)
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainPage(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                name: 'home',
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/search',
                name: 'search',
                builder: (context, state) => const SearchPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/history',
                name: 'history',
                builder: (context, state) => const HistoryPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                name: 'profile',
                builder: (context, state) => const ProfilePage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

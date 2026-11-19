import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'main_page.dart';
import '../bloc/auth/auth_bloc.dart';
import '../resource/remote/auth_remote_resource.dart';
import '../resource/local/auth_local_resource.dart';
import '../page/auth/login_page.dart';
import '../page/auth/register_page.dart';
import '../page/midtrans/midtrans_payment_page.dart';

class AppRouter {
  late final GoRouter router;

  AppRouter() {
    router = GoRouter(
      initialLocation: '/',
      redirect: (context, state) async {
        final token = await AuthLocalResource.getToken();
        final isLoggedIn = token != null;

        final isGoingToAuth = state.matchedLocation == '/login' ||
            state.matchedLocation == '/register';

        if (!isLoggedIn && !isGoingToAuth) {
          return '/login';
        }

        if (isLoggedIn && isGoingToAuth) {
          return '/';
        }

        return null;
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const MainPage(),
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => BlocProvider(
            create: (context) => AuthBloc(AuthRemoteResource()),
            child: const LoginPage(),
          ),
        ),
        GoRoute(
          path: '/register',
          builder: (context, state) => BlocProvider(
            create: (context) => AuthBloc(AuthRemoteResource()),
            child: const RegisterPage(),
          ),
        ),
        GoRoute(
          path: '/midtransPayment/:snapToken',
          builder: (context, state) {
            final snapToken = state.pathParameters['snapToken'] ?? '';
            return MidtransPaymentPage(snapToken: snapToken);
          },
        ),
      ],
    );
  }
}
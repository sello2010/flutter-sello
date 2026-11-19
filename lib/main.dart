import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'bloc/cart/cart_bloc.dart';
import 'core/app_router.dart';
import 'core/constants/app_config.dart';
import 'resource/remote/cart_remote_resource.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Dio(BaseOptions(baseUrl: AppConfig.apiPath));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter appRouter = AppRouter();

  /// Dipakai untuk menampilkan snackbar dari mana saja (mis. setelah produk
  /// disimpan ke keranjang), tanpa peduli halaman mana yang sedang terbuka.
  final GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    // CartBloc dipasang di atas MaterialApp supaya bisa dipakai bersama oleh
    // kartu produk, halaman detail produk, dan halaman keranjang.
    return BlocProvider(
      create: (_) => CartBloc(CartRemoteResource()),
      child: BlocListener<CartBloc, CartState>(
        listener: (context, state) {
          final messenger = messengerKey.currentState;
          if (messenger == null) return;

          if (state is CartStored) {
            messenger
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.green,
                ),
              );
          } else if (state is CartError) {
            messenger
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
          }
        },
        child: MaterialApp.router(
          title: 'Flutter Foodstore',
          debugShowCheckedModeBanner: false,
          scaffoldMessengerKey: messengerKey,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
            useMaterial3: true,
          ),
          routerConfig: appRouter.router,
        ),
      ),
    );
  }
}
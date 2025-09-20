// lib/main.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'home_page.dart';
import 'detail_page.dart';
import 'widgets_demo_screen.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'home',
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          name: 'detail',
          path: 'detail/:id',
          builder: (context, state) {
          final id = state.pathParameters['id'] ?? '0';
          final from = state.queryParameters['from'] ?? 'unknown';

            return DetailPage(id: id, from: from);
          },
        ),
        GoRoute(
          name: 'widgets',
          path: 'widgets',
          builder: (context, state) => WidgetsDemoScreen(),
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Taller 1 Flutter - Integrado',
      routerConfig: _router,
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
    );
  }
}

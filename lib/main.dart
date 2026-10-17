import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter _router = GoRouter(
  initialLocation: '/',
  errorBuilder: (context, state) => const NotFoundScreen(),
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/settings',
      name: 'settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: '/item/:id',
      name: 'item',
      builder: (context, state) {
        final String id = state.pathParameters['id'] ?? '0';
        return ItemScreen(itemId: id);
      },
    ),
  ],
);

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('go_router Named Routes')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => context.goNamed('settings'),
              child: const Text('Go to Settings'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => context.goNamed(
                'item',
                pathParameters: {'id': '42'},
              ),
              child: const Text('Go to Item #42'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => context.go('/does-not-exist'),
              child: const Text('Test 404 Not Found Page'),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.goNamed('home'),
          child: const Text('Back to Home'),
        ),
      ),
    );
  }
}

class ItemScreen extends StatelessWidget {
  final String itemId;

  const ItemScreen({super.key, required this.itemId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Item Details ($itemId)')),
      body: Center(
        child: Text(
          'Viewing Item ID: $itemId',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Error 404')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              '404 - Page Not Found!',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.goNamed('home'),
              child: const Text('Go Back Home'),
            ),
          ],
        ),
      ),
    );
  }
}
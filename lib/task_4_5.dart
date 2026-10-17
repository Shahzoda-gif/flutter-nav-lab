import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const HomeRouteScreen(),
    },
    onGenerateRoute: (settings) {
      if (settings.name!.startsWith('/greet/')) {
        final uri = Uri.parse(settings.name!);
        final pathSegments = uri.pathSegments;
        
        if (pathSegments.length > 1) {
          final String name = pathSegments[1];
          return MaterialPageRoute(
            builder: (context) => GreetingDetailScreen(name: name),
            settings: settings,
          );
        }
      }
      return null;
    },
  ));
}

class HomeRouteScreen extends StatelessWidget {
  const HomeRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dynamic Routes (onGenerateRoute)')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Click a button to test dynamic routing:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/greet/Alice'),
              child: const Text('Greet Alice (/greet/Alice)'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/greet/Bob'),
              child: const Text('Greet Bob (/greet/Bob)'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/greet/Shahzoda'),
              child: const Text('Greet Shahzoda (/greet/Shahzoda)'),
            ),
          ],
        ),
      ),
    );
  }
}

class GreetingDetailScreen extends StatelessWidget {
  final String name;

  const GreetingDetailScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Greeting for $name')),
      body: Center(
        child: Text(
          'Hello, $name! Welcome via dynamic onGenerateRoute.',
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class AppRoutes {
  static const home = '/';
  static const profile = '/profile';
  static const messages = '/messages';
  static const about = '/about';
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (context) => const HomeScreen(),
        AppRoutes.profile: (context) => const ProfileScreen(),
        AppRoutes.messages: (context) => const MessagesScreen(),
        AppRoutes.about: (context) => const AboutScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person, color: Colors.blue),
            title: const Text('Profile'),
            subtitle: const Text('Go to profile screen'),
            onTap: () => Navigator.pushNamed(context, AppRoutes.profile),
          ),
          ListTile(
            leading: const Icon(Icons.message, color: Colors.green),
            title: const Text('Messages'),
            subtitle: const Text('Go to messages screen'),
            onTap: () => Navigator.pushNamed(context, AppRoutes.messages),
          ),
          ListTile(
            leading: const Icon(Icons.info, color: Colors.orange),
            title: const Text('About'),
            subtitle: const Text('Go to about screen'),
            onTap: () => Navigator.pushNamed(context, AppRoutes.about),
          ),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: const Center(
        child: Text('Welcome to Profile Screen!', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Messages')),
      body: const Center(
        child: Text('Welcome to Messages Screen!', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: const Center(
        child: Text('Welcome to About Screen!', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: LoginScreen()));

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Replaces Login with Home completely
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
          child: const Text('Sign in'),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        // Notice there is no back arrow here because login was replaced!
      ),
      body: const Center(
        child: Text('You cannot go back to login screen!'),
      ),
    );
  }
}
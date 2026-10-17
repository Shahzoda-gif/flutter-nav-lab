import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: HomeScreen()));

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home - Scale & Fade Transition')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open with scale and fade'),
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 400),
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const DetailsScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  final scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
                    CurvedAnimation(parent: animation, curve: Curves.easeInOut),
                  );

                  return FadeTransition(
                    opacity: animation,
                    child: ScaleTransition(
                      scale: scaleAnimation,
                      child: child,
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scale & Fade Details')),
      body: const Center(
        child: Text(
          'I scaled up from 80% and faded in simultaneously!',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
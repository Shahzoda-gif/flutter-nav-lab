import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: ScreenA()));

class ScreenA extends StatelessWidget {
  const ScreenA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen A'), backgroundColor: Colors.blue),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ScreenB()),
            );
          },
          child: const Text('Next to B'),
        ),
      ),
    );
  }
}

class ScreenB extends StatelessWidget {
  const ScreenB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen B'), backgroundColor: Colors.green),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ScreenC()),
            );
          },
          child: const Text('Next to C'),
        ),
      ),
    );
  }
}

class ScreenC extends StatelessWidget {
  const ScreenC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen C'), backgroundColor: Colors.orange),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context), // Goes back to B
          child: const Text('Back to B'),
        ),
      ),
    );
  }
}
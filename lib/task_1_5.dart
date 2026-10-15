import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: RootScreen()));

class BackOrExitButton extends StatelessWidget {
  const BackOrExitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final bool canPop = Navigator.canPop(context);

    return ElevatedButton(
      onPressed: canPop ? () => Navigator.pop(context) : null, 
      child: Text(canPop ? 'Back' : 'Nothing to go back to'),
    );
  }
}

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Root Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const BackOrExitButton(), 
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PushedScreen()),
                );
              },
              child: const Text('Open Pushed Screen'),
            ),
          ],
        ),
      ),
    );
  }
}

class PushedScreen extends StatelessWidget {
  const PushedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pushed Screen')),
      body: const Center(
        child: BackOrExitButton(), 
      ),
    );
  }
}
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: StepScreen(stepNumber: 1)));

class StepScreen extends StatelessWidget {
  final int stepNumber;
  const StepScreen({super.key, required this.stepNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Step $stepNumber')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (stepNumber < 4)
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StepScreen(stepNumber: stepNumber + 1),
                    ),
                  );
                },
                child: Text('Go to Step ${stepNumber + 1}'),
              ),
            const SizedBox(height: 16),
            if (stepNumber == 4)
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: const Text('Finish (Back to Step 1)'),
              ),
          ],
        ),
      ),
    );
  }
}
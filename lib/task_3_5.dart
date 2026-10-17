import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CounterHomeScreen(),
  ));
}

class CounterHomeScreen extends StatefulWidget {
  const CounterHomeScreen({super.key});

  @override
  State<CounterHomeScreen> createState() => _CounterHomeScreenState();
}

class _CounterHomeScreenState extends State<CounterHomeScreen> {
  int _counter = 10; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter Home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Current Counter Value:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              '$_counter',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                final int? updatedValue = await Navigator.push<int>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CounterEditorScreen(initialValue: _counter),
                  ),
                );

                if (updatedValue != null) {
                  setState(() {
                    _counter = updatedValue;
                  });
                }
              },
              child: const Text('Edit Counter'),
            ),
          ],
        ),
      ),
    );
  }
}

class CounterEditorScreen extends StatefulWidget {
  final int initialValue;

  const CounterEditorScreen({super.key, required this.initialValue});

  @override
  State<CounterEditorScreen> createState() => _CounterEditorScreenState();
}

class _CounterEditorScreenState extends State<CounterEditorScreen> {
  late int _editValue;

  @override
  void initState() {
    super.initState();
    _editValue = widget.initialValue;
  }

  void _increment() {
    setState(() {
      _editValue++;
    });
  }

  void _decrement() {
    setState(() {
      _editValue--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Counter')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_circle, size: 40, color: Colors.red),
                  onPressed: _decrement,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    '$_editValue',
                    style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add_circle, size: 40, color: Colors.green),
                  onPressed: _increment,
                ),
              ],
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                Navigator.pop(context, _editValue);
              },
              child: const Text('Save', style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
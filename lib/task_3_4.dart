import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ColorPickerHome(),
  ));
}
class ColorPickerHome extends StatefulWidget {
  const ColorPickerHome({super.key});

  @override
  State<ColorPickerHome> createState() => _ColorPickerHomeState();
}

class _ColorPickerHomeState extends State<ColorPickerHome> {

  Color _selectedColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pick a Color (Result Back)')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: _selectedColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black26, width: 2),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                final Color? returnedColor = await Navigator.push<Color>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ColorSelectionScreen(),
                  ),
                );

                if (returnedColor != null) {
                  setState(() {
                    _selectedColor = returnedColor;
                  });
                }
              },
              child: const Text('Choose colour'),
            ),
          ],
        ),
      ),
    );
  }
}

class ColorSelectionScreen extends StatelessWidget {
  const ColorSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select a Color')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                Navigator.pop(context, Colors.red);
              },
              child: const Text('Red', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                Navigator.pop(context, Colors.green);
              },
              child: const Text('Green', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                Navigator.pop(context, Colors.blue);
              },
              child: const Text('Blue', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
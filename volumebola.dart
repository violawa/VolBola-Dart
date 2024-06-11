import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Volume Bola Calculator'),
        ),
        body: VolumeBolaCalculator(),
      ),
    );
  }
}

class VolumeBolaCalculator extends StatefulWidget {
  @override
  _VolumeBolaCalculatorState createState() => _VolumeBolaCalculatorState();
}

class _VolumeBolaCalculatorState extends State<VolumeBolaCalculator> {
  final TextEditingController _radiusController = TextEditingController();
  double _volume = 0.0;

  void _calculateVolume() {
    double radius = double.parse(_radiusController.text);
    setState(() {
      _volume = (4 / 3) * 3.14159 * radius * radius * radius;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _radiusController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Masukkan Jari-jari Bola',
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _calculateVolume,
            child: Text('Hitung Volume'),
          ),
          SizedBox(height: 20),
          Text(
            'Volume Bola: $_volume',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _radiusController.dispose();
    super.dispose();
  }
}

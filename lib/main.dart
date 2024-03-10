import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'INPUT CHIP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _chipList = ['Chip 1', 'Chip 2', 'Chip 3'];
  final List<bool> _isSelected = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children: List<Widget>.generate(_chipList.length, (int index) {
            return InputChip(
              elevation: 8,
              pressElevation: 16,
              backgroundColor: Colors.red,
              selectedColor: Colors.green,
              deleteIconColor: Colors.white,
              showCheckmark: true,
              checkmarkColor: Colors.white,
              label: Text(_chipList[index], style: const TextStyle(color: Colors.white),),
              selected: _isSelected[index],
              onSelected: (bool value) {
                setState(() {
                  _isSelected[index] = value;
                });
              },
              onDeleted: () {
                setState(() {
                  _chipList.removeAt(index);
                  _isSelected.removeAt(index);
                });
              },
            );
          }),
        ),
      ),
    );
  }
}

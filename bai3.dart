import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bài 3 đổi màu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeScreen(),
    );
  }
}

class ChangeScreen extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ChangeScreen> {
  Color colorCode = Colors.white;

  void generateRandomColor() {
    setState(() {
      colorCode = _getRandomColor();
    });
  }

  Color _getRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorCode,
      appBar: AppBar(title: Text('Bài tập')),
      body: Center(
        child: Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: ElevatedButton(
            onPressed: () => generateRandomColor(),
            child: Text('Nhấn để đổi màu hình nền!'),
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              padding: EdgeInsets.all(12),
            ),
          ),
        ),
      ),
    );
  }
}

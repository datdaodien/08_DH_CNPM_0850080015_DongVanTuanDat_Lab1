import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  TextEditingController _number1Controller = TextEditingController();
  TextEditingController _number2Controller = TextEditingController();
  int _result = 0;

  @override
  void dispose() {
    _number1Controller.dispose();
    _number2Controller.dispose();
    super.dispose();
  }

  void _calculate(Operation operation) {
    int number1 = int.tryParse(_number1Controller.text) ?? 0;
    int number2 = int.tryParse(_number2Controller.text) ?? 0;

    setState(() {
      switch (operation) {
        case Operation.add:
          _result = number1 + number2;
          break;
        case Operation.subtract:
          _result = number1 - number2;
          break;
        case Operation.multiply:
          _result = number1 * number2;
          break;
        case Operation.divide:
          if (number2 != 0) {
            _result = number1 ~/ number2;
          } else {
            _result = 0;
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          width: 390,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hình ảnh casio sẽ xuất hiện có internet',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Image.network(
                'https://product.hstatic.net/1000362139/product/fx580_den1_bca17ba9021c43049de5b55785323600.png',
                width: 300,
                fit: BoxFit.contain,
              ),
              // SizedBox(height:   20),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //children: [
              Padding(
                padding: const EdgeInsets.only(left: 100, right: 100),
                child: Flexible(
                  child: TextField(
                    controller: _number1Controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Nhập số a:',
                        labelStyle: TextStyle(fontSize: 20)

                    ),
                  ),
                ),
              ),
              //SizedBox(width: 100),

              Padding(
                padding: const EdgeInsets.only(left: 100, right: 100),
                child: Flexible(
                  child: TextField(
                    controller: _number2Controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Nhập số b:',
                        labelStyle: TextStyle(fontSize: 20)
                    ),
                  ),
                ),
              ),
              // ],
              // ),

              SizedBox(height: 20),
              Text(
                'Kết quả: $_result',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => _calculate(Operation.add),
                    child: Text('+'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        textStyle: TextStyle(fontSize: 25)
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _calculate(Operation.subtract),
                    child: Text('-'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        textStyle: TextStyle(fontSize: 25)
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _calculate(Operation.multiply),
                    child: Text('x'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        textStyle: TextStyle(fontSize: 25)
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _calculate(Operation.divide),
                    child: Text('/'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        textStyle: TextStyle(fontSize: 25)
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum Operation {
  add,
  subtract,
  multiply,
  divide,
}
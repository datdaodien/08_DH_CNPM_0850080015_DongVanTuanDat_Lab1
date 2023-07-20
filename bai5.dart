import 'dart:ffi';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'bài 5 Kiem tra so nguyen to';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  late String numString;
  int num = 0;
  bool numberEntered = false;
  bool numIsPrime = false;

  bool _isPrime(int n) {
    int i;
    bool numIsPrime = true;
    if (n == 0 || n == 1) {
      numIsPrime = false;
    } else {
      for (i = 2; i <= n / 2; i++) {
        if (n % i == 0) {
          numIsPrime = false;
          break;
        }
      }
    }
    return numIsPrime;
  }

  void _setNum() {
    setState(() {
      num = int.parse(numString);
      numberEntered = true;
      numIsPrime = _isPrime(num);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 33, vertical: 20),
          child: new TextField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: new InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Nhập số',
            ),
            onChanged: (value) => {numString = value, numberEntered = false},
          ),
        ),
        Center(
            child: ElevatedButton(
              onPressed: _setNum,
              child: Text('Kiem tra'),
            )),
        Container(
            padding: EdgeInsets.only(top: 25),
            child: Text((() {
              if (numberEntered) {
                if (numIsPrime) {
                  return "Đây là số nguyên tố";
                } else {
                  return "Đây không là số nguyên tố";
                }
              }
              return "Không có số nhập vào";
            })()))
        ,
      ],
    );
  }
}

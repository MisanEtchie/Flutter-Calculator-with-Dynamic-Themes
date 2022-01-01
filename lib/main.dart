import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  //the calculator button
  Widget CalculatorButton(
    String text,
    int fillcolor,
    int textcolor,
    double textsize, //Function callback
  ) {
    return Container(
      margin: EdgeInsets.all(8),
      child: SizedBox(
        width: 80,
        height: 80,
        child: TextButton(
          onPressed: () {},
          child: Text(
            text,
            style: TextStyle(
              color: Color(textcolor),
              fontSize: textsize,
            ),
          ),
          style: TextButton.styleFrom(
            shape: CircleBorder(),
            backgroundColor: Color(fillcolor),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator App",
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Calculator App",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Center(
          child: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton("AC", 0xFF9E9E9E, 0xFFFFFFFF, 30),
                  CalculatorButton("C", 0xFF9E9E9E, 0xFFFFFFFF, 30),
                  CalculatorButton("←", 0xFFFFA000, 0xFFFFFFFF, 30),
                  CalculatorButton("÷", 0xFFFFA000, 0xFFFFFFFF, 30),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton("9", 0xFFEEEEEE, 0xFF000000, 30),
                  CalculatorButton("8", 0xFFEEEEEE, 0xFF000000, 30),
                  CalculatorButton("7", 0xFFEEEEEE, 0xFF000000, 30),
                  CalculatorButton("X", 0xFFFFA000, 0xFFFFFFFF, 30),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton("6", 0xFFEEEEEE, 0xFF000000, 30),
                  CalculatorButton("5", 0xFFEEEEEE, 0xFF000000, 30),
                  CalculatorButton("4", 0xFFEEEEEE, 0xFF000000, 30),
                  CalculatorButton("–", 0xFFFFA000, 0xFFFFFFFF, 30),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton("3", 0xFFEEEEEE, 0xFF000000, 30),
                  CalculatorButton("2", 0xFFEEEEEE, 0xFF000000, 30),
                  CalculatorButton("1", 0xFFEEEEEE, 0xFF000000, 30),
                  CalculatorButton("+", 0xFFFFA000, 0xFFFFFFFF, 30),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton("+/-", 0xFFEEEEEE, 0xFF000000, 30),
                  CalculatorButton("0", 0xFFEEEEEE, 0xFF000000, 30),
                  CalculatorButton("00", 0xFFEEEEEE, 0xFF000000, 30),
                  CalculatorButton("=", 0xFFFFA000, 0xFFFFFFFF, 30),
                ],
              ),
            ],
          )),
        ),
      ),
    );
  }
}

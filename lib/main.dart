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
  late double firstNum;
  late double secondNum;
  late String history = '';
  late String textToDisplay = '';
  late String res;
  late String operation;

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
          onPressed: () {
            print(text);
            if (text == "AC") {
              textToDisplay = '';
              firstNum = 0;
              secondNum = 0;
              res = '';
              history = '';
            } else if (text == 'C') {
              textToDisplay = '';
              firstNum = 0;
              secondNum = 0;
              res = '';
            } else if (text == '+/-') {
              if (textToDisplay[0] != '-') {
                res = '-' + textToDisplay;
              } else {
                res = textToDisplay.substring(0);
              }
            } else if (text == '←') {
              res = textToDisplay.substring(0, textToDisplay.length - 1);
            } else if (text == '+' ||
                text == '–' ||
                text == '✕' ||
                text == '÷ ') {
              firstNum = double.parse(textToDisplay);
              res = '';
              operation = text;
            } else if (text == '=') {
              secondNum = double.parse(textToDisplay);
              if (operation == '+') {
                res = (firstNum + secondNum).toString();
                history = firstNum.toString() +
                    operation.toString() +
                    secondNum.toString();
              }
              if (operation == '–') {
                res = (firstNum - secondNum).toString();
                history = firstNum.toString() +
                    operation.toString() +
                    secondNum.toString();
              }
              if (operation == '✕') {
                res = (firstNum * secondNum).toString();
                history = firstNum.toString() +
                    operation.toString() +
                    secondNum.toString();
              }
              if (operation == '÷') {
                res = (firstNum / secondNum).toString();
                history = firstNum.toString() +
                    operation.toString() +
                    secondNum.toString();
              }
            } else {
              //res = int.parse(textToDisplay + text).toString();
              res = double.parse(textToDisplay + text).toString();
            }

            setState(() {
              textToDisplay = res;
            });
          },
          child: Text(
            text,
            style: TextStyle(
              color: Color(textcolor),
              fontSize: textsize,
              fontWeight: FontWeight.bold,
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
              Container(
                alignment: Alignment(1.0, 1.0),
                child: Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Text(
                    history,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment(1.0, 1.0),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    textToDisplay,
                    style: TextStyle(fontSize: 60),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton("AC", 0xFF9E9E9E, 0xFFFFFFFF, 30),
                  CalculatorButton("C", 0xFF9E9E9E, 0xFFFFFFFF, 30),
                  CalculatorButton("←", 0xFFFFA000, 0xFFFFFFFF, 30),
                  CalculatorButton("÷", 0xFFFFA000, 0xFFFFFFFF, 35),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton("9", 0xFFEEEEEE, 0xFF000000, 30),
                  CalculatorButton("8", 0xFFEEEEEE, 0xFF000000, 30),
                  CalculatorButton("7", 0xFFEEEEEE, 0xFF000000, 30),
                  CalculatorButton("✕", 0xFFFFA000, 0xFFFFFFFF, 30),
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

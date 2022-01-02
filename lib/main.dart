import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/widgets.dart';

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

  //parameters for theme change
  late int number = 5;
  late int dynamictextcolor = 0;
  late int dynamicbgcolor = 0;
  late int dynamictextcolor2 = 0;
  late int dynamicopcolor = 0;
  late int dynamicupcolor = 0;
  late int dynamicdowncolor = 0;

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
                text == '÷') {
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
            } else if (text == '0') {
              if (double.parse(textToDisplay) % 1 == 0) {
                double x;
                x = double.parse(textToDisplay);
                x = x * 10;
                textToDisplay = x.toString();
              } else {
                res = double.parse(textToDisplay + '0').toString();
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
        backgroundColor: Color(dynamicbgcolor),
        appBar: AppBar(
          title: Text(
            "Calculator",
            style: TextStyle(color: Color(dynamictextcolor)),
          ),
          backgroundColor: Color(dynamicbgcolor),
          elevation: 0,
          actions: [
            //icon button to genearte random theme
            IconButton(
              onPressed: () {
                number++;
                if (number == 0) {
                  // deafualt
                  dynamicbgcolor = 0xFFFFFFFFF;
                  dynamicdowncolor = 0xFFEEEEEE;
                  dynamicopcolor = 0xFFFFA000;
                  dynamictextcolor = 0xFF000000;
                  dynamictextcolor2 = 0xFF000000;
                  dynamicupcolor = 0xFF9E9E9E;
                } else if (number == 1) {
                  // default again -- but plaeholder cause it never loads the first one
                  dynamicbgcolor = 0xFFFFFFFFF;
                  dynamicdowncolor = 0xFFEEEEEE;
                  dynamicopcolor = 0xFFFFA000;
                  dynamictextcolor = 0xFF000000;
                  dynamictextcolor2 = 0xFF000000;
                  dynamicupcolor = 0xFF9E9E9E;
                } else if (number == 2) {
                  //teal – dark theme
                  dynamicbgcolor = 0xFF282828;
                  dynamicdowncolor = 0x22FFFFFF;
                  dynamicopcolor = 0xFF90C2E7;
                  dynamictextcolor = 0xFFFFFFFF;
                  dynamictextcolor2 = 0xFFFFFFFF;
                  dynamicupcolor = 0x554E8098;
                } else if (number == 3) {
                  //army green – dark theme
                  dynamicbgcolor = 0xFF1E2F23;
                  dynamicdowncolor = 0xFFFFFFFF;
                  dynamicopcolor = 0xFF34623F;
                  dynamictextcolor = 0xFFFFFFFF;
                  dynamictextcolor2 = 0xFF000000;
                  dynamicupcolor = 0x5534623F;
                } else if (number == 4) {
                  //pink
                  dynamicbgcolor = 0xFFFFFFFF;
                  dynamicdowncolor = 0xFFEEEEEE;
                  dynamicopcolor = 0xFFEACBD2;
                  dynamictextcolor = 0xFF000000;
                  dynamictextcolor2 = 0xFF000000;
                  dynamicupcolor = 0xFFd495a3;
                } else if (number == 5) {
                  //light blue
                  dynamicbgcolor = 0xFFCAF0F8;
                  dynamicdowncolor = 0xFFFFFFFF;
                  dynamicopcolor = 0xFF0077B6;
                  dynamictextcolor = 0xFF000000;
                  dynamictextcolor2 = 0xFF000000;
                  dynamicupcolor = 0xFF903045E;
                } else if (number == 6) {
                  number = 0;
                }
                print(number);
                setState(() {});
              },
              icon: Icon(
                Icons.palette,
                color: Color(dynamictextcolor),
              ),
            ),
          ],
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
                      color: Color(dynamictextcolor),
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
                    style:
                        TextStyle(fontSize: 60, color: Color(dynamictextcolor)),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton("AC", dynamicupcolor, 0xFFFFFFFF, 30),
                  CalculatorButton("C", dynamicupcolor, 0xFFFFFFFF, 30),
                  CalculatorButton("←", dynamicopcolor, 0xFFFFFFFF, 30),
                  CalculatorButton("÷", dynamicopcolor, 0xFFFFFFFF, 35),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                      "9", dynamicdowncolor, dynamictextcolor2, 30),
                  CalculatorButton(
                      "8", dynamicdowncolor, dynamictextcolor2, 30),
                  CalculatorButton(
                      "7", dynamicdowncolor, dynamictextcolor2, 30),
                  CalculatorButton("✕", dynamicopcolor, 0xFFFFFFFF, 30),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                      "6", dynamicdowncolor, dynamictextcolor2, 30),
                  CalculatorButton(
                      "5", dynamicdowncolor, dynamictextcolor2, 30),
                  CalculatorButton(
                      "4", dynamicdowncolor, dynamictextcolor2, 30),
                  CalculatorButton("–", dynamicopcolor, 0xFFFFFFFF, 30),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                      "3", dynamicdowncolor, dynamictextcolor2, 30),
                  CalculatorButton(
                      "2", dynamicdowncolor, dynamictextcolor2, 30),
                  CalculatorButton(
                      "1", dynamicdowncolor, dynamictextcolor2, 30),
                  CalculatorButton("+", dynamicopcolor, 0xFFFFFFFF, 30),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                      "+/-", dynamicdowncolor, dynamictextcolor2, 30),
                  CalculatorButton(
                      "0", dynamicdowncolor, dynamictextcolor2, 30),
                  CalculatorButton(
                      "00", dynamicdowncolor, dynamictextcolor2, 30),
                  CalculatorButton("=", dynamicopcolor, 0xFFFFFFFF, 30),
                ],
              ),
            ],
          )),
        ),
      ),
    );
  }
}

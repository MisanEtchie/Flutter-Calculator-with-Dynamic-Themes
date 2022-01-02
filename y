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
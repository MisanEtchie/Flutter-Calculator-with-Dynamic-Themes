else if (text == '=') {
              secondNum = int.parse(textToDisplay);
              if (firstNum % 1 != 0) {
                if (operation == '+') {
                  res = (firstNum + secondNum.toDouble()).toString();
                  history = firstNum.toString() +
                      operation.toString() +
                      secondNum.toString();
                }
                if (operation == '–') {
                  res = (firstNum - secondNum.toDouble()).toString();
                  history = firstNum.toString() +
                      operation.toString() +
                      secondNum.toString();
                }
                if (operation == '✕') {
                  res = (firstNum * secondNum.toDouble()).toString();
                  history = firstNum.toString() +
                      operation.toString() +
                      secondNum.toString();
                }
                if (operation == '÷') {
                  res = (firstNum / secondNum.toDouble()).toString();
                  history = firstNum.toString() +
                      operation.toString() +
                      secondNum.toString();
                }
              }



              
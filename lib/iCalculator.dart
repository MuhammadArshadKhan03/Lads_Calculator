import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_expressions/math_expressions.dart';

class SimpleCalculator extends StatefulWidget {
  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String equation = " ";
  String result = " ";
  String expression = "";
  double equationFontSize = 20.0;
  double resultFontSize = 48.0;
  Color resltColor = Colors.white;
  buttonPress(String buttonText) {
    switch (buttonText) {
      case "C":
        setState(() {
          equation = " ";
          result = " ";
          equationFontSize = 20.0;
          resultFontSize = 48.0;
        });
        break;
      case "AC":
        setState(() {
          equation = " ";
          result = " ";
          equationFontSize = 20.0;
          resultFontSize = 48.0;
        });
        break;
      case ".":
        setState(() {
          if (!equation.toString().contains(".")) {
            equation = equation.toString() + ".";
          } else if (equation.contains("+") ||
              equation.contains("-") ||
              equation.contains("×") ||
              equation.contains("÷")) {
            equation += ".";
            equation = equation.replaceAll("..", ".");
            if (equation.contains(".3.")) {}
          } else {
            equation = equation.toString();
          }
        });
        break;
      case "⌫":
        setState(() {
          equationFontSize = 48.0;
          resultFontSize = 38.0;
          equation = equation.substring(0, equation.length - 1);
          if (equation == "") {
            equation = " ";
          }
        });
        break;
      case "+/-":
        setState(() {
          if (equation[0] == '-')
            equation = equation.substring(1);
          else
            equation = "-" + "$equation";
        });
        break;
      case "=":
        setState(() {
          resltColor = Colors.white;
          expression = equation;
          expression = expression.replaceAll("×", "*");
          expression = expression.replaceAll("÷", "/");

          try {
            Parser p = Parser();
            Expression exp = p.parse(expression);

            ContextModel cm = ContextModel();
            result = "${exp.evaluate(EvaluationType.REAL, cm)}";
            var spilt = result.split(".");
            if (spilt[1] == '0') {
              result = spilt[0];
              result = "= " + result;
              equation = " ";
            } else {
              result = (double.parse(result).toStringAsFixed(1)).toString();

              return result = "= " + result;
            }
          } catch (e) {
            result = "Error";
          }
        });
        break;
      default:
        {
          setState(() {
            if (equation == " ") {
              equation = buttonText;
            } else {
              int last = equation.length - 1;
              if (buttonText == '+' ||
                  buttonText == '-' ||
                  buttonText == '×' ||
                  buttonText == '÷' ||
                  buttonText == '%') {
                if (equation[last] == '+' ||
                    equation[last] == '-' ||
                    equation[last] == '×' ||
                    equation[last] == '÷' ||
                    equation[last] == '%') {
                } else {
                  equation = equation + buttonText;
                }
              } else {
                equation = equation + buttonText;
                if (equation.contains("+") ||
                    equation.contains("÷") ||
                    equation.contains("×") ||
                    equation.contains("-")) {
                  expression = equation;
                  expression = expression.replaceAll("×", "*");
                  expression = expression.replaceAll("÷", "/");
                  Parser p = Parser();
                  Expression exp = p.parse(expression);
                  ContextModel cm = ContextModel();
                  result = "${exp.evaluate(EvaluationType.REAL, cm)}";
                  var spilt = result.split(".");
                  if (spilt[1] == '0') {
                    result = spilt[0];
                    result = "= " + result;
                    resltColor = Colors.white54;
                  } else {
                    resltColor = Colors.white54;
                    result =
                        (double.parse(result).toStringAsFixed(1)).toString();
                    return result = "= " + result;
                  }
                }
              }
            }
          });
          // setState(() {
          //   RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
          //   Function mathFunc = (Match match) => '${match[1]},';
          //   String resultt = result.replaceAllMapped(reg, mathFunc);
          //   result = resultt;
          //   print('$equation --------======> $resultt');
          // });
        }
    }
  }
  // buttonPress(String buttonText) {
  //   setState(() {
  //     if (buttonText == "C" || buttonText == "AC") {
  //       equation = " ";
  //       result = " ";
  //       equationFontSize = 20.0;
  //       resultFontSize = 48.0;
  //     } else if (buttonText == ".") {
  //       if (!equation.toString().contains(".")) {
  //         equation = equation.toString() + ".";
  //       } else if (equation.contains("+") ||
  //           equation.contains("-") ||
  //           equation.contains("×") ||
  //           equation.contains("÷")) {
  //         equation += ".";
  //         equation = equation.replaceAll("..", ".");
  //         if (equation.contains(".3.")) {}
  //       } else {
  //         equation = equation.toString();
  //       }
  //     } else if (buttonText == "⌫") {
  //       equationFontSize = 48.0;
  //       resultFontSize = 38.0;
  //       equation = equation.substring(0, equation.length - 1);
  //       if (equation == "") {
  //         equation = " ";
  //       }
  //     } else if (buttonText == "+/-") {
  //       if (equation[0] == '-')
  //         equation = equation.substring(1);
  //       else
  //         equation = "-" + "$equation";
  //     } else if (buttonText == "=") {
  //       equationFontSize = 20.0;
  //       resultFontSize = 10.0;
  //
  //       expression = equation;
  //       expression = expression.replaceAll("×", "*");
  //       expression = expression.replaceAll("÷", "/");
  //
  //       try {
  //         Parser p = Parser();
  //         Expression exp = p.parse(expression);
  //
  //         ContextModel cm = ContextModel();
  //         result = "${exp.evaluate(EvaluationType.REAL, cm)}";
  //         var spilt = result.split(".");
  //         if (spilt[1] == '0') {
  //           result = spilt[0];
  //           result = "= " + result;
  //         } else {
  //           result = (double.parse(result).toStringAsFixed(1)).toString();
  //           return result = "= " + result;
  //         }
  //         // result = spilt[0];
  //
  //       } catch (e) {
  //         result = "Error";
  //       }
  //     } else {
  //       // if (result != ' ') {
  //       //   if (buttonText == '+' ||
  //       //       buttonText == '-' ||
  //       //       buttonText == '÷' ||
  //       //       buttonText == '×' ||
  //       //       buttonText == '%') {
  //       //     equation = result;
  //       //     var splt = equation.split('=');
  //       //     equation = splt[1];
  //       //     print("ye yahhaa hyyy");
  //       //     result = ' ';
  //       //   } else {
  //       //     equation = ' ';
  //       //     result = ' ';
  //       //   }
  //       // }
  //       equationFontSize = 20.0;
  //       resultFontSize = 38.0;
  //
  //       if (equation == " ") {
  //         equation = buttonText;
  //       } else {
  //         int last = equation.length - 1;
  //         if (buttonText == '+' ||
  //             buttonText == '-' ||
  //             buttonText == '×' ||
  //             buttonText == '÷' ||
  //             buttonText == '%') {
  //           if (equation[last] == '+' ||
  //               equation[last] == '-' ||
  //               equation[last] == '×' ||
  //               equation[last] == '÷' ||
  //               equation[last] == '%') {
  //             print("rrrrrrr$result");
  //           } else {
  //             equation = equation + buttonText;
  //           }
  //         } else {
  //           equation = equation + buttonText;
  //           if (equation.contains("+") ||
  //               equation.contains("÷") ||
  //               equation.contains("×") ||
  //               equation.contains("-")) {
  //             expression = equation;
  //             expression = expression.replaceAll("×", "*");
  //             expression = expression.replaceAll("÷", "/");
  //             Parser p = Parser();
  //             Expression exp = p.parse(expression);
  //             ContextModel cm = ContextModel();
  //             result = "${exp.evaluate(EvaluationType.REAL, cm)}";
  //             var spilt = result.split(".");
  //             if (spilt[1] == '0') {
  //               result = spilt[0];
  //               result = "= " + result;
  //             } else {
  //               return result = "= " + result;
  //             }
  //           }
  //         }
  //       }
  //     }
  //     // RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  //     // Function mathFunc = (Match match) => '${match[1]},';
  //     // //String test = equation;
  //     //
  //     // String resultt = result.replaceAllMapped(reg, mathFunc);
  //     // //String resultt = equation.replaceAll(reg, "$equation ,");
  //     // result = resultt;
  //     // //equation = (equation.length - 1).toString();
  //     // print('$equation -> $resultt');
  //   });
  // }

  _showScaffold(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.black.withOpacity(0.7),
        padding: EdgeInsets.only(left: 20.0),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(bottom: 20, left: 10, right: 10),
        elevation: 6.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.elliptical(60, 50)))));

    equationFontSize = 40.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Spacer(),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              equation,
              // equation.length > 3 ? equation = equation = "," : equation,
              style: TextStyle(
                  fontSize: equation.length >= 15
                      ? equationFontSize = 24
                      : equationFontSize = 40.0,
                  color: Colors.white),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              result,
              style: TextStyle(
                  fontSize: result.length > 15
                      ? resultFontSize = 25.0
                      : resultFontSize = 40.0,
                  color: resltColor),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 295.0, bottom: 10.0),
                child:
                    buildButton("⌫", 0.8, Colors.black, 0.8, 25, Colors.white),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton(equation == " " ? "AC" : "C", 1, Colors.grey.shade700,
                  1, 25, Colors.black),
              buildButton("+/-", 1, Colors.grey.shade700, 1, 25, Colors.black),
              buildButton("%", 1, Colors.grey.shade700, 1, 25, Colors.black),
              buildButton("÷", 1, Colors.orange, 1, 25, Colors.white),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton(
                  "7", 1, Colors.grey.withAlpha(45), 1, 25, Colors.white),
              buildButton(
                  "8", 1, Colors.grey.withAlpha(45), 1, 25, Colors.white),
              buildButton(
                  "9", 1, Colors.grey.withAlpha(45), 1, 25, Colors.white),
              buildButton("×", 1, Colors.orange, 1, 25, Colors.white),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton(
                  "4", 1, Colors.grey.withAlpha(45), 1, 25, Colors.white),
              buildButton(
                  "5", 1, Colors.grey.withAlpha(45), 1, 25, Colors.white),
              buildButton(
                  "6", 1, Colors.grey.withAlpha(45), 1, 25, Colors.white),
              buildButton("-", 1, Colors.orange, 1, 25, Colors.white),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton(
                  "1", 1, Colors.grey.withAlpha(45), 1, 25, Colors.white),
              buildButton(
                  "2", 1, Colors.grey.withAlpha(45), 1, 25, Colors.white),
              buildButton(
                  "3", 1, Colors.grey.withAlpha(45), 1, 25, Colors.white),
              buildButton("+", 1, Colors.orange, 1, 25, Colors.white),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                child: Container(
                  width: 68,
                  height: 68,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.all(Radius.circular(41.0)),
                  ),
                  child: Center(
                      child: Image.asset(
                    "assets/calculatorIcon.png",
                    color: Colors.white,
                    height: 35.0,
                  )),
                ),
                onTap: () {
                  final isPortrait = MediaQuery.of(context).orientation ==
                      Orientation.portrait;
                  print("presseddd");
                  if (isPortrait) {
                    print("Landscape");
                    setLandscape();
                  } else {
                    print("portrait");
                    setPortrait();
                    AssetImage("assets/calculatorIcon.png");
                  }
                },
              ),
              buildButton(
                  "0", 1, Colors.grey.withAlpha(45), 1, 25, Colors.white),
              buildButton(
                  ".", 1, Colors.grey.withAlpha(45), 1, 25, Colors.white),
              buildButton("=", 1, Colors.orange, 1, 25, Colors.white),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }

  Future setPortrait() async => await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

  Future setLandscape() async => await SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);

  Widget buildButton(String buttonText, double buttonHeight, Color buttonColor,
      double buttonWidth, double fontSize, Color fontColor) {
    return Container(
      height: MediaQuery.of(context).size.height * .09 * buttonHeight,
      width: MediaQuery.of(context).size.height * .09 * buttonWidth,
      //color: buttonColor,
      child: RaisedButton(
          color: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
          padding: EdgeInsets.all(12.0),
          onPressed: () => equation.length >= 25
              ? Text(
                  " ${buttonText.contains("C") || buttonText.contains("⌫") ? buttonPress(buttonText) : Text("aaa")} ,${_showScaffold(
                  "Sorry, Can't be added upto 25 Characters  :)",
                )} ")
              : buttonPress(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: fontColor,
            ),
          )),
    );
  }
}

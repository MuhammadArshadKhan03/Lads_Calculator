import 'dart:core';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:powers/powers.dart';
import 'package:scidart/numdart.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<int> mCalculateResult = [];
  String mPlus;
  String mMinus;
  String mResuslt;
  String equation = " ";
  String showEquation = " ";
  String result = " ";
  Color resltColor = Colors.white;
  String expression = "";
  double equationFontSize = 20.0;
  double resultFontSize = 40.0;
  String sinbtntext = "sin";
  String cosbtntext = "cos";
  String tanbtntext = "tan";
  String sinhbtntext = "sinh";
  String coshbtntext = "cosh";
  String tanhbtntext = "tanh";
  String tenpowX = "10ˣ";
  String log10 = "Log₁₀";
  String multi = "x";
  int a = 0;
  var c = 0;
  double ee = 0;
  double xx = 0;
  double div = 0;
  double fValueSqur = 0;
  Color clr = Colors.grey.withAlpha(35);
  String modeShow = "Deg";
  String radbtn = "Rad";
  var cleanresult = false;
  double Deg = 0;
  bool radin = false;
  String withOutEqual = "";

  double PI = 3.1415;
  double radianToDegree(double radian) {
    // return radian * 180 / PI;
  }

  void generateRandomNumber() {
    var random = new Random();

    // Printing Random Number between 1 to 100 on Terminal Window.
    print(random.nextDouble());
    equation = random.nextDouble().toString();
  }

  double sinh(double x) {
    var negate = false;
    if (x != x) {
      return x;
    }

    if (x > 20) {
      if (x >= 2147483647) {
        final t = expFast(0.5 * x);
        return (0.5 * t) * t;
      } else {
        return 0.5 * expFast(x);
      }
    } else if (x < -20) {
      if (x <= -2147483647) {
        final t = expFast(-0.5 * x);
        return (-0.5 * t) * t;
      } else {
        return -0.5 * expFast(-x);
      }
    }

    if (x == 0) {
      return x;
    }

    if (x < 0.0) {
      x = -x;
      negate = true;
    }

    double result1;

    if (x > 0.25) {
      final hiPrec = List<double>.filled(2, 0.0);
      expFast(x, 0.0, hiPrec);

      var ya = hiPrec[0] + hiPrec[1];
      var yb = -(ya - hiPrec[0] - hiPrec[1]);

      var temp = ya * 1073741824; //   HEX_40000000 =1073741824
      var yaa = ya + temp - temp;
      var yab = ya - yaa;

      var recip = 1.0 / ya;
      temp = recip * 1073741824; //   HEX_40000000 =1073741824
      var recipa = recip + temp - temp;
      var recipb = recip - recipa;

      recipb +=
          (1.0 - yaa * recipa - yaa * recipb - yab * recipa - yab * recipb) *
              recip;

      recipb += -yb * recip * recip;

      recipa = -recipa;
      recipb = -recipb;

      temp = ya + recipa;
      yb += -(temp - ya - recipa);
      ya = temp;
      temp = ya + recipb;
      yb += -(temp - ya - recipb);
      ya = temp;

      result1 = ya + yb;
      result1 *= 0.5;
      var v2;
      v2 = (2.0 / result1);
      equation = "sinh" + equation.toString();
      result = v2.toString();
      result = double.parse(result).toStringAsFixed(3);
      result = "=  " + result;
    } else {
      final hiPrec = List<double>.filled(2, 0.0);
      expm1(x, hiPrecOut: hiPrec);

      var ya = hiPrec[0] + hiPrec[1];
      var yb = -(ya - hiPrec[0] - hiPrec[1]);

      var denom = 1.0 + ya;
      var denomr = 1.0 / denom;
      var denomb = -(denom - 1.0 - ya) + yb;
      var ratio = ya * denomr;
      var temp = ratio * 1073741824; //   HEX_40000000 =1073741824
      var ra = ratio + temp - temp;
      var rb = ratio - ra;

      temp = denom * 1073741824; //   HEX_40000000 =1073741824
      var za = denom + temp - temp;
      var zb = denom - za;

      rb += (ya - za * ra - za * rb - zb * ra - zb * rb) * denomr;

      rb += yb * denomr; // numerator
      rb += -ya * denomb * denomr * denomr; // denominator

      temp = ya + ra;
      yb += -(temp - ya - ra);
      ya = temp;
      temp = ya + rb;
      yb += -(temp - ya - rb);
      ya = temp;

      result1 = ya + yb;
      result1 *= 0.5;
      var v2;
      v2 = (1.0 / result1);
      result = v2.toString();
    }

    if (negate) {
      var v2 = -result1;
      result1 = 1 / v2;
      result = result1.toString();
    }
    result = result1.toString();
    //result = "= " + result;
    result = double.parse(result).toStringAsFixed(3);
    return double.parse(' $result');
  }

  double cosh(double x) {
    if (x != x) {
      return x;
    }

    if (x > 20) {
      if (x >= 1073741824) {
        final t = expFast(0.5 * x);
        return (0.5 * t) * t;
      } else {
        return 0.5 * expFast(x);
      }
    } else if (x < -20) {
      if (x <= -1073741824) {
        final t = expFast(-0.5 * x);
        return (0.5 * t) * t;
      } else {
        return 0.5 * expFast(-x);
      }
    }

    final hiPrec = List<double>.filled(2, 0.0);
    if (x < 0.0) {
      x = -x;
    }
    expFast(x, 0.0, hiPrec);

    var ya = hiPrec[0] + hiPrec[1];
    var yb = -(ya - hiPrec[0] - hiPrec[1]);

    var temp = ya * 1073741824;
    var yaa = ya + temp - temp;
    var yab = ya - yaa;

    var recip = 1.0 / ya;
    temp = recip * 1073741824;
    var recipa = recip + temp - temp;
    var recipb = recip - recipa;

    recipb +=
        (1.0 - yaa * recipa - yaa * recipb - yab * recipa - yab * recipb) *
            recip;
    recipb += -yb * recip * recip;

    temp = ya + recipa;
    yb += -(temp - ya - recipa);
    ya = temp;
    temp = ya + recipb;
    yb += -(temp - ya - recipb);
    ya = temp;

    var result2 = ya + yb;
    var v2;
    result2 *= 0.5;
    result = result2.toString();
    result = double.parse(result).toStringAsFixed(3);
    return double.parse('$result');
  }

  double tanh(double angle) {
    if (angle > 19.1) {
      return 1.0;
    }

    if (angle < -19.1) {
      return -1.0;
    }

    var e1 = exp(angle);
    var e2 = exp(-angle);

    var v3 = ((e1 - e2) / (e1 + e2));

    result = v3.toString();
    result = double.parse(result).toStringAsFixed(3);
    return double.parse('$result');
  }

  // double sinnn(int opposite) {
  //   var v9 = sin(opposite);
  //   result = v9.toString();
  //   // final x = Angle.degrees(double.parse(result));
  //   // result = x.toString();
  //   //result = radianToDegree(double.parse(result)).toString();
  //   // print("deeeeeeeeeeeeeeee $Deg");
  //   result = double.parse(result).toStringAsFixed(3);
  //   return double.parse('$result');
  // }

  //double asinn(double opposite) {
  //print("Asin value is $opposite");
  //var v9 = asin(opposite);
  //print("Asin value is $v9");
  //result = v9.toString();
  //return double.parse('$result');
  //}

  // double acoss(double opposite) {
  //   var v9 = acos(opposite);
  //   result = v9.toString();
  //   result = double.parse(result).toStringAsFixed(3);
  //   return double.parse('$result');
  //   // return 5;
  // }
  //
  // double atann(double opposite) {
  //   var v9 = atan(opposite);
  //   result = v9.toString();
  //   result = double.parse(result).toStringAsFixed(3);
  //   return double.parse('$result');
  // }
  //
  double acosh(double value) {
    if (value.abs() >= 268435456.0) // 2^28, taken from freeBSD
      return log(value) + log(2.0);
    var v1;
    v1 = log(value + (sqrt(value - 1) * sqrt(value + 1)));
    result = v1.toString();
    result = double.parse(result).toStringAsFixed(3);
    return double.parse('$result');
  }

  double asinh(double value) {
    if (value.abs() >= 268435456.0) // 2^28, taken from freeBSD
      return value.sign * (log(value.abs()) + log(2.0));

    var v1 = value.sign * log(value.abs() + sqrt((value * value) + 1));

    result = v1.toString();
    result = double.parse(result).toStringAsFixed(3);
    return double.parse('$result');
  }

  double atanh(double value) {
    var v1;
    v1 = 0.5 * log((1 + value) / (1 - value));
    result = v1.toString();
    result = double.parse(result).toStringAsFixed(3);
    return double.parse('$result');
  }

  void find() {
    var fact = 1;
    for (var i = 2; i <= int.parse(equation); i++) {
      fact *= i;
    }
    equation = "$equation x!";
    result = fact.toString();
  }

  buttonPress(String buttonText) {
    // if (buttonText == "(") {
    //   if (!equation.contains("x", equation.length - 1) ||
    //       !equation.contains("-", equation.length - 1) ||
    //       !equation.contains("÷", equation.length - 1) ||
    //       !equation.contains("", equation.length - 1)) {
    //     buttonText = "x(";
    //   }
    // }
    setState(() {
      if (buttonText == "C" || buttonText == "AC") {
        equation = " ";
        result = " ";
        a = 0;
        c = 0;
        ee = 0.0;
        fValueSqur = 0.0;
        xx = 0.0;
        div = 0.0;
        showEquation = "0";
        equationFontSize = 20.0;
        resultFontSize = 34.0;
      } else if (buttonText == ".") {
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
      } else if (buttonText == "⌫") {
        equationFontSize = 20.0;
        resultFontSize = 34.0;
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = " ";
        }
      }
      // else if (buttonText == "x³") {
      //   print("THIS IS MY EQUATION $equation");
      //   int a;
      //   a = pow(int.parse('$equation'), 3);
      //   equation = "$equation³";
      //   result = a.toString();
      //   result = "= " + result;
      // } else if (buttonText == "x²") {
      //   a = pow(int.parse('$equation'), 2);
      //   equation = "$equation²";
      //   expression = a.toString();
      //   result = a.toString();
      //   result = "= " + result;
      // }
      else if (buttonText == "eˣ") {
        double a;
        a = pow(e, int.parse('$equation'));
        equation = "$equation eˣ";
        result = a.toString();
        result = "= " + result;
      }
      // else if (buttonText == "xʸ") {
      //   fValueSqur = double.parse('$equation');
      //   equation = " ";
      //   result = fValueSqur.toString();
      //   result = "= " + result;
      //   var spilt = result.split(".");
      //   if (spilt[1] == '0') {
      //     result = spilt[0];
      //     result = " ";
      //   }
      // }
      else if (buttonText == "10ˣ") {
        int a;
        a = pow(10, int.parse('$equation'));
        equation = "$equation 10ˣ";
        result = a.toString();
        result = "= " + result;
      } else if (buttonText == "2ˣ") {
        int a;
        a = pow(2, int.parse('$equation'));
        equation = "$equation 2ˣ";
        result = a.toString();
        result = "= " + result;
      } else if (buttonText == "e") {
        const double e = 2.72;
        if (equation != " ") {
          equation = equation + 2.72.toString();
          expression = equation;
          expression = expression.replaceAll("×", "*");
          expression = expression.replaceAll("÷", "/");
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = "${exp.evaluate(EvaluationType.REAL, cm)}";
          result = (double.parse(result).toStringAsFixed(2)).toString();
          resltColor = Colors.white54;
          result = "= " + result;
        } else {
          equation = e.toString();
          expression = equation;
          try {
            Parser p = Parser();
            Expression exp = p.parse(expression);
            ContextModel cm = ContextModel();
            result = "${exp.evaluate(EvaluationType.REAL, cm)}";
            result = (double.parse(result).toStringAsFixed(2)).toString();
            result = "= " + result;
          } catch (e) {
            result = "error";
          }
        }
      } else if (buttonText == "π") {
        const double pi = 3.14;
        if (equation != " ") {
          print("ssssssssss-$equation");
          equation = equation + 3.14.toString();
          print("ssssssssss-$equation");
          expression = equation;
          expression = expression.replaceAll("×", "*");
          expression = expression.replaceAll("÷", "/");
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = "${exp.evaluate(EvaluationType.REAL, cm)}";
          result = (double.parse(result).toStringAsFixed(2)).toString();
          resltColor = Colors.white54;
          result = "= " + result;
        } else {
          equation = pi.toString();
          expression = equation;
          try {
            Parser p = Parser();
            Expression exp = p.parse(expression);
            ContextModel cm = ContextModel();
            result = "${exp.evaluate(EvaluationType.REAL, cm)}";
            result = (double.parse(result).toStringAsFixed(2)).toString();
            result = "= " + result;
          } catch (e) {
            result = "error";
          }
        }
      }
      // else if (buttonText == "²√x") {
      //   double aa;
      //   aa = sqrt(int.parse('$equation'));
      //   equation = "²√$equation ";
      //   result = aa.toString();
      //   result = "= " + result;
      //   var spilt = result.split(".");
      //   if (spilt[1] == '0') {
      //     result = spilt[0];
      //   }
      // }
      // else if (buttonText == "³√y") {
      //   double b;
      //   b = pow(int.parse('$equation'), (1 / 3));
      //   equation = "³√$equation ";
      //   result = b.toString();
      //   if (equation.contains("64")) {
      //     var bar = double.parse(result);
      //     result = bar.roundToDouble().toString();
      //   } else
      //     result = "= " + result;
      //   var spilt = result.split(".");
      //   if (spilt[1] == '0') {
      //     result = spilt[0];
      //   }
      // }
      else if (buttonText == "³√x") {
        // var cuberoot = equation.isCube;
        print("helooooooooooo----------${double.parse(equation).cbrt()}");
        result = double.parse(equation).cbrt().toString();
        print(27.cbrt());
      } else if (buttonText == "¹/x") {
        double b;
        b = 1 / int.parse('$equation');
        equation = "¹/$equation ";
        result = b.toString();
        result = "= " + result;
      }
      // else if (buttonText == "ʸ√x") {
      //   c = int.parse(equation);
      //   equation = "";
      // }
      else if (buttonText == "Log₁₀") {
        String eq = equation;
        double log10(num eq) => log(eq) / log(10);
        result = log10(int.parse(eq)).toString();
        equation = "Log₁₀" + "(${equation})";
        result = "= " + result;
        var spilt = result.split(".");
        if (spilt[1] == '0') {
          result = spilt[0];
        }
      } else if (buttonText == "Log₂") {
        String eq = equation;
        double log2(num eq) => log(eq) / log(2);
        result = log2(int.parse(eq)).toString();
        equation = "Log₂" + "(${equation})";
        result = "= " + result;
        var spilt = result.split(".");
        if (spilt[1] == '0') {
          result = spilt[0];
        }
      } else if (buttonText == 'x!') {
        find();
      } else if (buttonText == "EE") {
        ee = double.parse(equation);
        equation = ' ';
      } else if (buttonText == "2nd") {
        setState(() {
          clr = clr == Colors.grey.withAlpha(35)
              ? Colors.grey.shade800
              : Colors.grey.withAlpha(35);
          sinbtntext = sinbtntext == "sin" ? 'sin⁻¹' : "sin";
          cosbtntext = cosbtntext == "cos" ? 'cos⁻¹' : "cos";
          tanbtntext = tanbtntext == "tan" ? 'tan⁻¹' : "tan";
          sinhbtntext = sinhbtntext == "sinh" ? 'sinh⁻¹' : "sinh";
          coshbtntext = coshbtntext == "cosh" ? 'cosh⁻¹' : "cosh";
          tanhbtntext = tanhbtntext == "tanh" ? 'tanh⁻¹' : "tanh";
          tenpowX = tenpowX == "10ˣ" ? '2ˣ' : "10ˣ";
          log10 = log10 == "Log₁₀" ? 'Log₂' : "Log₁₀";
        });
      } else if (buttonText == "Rad" || buttonText == "Deg") {
        if (buttonText == "Deg") {
          modeShow = "Deg";
          radbtn = "Rad";
        } else {
          modeShow = "Rad";
          radbtn = "Deg";
        }
      } else if (buttonText == "+/-") {
        if (equation[0] == '-')
          equation = equation.substring(1);
        else
          equation = "-" + "$equation";
      } else if (buttonText == "m+") {
        equation = ' ';
        if (result[0] == '-') {
          mPlus = result.substring(1);
          mCalculateResult.add(int.parse(mPlus));
        } else {
          mPlus = result;
          mCalculateResult.add(int.parse(result));
        }
      } else if (buttonText == "m-") {
        equation = ' ';
        if (result[0] == '-') {
          mMinus = result.substring(1);
          mCalculateResult.add(int.parse(mMinus));
        } else {
          mMinus = '-' + '$result';
          mCalculateResult.add(int.parse(mMinus));
        }
      } else if (buttonText == "mc") {
        mCalculateResult.clear();
      } else if (buttonText == "mr") {
        int rs = 0;
        for (int i = 0; i < mCalculateResult.length; i++)
          rs += mCalculateResult[i];
        result = rs.toString();
      } else if (buttonText == "Rand") {
        generateRandomNumber();
      } else if (buttonText == ".") {
        if (!equation.toString().contains(".")) {
          equation = equation.toString() + ".";
        }
        result = equation.toString();
      } else if (buttonText == "=") {
        equationFontSize = 20;
        resultFontSize = 45;
        resltColor = Colors.white;
        if (c != 0) {
          var d;
          print("squrot-----------------$equation");
          d = pow(c, (1 / double.parse(equation)));
          result = d.toString();
          //d = double.parse(d).round();
          equation = "${c.round()}√$equation";
          result = "= " + result;
          var spilt = result.split(".");
          if (spilt[1] == '0') {
            result = spilt[0];
          } else {
            result = result;
          }
        } else if (xx != 0) {
          String XX;
          XX = xx.toString() * int.parse(equation);
          equation = "$xx x $equation";
          result = XX.toString();
          result = "= " + result;
          var spilt = result.split(".");
          if (spilt[1] == '0') {
            result = spilt[0];
          }
        } else if (ee != 0) {
          var EE;
          EE = ee * pow(10, double.parse("$equation"));

          equation = "$ee EE $equation";
          result = EE.toString();
          result = "= " + result;
          var spilt = result.split(".");
          if (spilt[1] == '0') {
            result = spilt[0];
          }
        }
        // else if (fValueSqur != 0) {
        //   var nSqurValue;
        //   nSqurValue = pow(fValueSqur, double.parse(equation));
        //   equation = "$fValueSqur ^ $equation";
        //   result = nSqurValue.toString();
        //   result = "= " + result;
        //   var spilt = result.split(".");
        //   if (spilt[1] == '0') {
        //     result = spilt[0];
        //   }
        // }
        else if (equation.contains('sinh')) {
          if (equation[4] != '⁻') {
            var spilt = equation.split("h");
            String sinValue = spilt.last;
            result = "= " + sinh(double.parse(sinValue)).toString();
          } else {
            var split = equation.split("⁻¹");
            String sinValue = split.last;
            result = "= " + asinh(double.parse(sinValue)).toString();
          }
        } else if (equation.contains('cosh')) {
          if (equation[4] != '⁻') {
            var spilt = equation.split("h");
            String sinValue = spilt.last;
            result = "= " + cosh(double.parse(sinValue)).toString();
            //result = (double.parse(result).toStringAsFixed(2)).toString();
          } else {
            var split = equation.split("⁻¹");
            String sinValue = split.last;
            result = "= " + acosh(double.parse(sinValue)).toString();
          }
        } else if (equation.contains('tanh')) {
          if (equation[4] != '⁻') {
            var spilt = equation.split("h");
            String sinValue = spilt.last;
            result = tanh(double.parse(sinValue)).toString();
          } else {
            var split = equation.split("⁻¹");
            String sinValue = split.last;
            print("tanh⁻¹------------- $sinValue");
            result = atanh(double.parse(sinValue)).toString();
          }
        } else {
          equationFontSize = 10.0;
          resultFontSize = 40.0;
          if (modeShow == "Deg") {
            // if (
            //     // equation.contains("sin") ||
            //     equation.contains('cos') || equation.contains('tan')) {
            //   // if (equation.contains('sin')) {
            //   //   if (equation[3] != "⁻") {
            //   //     var split = equation.split('n');
            //   //
            //   //     var valueInDegree =
            //   //         ((int.parse(split.last)) * (3.14 / 180)).toString();
            //   //     print("spppppppppppp-----$valueInDegree");
            //   //     expression = 'sin' + valueInDegree;
            //   //   } else {
            //   //     // equation = equation.replaceAll("-", "");
            //   //     // print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> $equation");
            //   //     expression = equation.replaceAll("-", "");
            //   //   }
            //   // } else
            //   // if (equation.contains('cos')) {
            //   //   if (equation[3] != "⁻") {
            //   //     var split = equation.split('s');
            //   //
            //   //     var valueInDegree =
            //   //         ((int.parse(split.last)) * (3.14 / 180)).toString();
            //   //     expression = 'cos' + valueInDegree;
            //   //   } else {
            //   //     expression = equation.replaceAll("-", "");
            //   //   }
            //   // } else if (equation.contains('tan')) {
            //   //   if (equation[3] != "⁻") {
            //   //     var split = equation.split('n');
            //   //     var valueInDegree =
            //   //         ((int.parse(split.last)) * (3.14 / 180)).toString();
            //   //     expression = 'tan' + valueInDegree;
            //   //   } else {
            //   //     expression = equation.replaceAll("-", "");
            //   //   }
            //   // }
            //   expression = expression.replaceAll("×", "*");
            //   expression = expression.replaceAll("÷", "/");
            //   expression = expression.replaceAll("sin⁻¹", "arcsin");
            //   expression = expression.replaceAll("cos⁻¹", "arccos");
            //   expression = expression.replaceAll("tan⁻¹", "arctan");
            //
            //   try {
            //     Parser p = Parser();
            //     Expression exp = p.parse(expression);
            //     ContextModel cm = ContextModel();
            //     result = "${exp.evaluate(EvaluationType.REAL, cm)}";
            //     // if (equation.contains("⁻¹")) {
            //     //   result = (double.parse(result) * (180 / 3.14)).toString();
            //     //   if (equation.contains("sin⁻¹-1")) {
            //     //     //equation = "sin⁻¹-1";
            //     //     result = "-" + result;
            //     //     result = (double.parse(result).roundToDouble()).toString();
            //     //   } else if (equation.contains("cos⁻¹-1")) {
            //     //     result = "180";
            //     //     result = (double.parse(result).roundToDouble()).toString();
            //     //   } else if (equation.contains("tan⁻¹-1")) {
            //     //     result = "-" + result;
            //     //     result = (double.parse(result).roundToDouble()).toString();
            //     //   }
            //     //   result = (double.parse(result).roundToDouble()).toString();
            //     // }
            //     var spilt = result.split(".");
            //     if (spilt[1] == '0') {
            //       result = spilt[0];
            //       result = "= " + result;
            //     } else if (equation.endsWith("0") ||
            //         equation.endsWith("90") ||
            //         equation.endsWith("180") ||
            //         equation.endsWith("270") ||
            //         equation.endsWith("360")) {
            //       result = (double.parse(result).round()).toString();
            //       return result = "= " + result;
            //     } else {
            //       return result = "= " + result;
            //     }
            //   } catch (e) {
            //     result = "error";
            //   }
            // }
            //else
            {
              expression = equation.toString();
              if (buttonText == "(") {
                if (!equation.contains("x", equation.length - 1) ||
                    !equation.contains("-", equation.length - 1) ||
                    !equation.contains("÷", equation.length - 1) ||
                    !equation.contains("", equation.length - 1)) {
                  buttonText = "x(";
                }
              }

              expression = expression.replaceAll("×", "*");
              expression = expression.replaceAll("÷", "/");
              expression = expression.replaceAll("xʸ", "^");
              expression = expression.replaceAll("x²", "^2");
              expression = expression.replaceAll("x³", "^3");
              expression = expression.replaceAll("ʸ√x", "nrt");
              expression = expression.replaceAll("²√x", "sqrt");
              //expression = expression.replaceAll("³√x", "cbrt");
              expression = expression.replaceAll("sin⁻¹", "arcsin");
              expression = expression.replaceAll("cos⁻¹", "arccos");
              expression = expression.replaceAll("tan⁻¹", "arctan");

              print("this is equcation --- $expression");
              try {
                Parser p = Parser();
                Expression exp = p.parse(expression);
                ContextModel cm = ContextModel();
                result = "${exp.evaluate(EvaluationType.REAL, cm)}";

                print(
                    "Result----------------------> ${double.parse(result).round()}");
                if (equation.contains("⁻¹")) {
                  result = (double.parse(result) * (180 / 3.14)).toString();
                  if (equation.contains("sin⁻¹-1")) {
                    //equation = "sin⁻¹-1";
                    result = "-" + result;
                    result = (double.parse(result).roundToDouble()).toString();
                  } else if (equation.contains("cos⁻¹-1")) {
                    result = "180";
                    result = (double.parse(result).roundToDouble()).toString();
                  } else if (equation.contains("tan⁻¹-1")) {
                    result = "-" + result;
                    result = (double.parse(result).roundToDouble()).toString();
                  }
                  result = (double.parse(result).roundToDouble()).toString();
                }

                var spilt = result.split(".");
                equation = equation.replaceAll("ʸ√x", "√");
                //equation = equation.replaceAll("xʸ", "^");
                equation = equation.replaceAll("²√x", "²√");

                if (spilt[1] == '0') {
                  result = spilt[0];
                  result = "= " + result;
                } else {
                  if (equation.endsWith("0") ||
                      equation.endsWith("90)") ||
                      equation.endsWith("180") ||
                      equation.endsWith("270") ||
                      equation.endsWith("360")) {
                    print("equcation++++++++++++++++$result");
                    result = (double.parse(result).round()).toString();

                    return result = "= " + result;
                  }
                  //result = (double.parse(result).roundToDouble()).toString();
                  print("equcation---------$result");
                  return result = "= " + result;
                }
              } catch (e) {
                result = "errorrr";
              }
            }
          } else {
            expression = equation.toString();
            expression = expression.replaceAll("×", "*");
            expression = expression.replaceAll("÷", "/");
            expression = expression.replaceAll("sin⁻¹", "arcsin");
            expression = expression.replaceAll("cos⁻¹", "arccos");
            expression = expression.replaceAll("tan⁻¹", "arctan");

            try {
              Parser p = Parser();
              Expression exp = p.parse(expression);
              ContextModel cm = ContextModel();
              result = "${exp.evaluate(EvaluationType.REAL, cm)}";

              var spilt = result.split(".");
              if (spilt[1] == '0') {
                result = spilt[0];
                result = "= " + result;
              } else {
                //result = (double.parse(result).round()).toString();
                return result = "= " + result;
              }
            } catch (e) {
              result = "error";
            }
          }
        }
      } else {
        if (result != ' ') {
          if (buttonText == '+' ||
              buttonText == '-' ||
              buttonText == '÷' ||
              buttonText == '×') {
            var split = result.split("=");
            //

          } else {
            if (equation.contains("sin") ||
                equation.contains("cos") ||
                equation.contains("tan") ||
                equation.contains("sinh") ||
                equation.contains("cosh") ||
                equation.contains("tanh") ||
                equation.contains("sinh⁻¹") ||
                equation.contains("cosh⁻¹") ||
                equation.contains("tanh⁻¹")) {
              equation = ' ';
            }

            result = ' ';
          }
        }
        equationFontSize = 20.0;
        resultFontSize = 40.0;
        if (equation == " ") {
          equation = buttonText;
          showEquation = buttonText;
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
              equation = equation[last];
            } else {
              equation = equation + buttonText;
            }
          } else {
            equation = equation + buttonText;
          }
        }
      }
      // RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
      // Function mathFunc = (Match match) => '${match[1]},';
      // String resultt = result.replaceAllMapped(reg, mathFunc);
      // result = resultt;
      if (equation.contains("sinh") ||
          equation.contains("cosh") ||
          equation.contains("tanh") ||
          equation.contains("sinh⁻¹") ||
          equation.contains("cosh⁻¹") ||
          equation.contains("tanh⁻¹")) {
        equation = equation.replaceAll("sinhsinh", "sinh");
        equation = equation.replaceAll("coshcosh", "cosh");
        equation = equation.replaceAll("tanhtanh", "tanh");
        equation = equation.replaceAll("sinh⁻¹sinh⁻¹", "sinh⁻¹");
        equation = equation.replaceAll("cosh⁻¹cosh⁻¹", "cosh⁻¹");
        equation = equation.replaceAll("tanh⁻¹tanh⁻¹", "tanh⁻¹");
      }
      //print('$equation ---------------> $resultt');
    });
  }

  _showScaffold(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.black.withOpacity(0.7),
        padding: EdgeInsets.only(left: 20.0),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(bottom: 20, left: 10, right: 10),
        elevation: 6.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.elliptical(60, 50)))));

    equationFontSize = 40.0;
  }

  Widget _landscapeMode() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.fromLTRB(10, 8, 10, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade800,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
                      if (isPortrait) {
                        setLandscape();
                      } else {
                        setPortrait();
                        AssetImage("assets/calculatorIcon.png");
                      }
                    },
                  ),
                  Text(equation,
                      style: TextStyle(
                          fontSize: equation.length >= 15
                              ? equationFontSize = 20
                              : equationFontSize = 25.0,
                          color: Colors.white)),
                ],
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              modeShow,
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Text(
                result,
                style: TextStyle(fontSize: resultFontSize, color: resltColor),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildButton(
                "(", 1, 1, Colors.grey.withAlpha(35), 14.5, Colors.white),
            buildButton(
                ")", 1, 1, Colors.grey.withAlpha(35), 14.5, Colors.white),
            buildButton(
                "mc", 1, 1, Colors.grey.withAlpha(35), 12.0, Colors.white),
            buildButton(
                "m+", 1, 1, Colors.grey.withAlpha(35), 12.0, Colors.white),
            buildButton(
                "m-", 1, 1, Colors.grey.withAlpha(35), 12.0, Colors.white),
            buildButton(
                "mr", 1, 1, Colors.grey.withAlpha(35), 12.0, Colors.white),
            buildButton(equation == " " ? "AC" : "C", 1, 1,
                Colors.grey.shade600, 14.5, Colors.black),
            buildButton("+/-", 1, 1, Colors.grey.shade600, 18.0, Colors.black),
            buildButton("%", 1, 1, Colors.grey.shade600, 18.0, Colors.black),
            buildButton("÷", 1, 1, Colors.orange, 22.0, Colors.white),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildButton("2nd", 1, 1, clr, 12.0, Colors.white),
            buildButton(
                "x²", 1, 1, Colors.grey.withAlpha(35), 14.5, Colors.white),
            buildButton(
                "x³", 1, 1, Colors.grey.withAlpha(35), 14.5, Colors.white),
            buildButton(
                "xʸ", 1, 1, Colors.grey.withAlpha(35), 14.5, Colors.white),
            buildButton(
                "eˣ", 1, 1, Colors.grey.withAlpha(35), 14.0, Colors.white),
            buildButton("$tenpowX", 1, 1, Colors.grey.withAlpha(35), 14.0,
                Colors.white),
            buildButton("7", 1, 1, Colors.grey.shade900, 14.5, Colors.white),
            buildButton("8", 1, 1, Colors.grey.shade900, 14.5, Colors.white),
            buildButton("9", 1, 1, Colors.grey.shade900, 14.5, Colors.white),
            buildButton("×", 1, 1, Colors.orange, 22.5, Colors.white),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildButton(
                "¹/x", 1, 1, Colors.grey.withAlpha(35), 12.0, Colors.white),
            buildButton(
                "²√x", 1, 1, Colors.grey.withAlpha(35), 12.0, Colors.white),
            buildButton(
                "³√x", 1, 1, Colors.grey.withAlpha(35), 12.0, Colors.white),
            buildButton(
                "ʸ√x", 1, 1, Colors.grey.withAlpha(35), 12.0, Colors.white),
            buildButton(
                "ln", 1, 1, Colors.grey.withAlpha(35), 12.5, Colors.white),
            buildButton(
                "$log10", 1, 1, Colors.grey.withAlpha(35), 11.0, Colors.white),
            buildButton("4", 1, 1, Colors.grey.shade900, 14.5, Colors.white),
            buildButton("5", 1, 1, Colors.grey.shade900, 14.5, Colors.white),
            buildButton("6", 1, 1, Colors.grey.shade900, 14.5, Colors.white),
            buildButton("-", 1, 1, Colors.orange, 24.5, Colors.white),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildButton(
                "x!", 1, 1, Colors.grey.withAlpha(35), 12.5, Colors.white),
            buildButton("$sinbtntext", 1, 1, Colors.grey.withAlpha(35), 12.5,
                Colors.white),
            buildButton("$cosbtntext", 1, 1, Colors.grey.withAlpha(35), 12.5,
                Colors.white),
            buildButton("$tanbtntext", 1, 1, Colors.grey.withAlpha(35), 12.5,
                Colors.white),
            buildButton(
                'e', 1, 1, Colors.grey.withAlpha(35), 12.5, Colors.white),
            buildButton(
                "EE", 1, 1, Colors.grey.withAlpha(35), 12.5, Colors.white),
            buildButton("1", 1, 1, Colors.grey.shade900, 14.5, Colors.white),
            buildButton("2", 1, 1, Colors.grey.shade900, 14.5, Colors.white),
            buildButton("3", 1, 1, Colors.grey.shade900, 14.5, Colors.white),
            buildButton("+", 1, 1, Colors.orange, 22.5, Colors.white),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildButton(
                "$radbtn", 1, 1, Colors.grey.withAlpha(35), 10.5, Colors.white),
            buildButton("$sinhbtntext", 1, 1, Colors.grey.withAlpha(35), 10.0,
                Colors.white),
            buildButton("$coshbtntext", 1, 1, Colors.grey.withAlpha(35), 10.5,
                Colors.white),
            buildButton("$tanhbtntext", 1, 1, Colors.grey.withAlpha(35), 10.5,
                Colors.white),
            buildButton(
                "π", 1, 1, Colors.grey.withAlpha(35), 12.0, Colors.white),
            buildButton(
                "Rand", 1, 1, Colors.grey.withAlpha(35), 10.0, Colors.white),
            buildButton("⌫", 1, 1, Colors.red.shade500, 15, Colors.white),
            buildButton("0", 1, 1, Colors.grey.shade900, 14.5, Colors.white),
            buildButton(".", 1, 1, Colors.grey.shade900, 22.5, Colors.white),
            buildButton("=", 1, 1, Colors.orange, 22.5, Colors.white),
          ],
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      body: _landscapeMode(),
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

  Widget buildButton(String buttonText, double buttonHeight, double buttonWidth,
      Color buttonColor, double fontSize, Color fontColor) {
    return Container(
      height: MediaQuery.of(context).size.height * .125 * buttonHeight,
      width: MediaQuery.of(context).size.width * .087 * buttonWidth,
      //color: buttonColor,
      child: RaisedButton(
          color: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
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

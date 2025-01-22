import 'package:calculator/button_values.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String number1 = "";
  String operand = "";
  String number2 = "";

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                reverse: true,
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "$number1$operand$number2".isEmpty
                        ? "0"
                        : "$number1$operand$number2",
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ),
            Wrap(
              children: Btn.buttonValues
                  .map(
                    (value) => SizedBox(
                      width: value == Btn.n0
                          ? screenSize.width / 2
                          : (screenSize.width / 4),
                      height: screenSize.width / 5,
                      child: buildButton(value),
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }

  Widget buildButton(value) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
        color: getBtnColor(value),
        clipBehavior: Clip.hardEdge,
        shape: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white24,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        child: InkWell(
          onTap: () => onBtnTap(value),
          child: Center(
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onBtnTap(String value) {
    if (value == Btn.del) {
      delete();
      return;
    }

    if (value == Btn.clr) {
      clearAll();
      return;
    }

    if (value == Btn.per) {
      convertToPercentage();
      return;
    }

    if (value == Btn.calculate) {
      calculate();
      return;
    }

    appendValue(value);
  }

  void calculate() {
    if (number1.isEmpty) return;
    if (operand.isEmpty) return;
    if (number2.isEmpty &&
        (operand != Btn.sqrt &&
            operand != Btn.inv &&
            operand != Btn.log &&
            operand != Btn.pow)) return;

    final double num1 = double.parse(number1);

    num result = 0.0;
    switch (operand) {
      case Btn.add:
        result = num1 + double.parse(number2);
        break;
      case Btn.subtract:
        result = num1 - double.parse(number2);
        break;
      case Btn.multiply:
        result = num1 * double.parse(number2);
        break;
      case Btn.divide:
        result = num1 / double.parse(number2);
        break;
      case Btn.log:
        result = log(num1);
        break;
      case Btn.pow:
        result = pow(num1, 2);
        break;
      case Btn.sqrt:
        result = sqrt(num1);
        break;
      case Btn.inv:
        result = 1 / num1;
        break;
      default:
    }

    setState(() {
      number1 = result.toStringAsPrecision(3);

      if (number1.endsWith(".0")) {
        number1 = number1.substring(0, number1.length - 2);
      }

      operand = "";
      number2 = "";
    });
  }

  void convertToPercentage() {
    if (number1.isNotEmpty && operand.isNotEmpty && number2.isNotEmpty) {
      calculate();
    }

    if (operand.isNotEmpty) {
      return;
    }

    final number = double.parse(number1);
    setState(() {
      number1 = "${(number / 100)}";
      operand = "";
      number2 = "";
    });
  }

  void clearAll() {
    setState(() {
      number1 = "";
      operand = "";
      number2 = "";
    });
  }

  void delete() {
    if (number2.isNotEmpty) {
      number2 = number2.substring(0, number2.length - 1);
    } else if (operand.isNotEmpty) {
      operand = "";
    } else if (number1.isNotEmpty) {
      number1 = number1.substring(0, number1.length - 1);
    }

    setState(() {});
  }

  void appendValue(String value) {
    if (value == Btn.dot) {
      if (operand.isEmpty && !number1.contains(Btn.dot)) {
        number1 += value;
      } else if (!number2.contains(Btn.dot)) {
        number2 += value;
      }
      setState(() {});
      return;
    }

    if (int.tryParse(value) != null) {
      if (operand.isEmpty) {
        if (number1.length < 10) {
          number1 += value;
        }
      } else {
        if (number2.length < 10) {
          number2 += value;
        }
      }
      setState(() {});
      return;
    }

    if (value != Btn.dot && int.tryParse(value) == null) {
      if (number1.isEmpty) return;

      if ([Btn.log, Btn.pow, Btn.sqrt, Btn.inv].contains(value)) {
        operand = value;
        calculate();
      } else {
        if (operand.isNotEmpty && number2.isNotEmpty) {
          calculate();
        }
        operand = value;
      }

      setState(() {});
    }
  }

  Color getBtnColor(value) {
    return [Btn.del, Btn.clr].contains(value)
        ? Colors.blueGrey
        : [
            Btn.per,
            Btn.multiply,
            Btn.add,
            Btn.subtract,
            Btn.divide,
            Btn.calculate,
            Btn.log,
            Btn.pow,
            Btn.sqrt,
            Btn.inv,
          ].contains(value)
            ? Colors.orange
            : Colors.black87;
  }
}

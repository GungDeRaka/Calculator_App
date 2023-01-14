// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorController with ChangeNotifier {
  /// Setelah di klik, nilai string pada tombol kalkulator akan disimpan pada [number]
  String number = "";

  /// Hasil dari perhitungan aritmatika akan disimpan pada [result]
  String result = "";

  /// [btnList] Memberi nama pada tombol-tombol kalkulator
  List<String> btnList = [
    'C',
    '⌫',
    '%',
    '÷',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '+',
    '1',
    '2',
    '3',
    '-',
    '.',
    '0',
    "00",
    '=',
  ];
  CalculatorController();

  /// add every text in button and store it at [number] as a string
  /// and do some arithmetic count when equal sign ("=") is clicked
  void buttonsPressed(int index) {
    number += btnList[index];
    notifyListeners();
  }

  /// Clear [number] and [result] int an empty string
  void clear() {
    number = "";
    result = "";
    notifyListeners();
  }

  ///evaluate and do aritmethic count for [number] and store it in [result]
  void onEqualPressed() {
    try {
      number = number.replaceAll("x", "*");
      number = number.replaceAll("÷", "/");
      number = number.replaceAll("%", "/100");

      Parser p = Parser();
      Expression exp = p.parse(number);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      result = eval.toString();
      number = "";
    } catch (e) {
      number = "";
    }
    notifyListeners();
  }

  /// remove the last index of [number] (backspace it)
  void backspace() {
    number = number.substring(0, number.length - 1);
    notifyListeners();
  }
}

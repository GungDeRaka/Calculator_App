// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/foundation.dart';

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

  void buttonsPressed(int index) {
    number += btnList[index];
    notifyListeners();
  }

  void clear() {
    number = "";
    notifyListeners();
  }
}

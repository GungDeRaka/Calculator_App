import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({
    Key? key,
    required this.btnText,
    required this.onPressed,
  }) : super(key: key);

  /// [btnText] Memberi simbol atau nama pada [CalculatorButton] dalam bentuk string pada widget Text()
  final String btnText;

  /// [onPressed] Memanggil suatu fungsi ketika [CalculatorButton] ditekan
  final void Function() onPressed;
  bool isOperator() {
    if (btnText == "+" ||
        btnText == "-" ||
        btnText == "x" ||
        btnText == "÷" ||
        btnText == "=" ||
        btnText == "C" ||
        btnText == "%" ||
        btnText == "." ||
        btnText == "⌫") {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: (isOperator()) ? Colors.grey[500] :  Colors.grey[400],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // <-- Radius
        ),
      ),
      onPressed: onPressed,
      child: Text(
        btnText,
        style: TextStyle(
          fontSize: 20,
          color: (isOperator()) ? Colors.tealAccent[100] : Colors.black54,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

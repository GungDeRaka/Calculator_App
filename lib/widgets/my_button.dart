// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.btnText,
    required this.onPressed,
  }) : super(key: key);

  /// [btnText] Memberi simbol atau nama pada [MyButton] dalam bentuk string pada widget Text()
  final String btnText;

  /// [onPressed] Memanggil suatu fungsi ketika [MyButton] ditekan
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: (btnText == "=")
            ? Colors.red[700]
            : (btnText == "+" ||
                    btnText == "-" ||
                    btnText == "x" ||
                    btnText == "÷")
                ? Colors.amber[700]
                : (btnText == "C" ||
                        btnText == "%" ||
                        btnText == "." ||
                        btnText == "⌫")
                    ? Colors.blueGrey[300]
                    : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // <-- Radius
        ),
      ),
      onPressed: onPressed,
      child: Text(
        btnText,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

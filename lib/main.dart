import 'package:flutter/material.dart';
import 'package:my_calculator_app/controller/calculator_controller.dart';
import 'package:provider/provider.dart';

import 'screens/calculator_with_controller.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CalculatorController>(
      create: (context) => CalculatorController(),
      child: MaterialApp(
        themeMode: ThemeMode.dark,
        
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.black
        ),
        home:  CalculatorWithController(),
      ),
    );
  }
}

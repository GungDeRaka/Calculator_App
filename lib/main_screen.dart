import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String result = "0";
  String number = "";
  String operator = "";
  String btnText = "";
  List<String> btnList = [
    'C',
    '+/-',
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
    "⌫",
    '=',
  ];



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 12.0,
            ),
            Container(
              width: size.width * 0.95,
              height: size.height * 0.3,
              margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.white,
                      blurRadius: 12,
                      blurStyle: BlurStyle.normal)
                ],
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      number,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      result,
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  childAspectRatio: 1.4,
                  mainAxisExtent: 60,
                ),
                itemCount: btnList.length,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  btnText = btnList[index];
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
                                      btnText == "+/-" ||
                                      btnText == "%" ||
                                      btnText == "." ||
                                      btnText == "⌫")
                                  ? Colors.blueGrey[300]
                                  : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                    ),
                    onPressed: () {
                      (btnText != "C" ||btnText != "⌫" ||btnText != "+/-" ||btnText != "=")?
                      number = number.padRight(number.length+1,btnList[index]):number = number;
                      setState(() {
                        
                      });
                    },
                    child: Text(
                      btnText,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
          ],
        ),
      ),
    );
  }
    void count(){
    num firstNum = num.parse(number.substring(0, number.indexOf(operator)));
    num secondNum = num.parse(number.substring(number.indexOf(operator)+1));
    if(btnText == "+"){
      operator= "+";
      result = (firstNum + secondNum).toString();
    }
    else if(btnText == "-"){
      operator= "-";
      result = (firstNum - secondNum).toString();
    }
    else if(btnText == "x"){
      operator= "x";
      result = (firstNum * secondNum).toString();
    }
    else if(btnText == "÷"){
      operator= "÷";
      result = (firstNum / secondNum).toString();
    }

  }
}

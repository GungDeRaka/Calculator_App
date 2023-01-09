import 'package:flutter/material.dart';

import 'my_button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String result = "";
  String number = "";
  String operator = "";
  String btnText = "";
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
                      textAlign: TextAlign.right,
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
                  return (index == 0)
                      ? MyButton(
                          btnText: btnList[index],
                          onPressed: () {
                            number = "";
                            setState(() {});
                          },
                        )
                      : (index == 1) ? MyButton(
                          btnText: btnList[index],
                          onPressed: () {
                            number = number.substring(0,number.length -1);
                            setState(() {});
                          }, 
                        ): MyButton(
                          btnText: btnList[index],
                          onPressed: () {
                            number += btnList[index];
                            setState(() {});
                          },
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

  
}

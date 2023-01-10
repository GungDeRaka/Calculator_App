import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'my_button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
            //? Container untuk menampilkan [result] dan [number] pada layar
            Container(
              width: size.width * 0.95,
              height: size.height * 0.3,
              margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
              decoration: BoxDecoration(
                boxShadow: const [
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
                    //* Widget ini akan menampilkan string number ke layar
                    Hero(
                      tag: 'count',
              
                      child: Text(
                        number,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    //* Widget ini akan menampilkan string hasil 
                    //* perhitungan aritmatik dari number ke layar
                    Hero(
                      tag: 'count',
                      child: Text(
                        result,
                        style: const TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                        ),
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
                  //? tombol "C" (clear) mengubah number dan result menjadi string kosong
                  return (index == 0)
                      ? MyButton(
                          btnText: btnList[index],
                          onPressed: () {
                            number = "";
                            result = '';
                            setState(() {});
                          },
                        )
                        //? tombol backspace untuk menghapus index terakhir pada number
                      : (index == 1)
                          ? MyButton(
                              btnText: btnList[index],
                              onPressed: () {
                                number = number.substring(0, number.length - 1);
                                result = "";
                                setState(() {});
                              },
                            )
                            //? tombol sama dengan. "="
                          : (index == btnList.length - 1)
                              ? MyButton(
                                  btnText: btnList[index],
                                  onPressed: () {
                                    onEqualPressed(number);
                                    number = "";
                                    setState(() {});
                                  },
                                )
                                //? tombol-tombol lainnya yang hanya digunakan untuk menambahkan number
                              : MyButton(
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

/// [onEqualPressed] setelah tombol sama dengan di tekan, fungsi ini akan dipanggil
/// fungsi ini akan melakukan perhitungan aritmatika dari [number] dan menyimpan hasilnya pada [result]
  Future<void> onEqualPressed(String count) async {
    count = count.replaceAll("x", "*");
    count = count.replaceAll("÷", "/");

    Parser p = Parser();
    Expression exp = p.parse(count);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    result = eval.toString();
  }
}

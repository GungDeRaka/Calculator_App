import 'package:flutter/material.dart';
import 'package:my_calculator_app/controller/calculator_controller.dart';
import 'package:my_calculator_app/widgets/calculator_button.dart';
import 'package:provider/provider.dart';

class CalculatorWithController extends StatelessWidget {
  const CalculatorWithController({super.key});


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Column(
          children: [
            const SizedBox(
            height: 8.0,
            ),
            Container(
              width: size.width * 0.95,
              height: size.height * 0.3,
              margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.tealAccent.withAlpha(9),
                      blurRadius: 12,
                      blurStyle: BlurStyle.normal)
                ],
                borderRadius: BorderRadius.circular(4),
                color: Colors.white60,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //* Widget ini akan menampilkan string number ke layar
                    Consumer<CalculatorController>(
                      builder: (context, controller, child) => Hero(
                        tag: 'count',
                        child: Text(
                          controller.number,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    //* Widget ini akan menampilkan string hasil
                    //* perhitungan aritmatik dari number ke layar
                    Consumer<CalculatorController>(
                      builder: (context, controller, child) =>Hero(
                        tag: 'count',
                        child: Text(
                          controller.result,
                          style: const TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Consumer<CalculatorController>(
              builder: (context, controller, child) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    childAspectRatio: 1.4,
                    mainAxisExtent: 60,
                  ),
                  itemCount: controller.btnList.length,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    var btnList = controller.btnList;
                    //? tombol "C" (clear) mengubah number dan result menjadi string kosong
                    return  (index == 0)
                      ? CalculatorButton(
                          btnText: btnList[index],
                          onPressed: () {
                            controller.clear();
                          },
                        )
                      //? tombol backspace untuk menghapus index terakhir pada number
                      : (index == 1)
                          ? CalculatorButton(
                              btnText: btnList[index],
                              onPressed: () {
                               
                              },
                            )
                          //? tombol sama dengan. "="
                          : (index == btnList.length - 1)
                              ? CalculatorButton(
                                  btnText: btnList[index],
                                  onPressed: () {
                                    
                                  },
                                )
                              //? tombol-tombol lainnya yang hanya digunakan untuk menambahkan number
                              : CalculatorButton(
                                  btnText: btnList[index],
                                  onPressed: () {
                                    controller.buttonsPressed(index);
                                  },
                                );  },
                ),
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

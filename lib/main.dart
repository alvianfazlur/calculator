import 'package:calculator/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'button.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    var calculatorcontroller = Get.put(CalculatorController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Kalkulator Sederhana"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: <Color>[
                  Colors.green,
                  Colors.blue,
                ]
            )
          ),
        ),
      ), //AppBar
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: GetBuilder<CalculatorController>(
                      builder: (controller) => Text(
                        controller.userInput,
                        style: const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    alignment: Alignment.centerRight,
                    child: GetBuilder<CalculatorController>(
                      builder: (controller) => Text(
                        controller.answer,
                        style: const TextStyle(
                            fontSize: 40,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ]),
          ),
          Expanded(
            flex: 2,
            child: GridView.builder(
                itemCount: calculatorcontroller.buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  // Clear Button
                  if (index == 0) {
                    return MyButton(
                      buttontapped: () {
                          calculatorcontroller.clear();
                      },
                      buttonText: calculatorcontroller.buttons[index],
                      color: Colors.grey,
                      textColor: Colors.black,
                    );
                  }
                  else if (index == 1) {
                    return MyButton(
                      buttontapped: () {

                      },
                      buttonText: calculatorcontroller.buttons[index],
                      color: Colors.grey,
                      textColor: Colors.black,
                    );
                  }
                  //Persen
                  else if (index == 2) {
                    return MyButton(
                      buttontapped: () {
                          calculatorcontroller.input(index);
                      },
                      buttonText: calculatorcontroller.buttons[index],
                      color: Colors.grey,
                      textColor: Colors.black,
                    );
                  }
                  // Delete Button
                  else if (index == 3) {
                    return MyButton(
                      buttontapped: () {
                          calculatorcontroller.delete();
                      },
                      buttonText: calculatorcontroller.buttons[index],
                      color: Colors.grey,
                      textColor: Colors.black,
                    );
                  }
                  // Tombol sama dengan
                  else if (index == 18) {
                    return MyButton(
                      buttontapped: () {
                          calculatorcontroller.equal();
                      },
                      buttonText: calculatorcontroller.buttons[index],
                      color: Colors.orange[700],
                      textColor: Colors.white,
                    );
                  }
                  // Button Lainnya
                  else {
                    return MyButton(
                      buttontapped: () {
                          calculatorcontroller.input(index);
                      },
                      buttonText: calculatorcontroller.buttons[index],
                      color: isOperator(calculatorcontroller.buttons[index])
                          ? Colors.blueAccent
                          : Colors.greenAccent,
                      textColor: isOperator(calculatorcontroller.buttons[index])
                          ? Colors.white
                          : Colors.black,
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }
}

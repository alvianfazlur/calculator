import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorController extends GetxController{
  final List<String> buttons = [
    'C',
    ' ',
    ' ',
    'DEL',
    '1',
    '2',
    '3',
    '/',
    '4',
    '5',
    '6',
    'x',
    '7',
    '8',
    '9',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];

  var userInput = '';
  var answer = '';

  void equal(){
    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
    update();
  }
  void input(int index){
    userInput += buttons[index];
    update();
  }

  void clear(){
    userInput = '';
    answer = '';
    update();
  }

  void delete(){
    userInput = userInput.substring(0, userInput.length-1);
    update();
  }
}

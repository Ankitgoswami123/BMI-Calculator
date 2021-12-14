import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';
import 'results_page.dart';

void main() {
  runApp(const BMI());
}

class BMI extends StatelessWidget {
  const BMI({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
            color: Color(0xFF0A0E21)
        ),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      initialRoute: 'input page',
      routes: (
      {
        'input page':(context)=>InputPage(),
        'result page':(context)=>ResultPage(),
      }
      )
    );
  }
}







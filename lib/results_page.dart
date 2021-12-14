import 'package:bmi_calculator/bottom_button.dart';
import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'constant.dart';
class ResultPage extends StatelessWidget {
  final String ? bmiResult;
  final String ? resultText;
  final String ? interpretation;
ResultPage({@required this.bmiResult,@required this.resultText,@required this.interpretation});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:<Widget> [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30.0),
              child: Text("YOUR RESULT",
                textAlign: TextAlign.center,style: kTitleTextStyle,),
            ),),
          Expanded(
              flex:5,
              child: ReusableCard(colour: kInactiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  <Widget>[
                    Text(bmiResult!,
                        style: kResultTextStyle),
                    Text(resultText!,style: kBmiTextStyle),
                    Text(interpretation!,
                        textAlign: TextAlign.center,style: kBodyTextStyle),
                  ],
                ) ,)
            ),
          Expanded(
            child: BottomButton(
            onTap: (){
              Navigator.pop(context);
    },
    buttonTitle: 'RE CALCULATE',
            ) ,

          ),
        ],
      ),
    );
  }

}

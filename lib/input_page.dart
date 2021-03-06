import 'package:bmi_calculator/results_page.dart';

import 'bottom_button.dart';
import 'round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constant.dart';
import 'calculator_brain.dart';
enum Gender{
  MALE,FEMALE
}

class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.MALE ;
int height = 180;
int weight = 80;
int age = 21;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI CALCULATOR')),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPress: (){
                        setState(() {
                          selectedGender = Gender.MALE;
                        });
                      },
                      colour: selectedGender == Gender.MALE ? kActiveCardColor : kInactiveCardColor ,
                      cardChild: IconContent(
                          FontAwesomeIcons.mars,'MALE'
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: (){setState(() {
                        selectedGender = Gender.FEMALE;
                      });},
                      colour: selectedGender == Gender.FEMALE ? kActiveCardColor : kInactiveCardColor,
                      cardChild: IconContent(
                          FontAwesomeIcons.venus,'FEMALE'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: ReusableCard(
              colour: kInactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('HEIGHT',style: kLabelStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children:  <Widget>[
                      Text(height.toString(),style:kNumberTextStyle),
                      Text('cm',style:kLabelStyle),

                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xFFEB1555),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),

                    ),
                    child: Slider(value: (height.toDouble()),
                      min: 100.0,
                      max:220,
                      onChanged:(newValue){
                        setState(() {
                          height = newValue.round();
                        });
                      },),
                  ),

                ],
              ),
            ),),
            Expanded(
              child: Row(
                children: <Widget> [
                  Expanded(
                    child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('WEIGHT',style: kLabelStyle),
                        Text(weight.toString(),style: kNumberTextStyle,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children:<Widget> [
                         RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: () {
                           setState(() {
                                    weight--;
                           });
                         }
                         ),
                         SizedBox(width: 18.0,),
                         RoundIconButton(icon: FontAwesomeIcons.plus,onPressed: (){
                            setState(() {
                        weight++;
                            });
                         }),
                       ],
                     ),
                        ],
                      ),
                      colour: kInactiveCardColor,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kInactiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('AGE',style: kLabelStyle,),
                          Text(age.toString(),style: kNumberTextStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){
                         setState(() {
                           age--;
                         });
                              }),
                              SizedBox(width: 18.0,),
                              RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: (){
                                setState(() {
                                  age++;
                                });
                              })
                            ],
                          )

                        ],
                      ),

                    ),
                  ),
                ],
              ),
            ),
            BottomButton(onTap: (){
              CalculatorBrain calc = CalculatorBrain(height, weight);
Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(bmiResult: calc.getResult(),
    resultText: calc.CalculateBMI(), interpretation: calc.getInterpretation())));
            },buttonTitle: 'CALCULATE',
            ),
          ],
        )
    );

  }
}













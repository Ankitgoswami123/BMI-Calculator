import 'package:flutter/material.dart';
const cardmargin = EdgeInsets.all(15.0);
class ReusableCard extends StatelessWidget {
  const ReusableCard({this.cardChild,this.colour,this.onPress});
  final   Widget ? cardChild;
  final Color ? colour;
  final  Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onPress,
      child: Container(
        child: cardChild,
        margin: cardmargin ,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color:colour,
        ),

      ),
    );
  }
}
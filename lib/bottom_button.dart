import 'package:flutter/material.dart';
import 'constant.dart';
class BottomButton extends StatelessWidget {
  final  String ?  buttonTitle;
  final Function()  ? onTap;
  BottomButton({@required this.buttonTitle,@required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child:  Center(child: Text(buttonTitle!,style: kLargeButtonTextStyle,)),
        margin: const EdgeInsets.only(top: 10.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: kBottomContainerColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        height: kBottomContainerHeight,
      ),
    );
  }
}
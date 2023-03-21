import 'package:flutter/material.dart';
import 'package:bmi_flutter/constant.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.onTap, required this.buttonTittle});

  final void Function()? onTap;
  final String buttonTittle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kbottomcontainerColor,
        margin: const EdgeInsets.only(top: 10.00),
        padding: const EdgeInsets.only(bottom: 10.0),
        width: double.infinity,
        height: kBottomcontainerHeight,
        child: Center(
          child: Text(
            buttonTittle,
            style: kLargeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}

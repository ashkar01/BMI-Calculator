import 'package:bmi_flutter/components/bottom_button.dart';
import 'package:bmi_flutter/constant.dart';
import 'package:flutter/material.dart';

import '../components/resuabale_card.dart';

class Result extends StatelessWidget {
  const Result(
      {required this.bmiresult,
      required this.resultText,
      required this.interpretation});
  final String bmiresult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    print('BMI: $bmiresult');
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: const Text(
              'Your Result',
              style: kTitleTextStyle,
            ),
          )),
          Expanded(
              flex: 6,
              child: Reusablecard(
                  colour: kactivecardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        resultText.toUpperCase(),
                        style: kResultTextStyle,
                      ),
                      Text(
                        bmiresult,
                        style: kBMITextStyle,
                      ),
                      Text(
                        interpretation,
                        style: kbodyTextStyle,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  onpress: () {})),
          BottomButton(
              onTap: () {
                Navigator.pop(context);
              },
              buttonTittle: 'Re-calculate')
        ],
      ),
    );
  }
}

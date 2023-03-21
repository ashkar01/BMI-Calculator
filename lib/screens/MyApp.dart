import 'package:bmi_flutter/screens/result.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/bottom_Button.dart';

import 'package:bmi_flutter/constant.dart';

import '../components/icon_content.dart';
import '../components/resuabale_card.dart';
import '../components/round_icon_button.dart';
import 'package:bmi_flutter/calculator_brain.dart';

enum Gender {
  male,
  femmale,
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Gender selectedgender = Gender.male;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kinactivecardColour,
        appBar: AppBar(
          title: const Center(child: Text('BMI CALCULATOR')),
          backgroundColor: Colors.black87,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: Reusablecard(
                  onpress: () {
                    setState(() {
                      selectedgender = Gender.male;
                    });
                  },
                  colour: selectedgender == Gender.male
                      ? kactivecardColour
                      : kinactivecardColour,
                  cardChild: const IconContent(
                    icon: FontAwesomeIcons.mars,
                    label: 'Male',
                  ),
                )),
                Expanded(
                    child: Reusablecard(
                  onpress: () {
                    setState(() {
                      selectedgender = Gender.femmale;
                    });
                  },
                  colour: selectedgender == Gender.femmale
                      ? kactivecardColour
                      : kinactivecardColour,
                  cardChild: const IconContent(
                      icon: FontAwesomeIcons.venus, label: 'Female'),
                ))
              ],
            )),
            Expanded(
                child: Reusablecard(
              onpress: () {},
              colour: kactivecardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('HEIGHT', style: kLabelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kNumberTextStyle),
                      const Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbColor: const Color(0XFFEB1555),
                        inactiveTrackColor: const Color(0XFF8D8E98),
                        overlayColor: const Color(0X29EB1555),
                        activeTrackColor: Colors.white,
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 15.0),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30.0)),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (double newvalue) {
                          setState(() {
                            height = newvalue.round();
                          });
                        }),
                  )
                ],
              ),
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: Reusablecard(
                    onpress: () {},
                    colour: kactivecardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              iconData: FontAwesomeIcons.minus,
                              onpressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              iconData: FontAwesomeIcons.plus,
                              onpressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: Reusablecard(
                        onpress: () {},
                        colour: kactivecardColour,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'AGE',
                              style: kLabelTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                    iconData: FontAwesomeIcons.minus,
                                    onpressed: () {
                                      setState(() {
                                        age--;
                                      });
                                    }),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(
                                    iconData: FontAwesomeIcons.plus,
                                    onpressed: () {
                                      setState(() {
                                        age++;
                                      });
                                    })
                              ],
                            )
                          ],
                        ))),
              ],
            )),
            BottomButton(
                buttonTittle: 'Calculate',
                onTap: () {
                  CalculatorBrain calc =
                      CalculatorBrain(height: height, weight: weight);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Result(
                      bmiresult: calc.calculateBmi(),
                      resultText: calc.getResult(),
                      interpretation: calc.getinterpretation(),
                    );
                  }));
                })
          ],
        ));
  }
}

import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'classes.dart';
import 'const.dart';
import 'results_page.dart';
import 'calculate_bmi.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

Color maleCardColor = kInactivecardcolor;
Color femaleCardColor = kInactivecardcolor;

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  void selectedGender(Gender gender) {
    if (gender == Gender.male) {
      if (maleCardColor == kInactivecardcolor) {
        maleCardColor = kActivecardcolor;
        femaleCardColor = kInactivecardcolor;
      } else {
        maleCardColor = kInactivecardcolor;
      }
    }
    if (gender == Gender.female) {
      if (femaleCardColor == kInactivecardcolor) {
        femaleCardColor = kActivecardcolor;
        maleCardColor = kInactivecardcolor;
      } else {
        femaleCardColor = kInactivecardcolor;
      }
    }
  }

  int height = 0;
  int weight = 60;
  int age = 19;
  @override
  Widget build(BuildContext context) {
    var roundIconButton = RoundIconButton;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(
                          () {
                            selectedGender(Gender.male);
                          },
                        );
                      },
                      colors: maleCardColor,
                      cardChild: IconContentwidget(
                        icon: FontAwesomeIcons.mars,
                        text: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(
                          () {
                            selectedGender(Gender.female);
                          },
                        );
                      },
                      colors: femaleCardColor,
                      cardChild: IconContentwidget(
                        icon: FontAwesomeIcons.venus,
                        text: 'FEMALE',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colors: kActivecardcolor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Height',
                      style: kTextstyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'CM',
                          style: kTextstyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: Color(0xFF4A148C),
                        activeTrackColor: Color(0xFF4A148C),
                        inactiveTrackColor: Colors.black,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        min: 0,
                        max: 500,
                        value: height.toDouble(),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: kTextstyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      colors: kActivecardcolor,
                    ),
                  ),
                  Expanded(
                      child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: kTextstyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    colors: kActivecardcolor,
                  ))
                ],
              ),
            ),
            Bottombutton(
              text: 'Calculate',
              onTap: () {
                Calculate cal = Calculate(height: height, weight: weight);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Resultspage(
                      result: cal.getResults(),
                      resultbody: cal.getMeaning(),
                      resultnumber: cal.calculateBmi(),
                    ),
                  ),
                );
              },
              style: kcalculatetextstyle,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

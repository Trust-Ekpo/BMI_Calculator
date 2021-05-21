import 'package:bmi_calculator/classes.dart';
import 'package:bmi_calculator/const.dart';
import 'package:flutter/material.dart';
import 'classes.dart';

class Resultspage extends StatelessWidget {
  Resultspage(
      {@required this.result,
      @required this.resultnumber,
      @required this.resultbody});
  final String result;
  final String resultnumber;
  final String resultbody;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: Text(
                'Your Result',
                style: ktitlestyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colors: kActivecardcolor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    result.toUpperCase(),
                    style: kresulttextstyle,
                  ),
                  Text(
                    resultnumber,
                    style: kBMItextstyle,
                  ),
                  Text(
                    resultbody,
                    style: kBMIBodytextstyle,
                    textAlign: TextAlign.center,
                  ),
                  Bottombutton(
                    text: 'Re-Calculate',
                    onTap: () {
                      Navigator.pop(context);
                    },
                    style: kcalculateptextstyle,
                    color: Color(0xFF4A148C),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

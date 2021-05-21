import 'package:flutter/material.dart';
import 'const.dart';

class IconContentwidget extends StatelessWidget {
  IconContentwidget({this.icon, this.text});

  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
          color: Color(kTextcolor),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: kTextstyle,
        )
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colors, this.cardChild, this.onPress});

  //final makes the colors immutable
  final Color colors;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(18.0),
        // height: 200.0,
        // width: 170.0,
        decoration: BoxDecoration(
            color: colors, borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}

class Bottombutton extends StatelessWidget {
  Bottombutton(
      {@required this.text,
      @required this.onTap,
      @required this.style,
      @required this.color});

  final String text;
  final Function onTap;
  final TextStyle style;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: 120, height: 50),
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.all(10)),
          backgroundColor: MaterialStateProperty.all(
            color,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
        ),
        child: Text(
          text,
          style: style,
        ),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4A148C),
    );
  }
}

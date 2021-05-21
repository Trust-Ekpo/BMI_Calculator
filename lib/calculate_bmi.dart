import 'dart:math';

class Calculate {
  Calculate({this.height, this.weight});

  final int height;
  final int weight;
  double _bmi=0;
  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResults() {
    if (_bmi >= 25) {
      return 'Over Weight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Under Weight';
    }
  }
  String getMeaning() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. ';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight';
    } else {
      return 'You have a lover than normal body weight. ';
    }
  }
}

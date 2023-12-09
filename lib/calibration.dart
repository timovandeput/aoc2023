class Calibration {
  const Calibration(this.text);

  final String text;

  int get value {
    final notDigit = RegExp(r'\D+');
    final digits = text.replaceAll(notDigit, '');
    return int.parse(digits[0] + digits[digits.length - 1]);
  }
}

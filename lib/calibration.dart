class Calibration {
  const Calibration(this.text);

  final String text;

  int get value => int.parse(text);
}

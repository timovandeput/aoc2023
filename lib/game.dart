class Game {
  final int maxRed;
  final int maxGreen;
  final int maxBlue;

  Game({required this.maxRed, required this.maxGreen, required this.maxBlue});

  void grab({int red = 0, int green = 0, int blue = 0}) {
    if (red > maxRed || green > maxGreen || blue > maxBlue) {
      throw ArgumentError(
          'You cannot grab more than the maximum amount of balls');
    }
  }
}

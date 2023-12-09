class Game {
  final int maxRed;
  final int maxGreen;
  final int maxBlue;

  Game({required this.maxRed, required this.maxGreen, required this.maxBlue});

  void grab(Hand grab) {
    if (grab.red > maxRed || grab.green > maxGreen || grab.blue > maxBlue) {
      throw ArgumentError(
          'You cannot grab more than the maximum amount of balls');
    }
  }
}

class Hand {
  final int red;
  final int green;
  final int blue;

  Hand({this.red = 0, this.green = 0, this.blue = 0});

  /// Parses a [Hand] from e.g. "3 blue, 4 red, 5 green".
  factory Hand.parse(String text) {
    final colors = text.split(',');
    int red = 0, green = 0, blue = 0;
    if (colors[0].isEmpty) return Hand();
    for (final entry in colors) {
      final split = entry.trim().split(' ');
      final quantity = int.parse(split[0].trim());
      final color = split[1].trim();
      switch (color) {
        case 'red':
          red = quantity;
        case 'green':
          green = quantity;
        case 'blue':
          blue = quantity;
      }
    }
    return Hand(red: red, green: green, blue: blue);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Hand &&
          runtimeType == other.runtimeType &&
          red == other.red &&
          green == other.green &&
          blue == other.blue;

  @override
  int get hashCode => red.hashCode ^ green.hashCode ^ blue.hashCode;

  @override
  String toString() => 'Hand{red: $red, green: $green, blue: $blue}';
}

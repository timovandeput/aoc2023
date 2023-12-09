import 'package:aoc2023/game.dart';
import 'package:test/test.dart';

void main() {
  group('$Game', () {
    test('grabs balls from game', () {
      const maxRed = 2, maxGreen = 3, maxBlue = 4;
      final game = Game(maxRed: maxRed, maxGreen: maxGreen, maxBlue: maxBlue);

      expect(
        () => game.grab(red: maxRed, green: maxGreen, blue: maxBlue),
        returnsNormally,
      );
      expect(() => game.grab(), returnsNormally);
    });

    test('throws on grabbing excess balls', () {
      const max = 7;
      final game = Game(maxRed: max, maxGreen: max, maxBlue: max);

      expect(() => game.grab(red: max + 1), throwsArgumentError);
      expect(() => game.grab(green: max + 1), throwsArgumentError);
      expect(() => game.grab(blue: max + 1), throwsArgumentError);
    });
  });
}

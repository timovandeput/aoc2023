import 'package:aoc2023/game.dart';
import 'package:test/test.dart';

void main() {
  group('$Game', () {
    test('grabs balls from game', () {
      const maxRed = 2, maxGreen = 3, maxBlue = 4;
      final game = Game(maxRed: maxRed, maxGreen: maxGreen, maxBlue: maxBlue);

      expect(
        () => game.grab(Hand(red: maxRed, green: maxGreen, blue: maxBlue)),
        returnsNormally,
      );
      expect(() => game.grab(Hand()), returnsNormally);
    });

    test('calculates the power of a game', () {
      const max = 99;
      const red = 2, green = 3, blue = 4;
      final game = Game(maxRed: max, maxGreen: max, maxBlue: max);

      game.grab(Hand(red: red, green: green, blue: blue));

      expect(game.power, equals(red * green * blue));
    });

    test('throws on grabbing excess balls', () {
      const max = 7;
      final game = Game(maxRed: max, maxGreen: max, maxBlue: max);

      expect(() => game.grab(Hand(red: max + 1)), throwsArgumentError);
      expect(() => game.grab(Hand(green: max + 1)), throwsArgumentError);
      expect(() => game.grab(Hand(blue: max + 1)), throwsArgumentError);
    });

    test('plays from text', () {
      const max = 7;
      final game = Game(maxRed: max, maxGreen: max, maxBlue: max);

      expect(
        () => game.play('$max red, $max green, $max blue'),
        returnsNormally,
      );
      expect(() => game.play('$max red'), returnsNormally);
      expect(() => game.play('999 red'), throwsArgumentError);
    });

    group('$Hand', () {
      test('parses empty hand', () {
        expect(Hand.parse(''), equals(Hand()));
      });

      test('parses hand with one color', () {
        expect(Hand.parse('3 red'), equals(Hand(red: 3)));
        expect(Hand.parse('4 green'), equals(Hand(green: 4)));
        expect(Hand.parse('5 blue'), equals(Hand(blue: 5)));
      });

      test('parses hand with multiple colors', () {
        expect(
          Hand.parse('3 red, 4 green'),
          equals(Hand(red: 3, green: 4)),
        );
        expect(
          Hand.parse('3 red, 4 green, 5 blue'),
          equals(Hand(red: 3, green: 4, blue: 5)),
        );
      });
    });
  });
}

import 'package:aoc2023/game_parser.dart';
import 'package:test/test.dart';

void main() {
  group('$GameParser', () {
    test('parses empty game', () {
      final parser = GameParser('');

      expect(parser.parse(), isEmpty);
    });
  });
}

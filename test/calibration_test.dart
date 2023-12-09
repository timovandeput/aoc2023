import 'package:aoc2023/calibration.dart';
import 'package:test/test.dart';

void main() {
  group('$Calibration', () {
    test('parses plain number', () {
      expect(Calibration('12').value, equals(12));
    });
  });
}

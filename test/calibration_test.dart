import 'package:aoc2023/calibration.dart';
import 'package:test/test.dart';

void main() {
  group('$Calibration', () {
    test('parses calibration value', () {
      expect(Calibration('12').value, equals(12));
      expect(Calibration('7').value, equals(77));
      expect(Calibration('a1b2c3d').value, equals(13));
    });

    test('throws for no digits', () {
      expect(() => Calibration('').value, throwsRangeError);
    });
  });
}

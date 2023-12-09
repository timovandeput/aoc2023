import 'package:aoc2023/calibration.dart';
import 'package:test/test.dart';

void main() {
  group('$Calibration', () {
    test('parses calibration value', () {
      expect(Calibration('12').value, equals(12));
      expect(Calibration('7').value, equals(77));
      expect(Calibration('a1b2c3d').value, equals(13));

      expect(Calibration('1abc2').value, equals(12));
      expect(Calibration('pqr3stu8vwx').value, equals(38));
      expect(Calibration('a1b2c3d4e5f').value, equals(15));
      expect(Calibration('treb7uchet').value, equals(77));
    });

    test('converts words to digits', () {
      expect(Calibration('one').value, equals(11));
      expect(Calibration('two').value, equals(22));
      expect(Calibration('three').value, equals(33));
      expect(Calibration('four').value, equals(44));
      expect(Calibration('five').value, equals(55));
      expect(Calibration('six').value, equals(66));
      expect(Calibration('seven').value, equals(77));
      expect(Calibration('eight').value, equals(88));
      expect(Calibration('nine').value, equals(99));
    });

    test('expands embedded words to digits', () {
      expect(Calibration('two1nine').value, equals(29));
      expect(Calibration('eightwothree').value, equals(83));
      expect(Calibration('abcone2threexyz').value, equals(13));
      expect(Calibration('xtwone3four').value, equals(24));
      expect(Calibration('4nineeightseven2').value, equals(42));
      expect(Calibration('zoneight234').value, equals(14));
      expect(Calibration('7pqrstsixteen').value, equals(76));
    });

    test('decodes concatenated words', () {
      expect(Calibration('twone').value, equals(21));
      expect(Calibration('abtwonecd').value, equals(21));
    });

    test('ignores any zeroes', () {
      expect(Calibration('zero120').value, equals(12));
    });

    test('throws for no digits', () {
      expect(() => Calibration('').value, throwsRangeError);
    });
  });
}

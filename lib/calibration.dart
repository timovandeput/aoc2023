class Calibration {
  const Calibration(this.text);

  final String text;

  int get value => 10 * text.firstDigit + text.lastDigit;
}

extension on String {
  int get firstDigit {
    for (var index = 0; index < length; index++) {
      for (final key in _digits.keys) {
        if (substring(index).startsWith(key)) {
          return _digits[key]!;
        }
      }
    }
    throw RangeError('No digit found in $this');
  }

  int get lastDigit {
    for (var index = length; index > 0; index--) {
      for (final key in _digits.keys) {
        if (substring(0, index).endsWith(key)) {
          return _digits[key]!;
        }
      }
    }
    throw RangeError('No digit found in $this');
  }
}

const _digits = {
  '1': 1,
  '2': 2,
  '3': 3,
  '4': 4,
  '5': 5,
  '6': 6,
  '7': 7,
  '8': 8,
  '9': 9,
  'one': 1,
  'two': 2,
  'three': 3,
  'four': 4,
  'five': 5,
  'six': 6,
  'seven': 7,
  'eight': 8,
  'nine': 9,
};

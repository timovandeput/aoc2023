import 'dart:io';

import 'package:aoc2023/calibration.dart';

void main() {
  // day1();
}

void day1() {
  final file = File('assets/day1/input1.txt');
  final sum = file
      .readAsLinesSync()
      .map((line) => Calibration(line).value)
      .reduce((prev, next) => prev + next);
  print('Calibration value: $sum');
}

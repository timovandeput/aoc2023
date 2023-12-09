import 'dart:io';

import 'package:aoc2023/calibration.dart';
import 'package:aoc2023/game.dart';

void main() {
  // day1();
  day2();
}

void day1() {
  final file = File('assets/day1/input1.txt');
  final sum = file
      .readAsLinesSync()
      .map((line) => Calibration(line).value)
      .reduce((prev, next) => prev + next);
  print('Calibration value: $sum');
}

void day2() {
  final file = File('assets/day2/input.txt');
  final game = Game(maxRed: 12, maxGreen: 13, maxBlue: 14);
  var total = 0;
  for (var line in file.readAsLinesSync()) {
    final split = line.split(':');
    final gameId = int.parse(split[0].split(' ')[1]);
    final instructions = split[1];
    print('Game $gameId');
    try {
      game.play(instructions);
      total += gameId;
    } on ArgumentError catch (e) {
      print('Skipped!');
    }
  }
  print('Total: $total');
}

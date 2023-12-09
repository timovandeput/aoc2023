import 'dart:io';

import 'package:aoc2023/calibration.dart';
import 'package:aoc2023/game.dart';

void main() {
  // day1b();
  // day2a();
  day2b();
}

void day1b() {
  final file = File('assets/day1/input1.txt');
  final sum = file
      .readAsLinesSync()
      .map((line) => Calibration(line).value)
      .reduce((prev, next) => prev + next);
  print('Calibration value: $sum');
}

void day2a() {
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

void day2b() {
  const max = 999;
  final file = File('assets/day2/input.txt');
  var power = 0;
  for (var line in file.readAsLinesSync()) {
    final game = Game(maxRed: max, maxGreen: max, maxBlue: max);
    final split = line.split(':');
    final gameId = int.parse(split[0].split(' ')[1]);
    final instructions = split[1];

    game.play(instructions);
    print('Game $gameId => ${game.power}');
    power += game.power;
  }
  print('Sum of the powers: $power');
}

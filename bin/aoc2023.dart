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
  for (var line in file.readAsLinesSync()) {
    final split = line.split(':');
    print(split[0]);
    for (final hand in split[1].split(';')) {
      final cubes = hand.split(',');
      print('$cubes');
      int red = 0, green = 0, blue = 0;
      for (final cube in cubes) {
        final qtyColor = cube.trim().split(' ')[0];
        final quantity = int.parse(qtyColor[0]);
        switch (qtyColor[1]) {
          case 'red':
            red = quantity;
          case 'green':
            green = quantity;
          case 'blue':
            blue = quantity;
        }
        try {
          final hand = Hand(red: red, green: green, blue: blue);
          game.grab(hand);
        } catch (e) {
          print('Cannot grab $hand from $game');
        }
      }
    }
  }
}

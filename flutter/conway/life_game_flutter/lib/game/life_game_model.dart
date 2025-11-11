import 'package:flutter/material.dart';
import 'life_game_engine.dart';

class LifeGameModel extends ChangeNotifier {
  final int gridSize;
  late LifeGameEngine _engine;
  int _generation = 0;

  LifeGameModel({this.gridSize = 10}) {
    _engine = LifeGameEngine(gridSize: gridSize);
  }

  List<List<bool>> get grid => _engine.grid;
  int get generation => _generation;

  void toggleCell(int x, int y) {
    _engine.toggleCell(x, y);
    notifyListeners();
  }

  void nextGeneration() {
    _engine.nextGeneration();
    _generation++;
    notifyListeners();
  }

  void goToGeneration(int target) {
    _engine.clear();
    _generation = 0;
    while (_generation < target) {
      _engine.nextGeneration();
      _generation++;
    }
    notifyListeners();
  }

  void reset() {
    _engine.clear();
    _generation = 0;
    notifyListeners();
  }
}

class LifeGameEngine {
  final int gridSize;
  List<List<bool>> grid;

  LifeGameEngine({required this.gridSize, List<List<bool>>? initialGrid})
      : grid = initialGrid ??
            List.generate(
                gridSize, (_) => List.generate(gridSize, (_) => false));

  List<List<bool>> nextGeneration() {
    List<List<bool>> next = List.generate(
      gridSize,
      (i) => List.generate(gridSize, (j) => false),
    );
    for (int x = 0; x < gridSize; x++) {
      for (int y = 0; y < gridSize; y++) {
        int liveNeighbors = 0;
        for (int dx = -1; dx <= 1; dx++) {
          for (int dy = -1; dy <= 1; dy++) {
            if (dx == 0 && dy == 0) continue;
            int nx = x + dx;
            int ny = y + dy;
            if (nx >= 0 && nx < gridSize && ny >= 0 && ny < gridSize) {
              if (grid[nx][ny]) liveNeighbors++;
            }
          }
        }
        if (grid[x][y]) {
          next[x][y] = liveNeighbors == 2 || liveNeighbors == 3;
        } else {
          next[x][y] = liveNeighbors == 3;
        }
      }
    }
    grid = next;
    return grid;
  }

  void toggleCell(int x, int y) {
    grid[x][y] = !grid[x][y];
  }

  void clear() {
    grid =
        List.generate(gridSize, (_) => List.generate(gridSize, (_) => false));
  }

  List<List<bool>> copyGrid() {
    return List.generate(gridSize, (i) => List.from(grid[i]));
  }
}

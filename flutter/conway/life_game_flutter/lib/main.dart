import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:provider/provider.dart';
import 'game/life_game_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => LifeGameModel(gridSize: 10),
      child: const LifeGameApp(),
    ),
  );
}

class LifeGameApp extends StatelessWidget {
  const LifeGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conway Life Game',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const LifeGamePage(),
    );
  }
}

class LifeGamePage extends StatefulWidget {
  const LifeGamePage({super.key});

  @override
  State<LifeGamePage> createState() => _LifeGamePageState();
}

class _LifeGamePageState extends State<LifeGamePage> {
  final FocusNode _focusNode = FocusNode();
  Timer? _repeatTimer;
  bool _rightKeyPressed = false;
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _repeatTimer?.cancel();
    super.dispose();
  }

  void _startRepeatNextGeneration(LifeGameModel model) {
    if (_repeatTimer != null && _repeatTimer!.isActive) return;
    _repeatTimer = Timer.periodic(const Duration(milliseconds: 120), (_) {
      if (_rightKeyPressed) {
        model.nextGeneration();
      } else {
        _repeatTimer?.cancel();
      }
    });
  }

  void _stopRepeatNextGeneration() {
    _rightKeyPressed = false;
    _repeatTimer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<LifeGameModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conway Life Game'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Tooltip(
              message: '오른쪽 방향키: 다음 단계 이동',
              child: IconButton(
                icon: const Icon(Icons.info_outline),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body: KeyboardListener(
        focusNode: _focusNode,
        autofocus: true,
        onKeyEvent: (event) {
          if (event is KeyDownEvent) {
            if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
              if (!_rightKeyPressed) {
                _rightKeyPressed = true;
                _startRepeatNextGeneration(model);
              }
            }
          } else if (event is KeyUpEvent) {
            if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
              _stopRepeatNextGeneration();
            }
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('세대: ${model.generation}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Expanded(
              child: Center(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: model.gridSize,
                    ),
                    itemCount: model.gridSize * model.gridSize,
                    itemBuilder: (context, index) {
                      int x = index ~/ model.gridSize;
                      int y = index % model.gridSize;
                      return GestureDetector(
                        onTap: () => model.toggleCell(x, y),
                        child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color:
                                model.grid[x][y] ? Colors.black : Colors.white,
                            border: Border.all(color: Colors.grey),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: model.nextGeneration,
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('한 단계 진행'),
                ),
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: model.reset,
                  icon: const Icon(Icons.refresh),
                  label: const Text('초기화'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 80,
                    child: TextField(
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: '단계',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      int? target = int.tryParse(_controller.text);
                      if (target != null && target >= 0) {
                        model.goToGeneration(target);
                      }
                    },
                    child: const Text('확인'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

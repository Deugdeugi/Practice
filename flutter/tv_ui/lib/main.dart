import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(const TVHomeUI());

class TVHomeUI extends StatelessWidget {
  const TVHomeUI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _buildTopBanner(),
              const SizedBox(height: 20),
              _buildCategoryGrid(),
              const SizedBox(height: 20),
              _buildAppIconsRow(),
              const SizedBox(height: 20),
              _buildContentSection("Recent Input"),
              const SizedBox(height: 20),
              _buildContentSection("Top Picks For You"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBanner() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            'https://images.unsplash.com/photo-1606112219348-204d7d8b94ee?auto=format&fit=crop&w=1000&q=80',
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
          ),
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text("Watch more"),
          ),
        ),
        const Positioned(
          bottom: 16,
          left: 16,
          child: Text(
            "MARVEL\nSPIDER-MAN",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryGrid() {
    final random = Random();
    final List<String> categories =
        List.generate(20, (index) => "Category ${index + 1}");

    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: categories.map((category) {
          final color = Color.fromARGB(
            255,
            random.nextInt(155) + 100,
            random.nextInt(155) + 100,
            random.nextInt(155) + 100,
          );
          return Container(
            width: 200,
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                category,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildAppIconsRow() {
    final iconUrls = List.generate(
      20,
      (index) => 'https://picsum.photos/seed/movie$index/160/160',
    );

    return SizedBox(
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: iconUrls
            .map(
              (url) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    url,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildContentSection(String title) {
    final posterUrls = List.generate(
      10,
      (index) => 'https://picsum.photos/seed/movie$index/160/160',
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: posterUrls
                .map(
                  (url) => Container(
                    margin: const EdgeInsets.only(right: 12),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        url,
                        width: 240,
                        height: 160,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch, // 기본 터치
        PointerDeviceKind.mouse, // 마우스 드래그 허용
        PointerDeviceKind.trackpad, // 트랙패드
      };
}

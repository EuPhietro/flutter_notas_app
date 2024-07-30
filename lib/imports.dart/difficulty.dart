import 'package:flutter/material.dart';
import 'tela_1.dart';

class Difficulty extends StatefulWidget {
  final int difficultyLevel;

  const Difficulty({
    required this.difficultyLevel,
    super.key,
    required this.widget,
  });

  final Tasks widget;

  @override
  State<Difficulty> createState() => _DifficultyState();
}

class _DifficultyState extends State<Difficulty> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.star,
                  size: 20,
                  color: (widget.difficultyLevel >= 1)
                      ? Colors.amber
                      : Colors.amber[100]),
              Icon(Icons.star,
                  size: 20,
                  color: ((widget.difficultyLevel >= 2)
                      ? Colors.amber
                      : Colors.amber[100])),
              Icon(Icons.star,
                  size: 20,
                  color: (widget.difficultyLevel >= 3)
                      ? Colors.amber
                      : Colors.amber[100]),
              Icon(Icons.star,
                  size: 20,
                  color: (widget.difficultyLevel >= 4)
                      ? Colors.amber
                      : Colors.amber[100]),
              Icon(Icons.star,
                  size: 20,
                  color: (widget.difficultyLevel >= 5)
                      ? Colors.amber
                      : Colors.amber[100]),
            ],
          ),
        ),
      ],
    );
  }
}

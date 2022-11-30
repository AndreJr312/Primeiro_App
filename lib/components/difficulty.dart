import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {
  final int difficultyLevel;

  const Difficulty({
    required this.difficultyLevel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.circle_sharp,
          size: 15,
          color: (difficultyLevel >= 1) ? Colors.green : Colors.green[100],
        ),
        Icon(
          Icons.circle_sharp,
          size: 15,
          color: (difficultyLevel >= 2) ? Colors.green : Colors.green[100],
        ),
        Icon(
          Icons.circle_sharp,
          size: 15,
          color: (difficultyLevel >= 3) ? Colors.green : Colors.green[100],
        ),
        Icon(
          Icons.circle_sharp,
          size: 15,
          color: (difficultyLevel >= 4) ? Colors.green : Colors.green[100],
        ),
        Icon(
          Icons.circle_sharp,
          size: 15,
          color: (difficultyLevel >= 5) ? Colors.green : Colors.green[100],
        ),
      ],
    );
  }
}
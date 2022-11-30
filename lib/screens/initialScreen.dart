import 'package:flutter/material.dart';
import '../components/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text(
          'TAREFAS',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0,
        duration: const Duration(milliseconds: 700),
        child: ListView(
          children: const [
            Task('Aprender Flutter', 'assets/images/flutter.png', 4),
            Task('Estudar Dart', 'assets/images/dart.png', 3),
            Task('Ir para Academia', 'assets/images/academia.jpeg', 5),
            Task('Tocar Violão', 'assets/images/violao.jpeg', 1),
            Task('Fazer o primeiro app', 'assets/images/app.png', 4),
            SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
        child: const Icon(
          Icons.remove_red_eye_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}

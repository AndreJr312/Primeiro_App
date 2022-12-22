import 'package:flutter/material.dart';
import 'package:alura/components/difficulty.dart';

class Task extends StatefulWidget {
  final String nomeTarefa;
  final String foto;
  final int dificuldade;

  Task(this.nomeTarefa, this.foto, this.dificuldade, {Key? key})
      : super(key: key);

  int nivel = 0;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {


  bool assetOrNetwork() {
    if (widget.foto.contains("http")) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.lightGreen[700],
              ),
              height: 150,
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black12,
                        ),
                        width: 80,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: assetOrNetwork()
                              ? Image.asset(
                                  widget.foto,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  widget.foto,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              widget.nomeTarefa,
                              style: const TextStyle(
                                fontSize: 20,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Difficulty(
                            difficultyLevel: widget.dificuldade,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                widget.nivel++;
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.keyboard_arrow_up,
                                  color: Colors.white,
                                ),
                                Text(
                                  'UP',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SizedBox(
                        width: 250,
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: (widget.dificuldade > 0)
                              ? (widget.nivel / widget.dificuldade) / 10
                              : 1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Nível ${widget.nivel}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

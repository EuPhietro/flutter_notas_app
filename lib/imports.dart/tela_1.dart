import 'package:flutter/material.dart';
import 'difficulty.dart';

class Tasks extends StatefulWidget {
  final String nome;
  final String foto;
  int dificuldade;

  Tasks(
      {required this.nome,
      required this.foto,
      required this.dificuldade,
      super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  link(foto) {
    return Image.network(foto);
  }

  int nivel = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: Colors.blue[600],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, top: 4, bottom: 8),
                        child: SizedBox(
                          width: 200,
                          height: 10,
                          child: LinearProgressIndicator(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            backgroundColor: Colors.amber,
                            color: Colors.green,
                            value: (widget.dificuldade > 0)
                                ? (nivel / widget.dificuldade) / 10
                                : 1,
                          ),
                        ),
                      ),
                      Text(
                        "Seu nível é: $nivel",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 70,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey[600],
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: Image.network(
                              widget.foto,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: SizedBox(
                                      width: 200,
                                      child: Text(
                                        widget.nome,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Difficulty(
                              difficultyLevel: widget.dificuldade,
                              widget: Tasks(
                                  nome: widget.nome,
                                  foto: widget.foto,
                                  dificuldade: widget.dificuldade),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 62,
                              width: 72,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    nivel++;
                                  });
                                },
                                style: ButtonStyle(
                                  iconColor: WidgetStateProperty.all(
                                    Colors.white,
                                  ),
                                  backgroundColor: WidgetStateProperty.all(
                                    Colors.blue,
                                  ),
                                ),
                                child: const Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.arrow_drop_up_sharp,
                                    ),
                                    Text(
                                      'UP',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                      textAlign: TextAlign.left,
                                      textDirection: TextDirection.ltr,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}


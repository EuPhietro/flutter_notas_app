import 'package:flutter/material.dart';
import '../imports.dart/tela_1.dart';

class InitialScream extends StatefulWidget {
  const InitialScream({super.key});

  @override
  State<InitialScream> createState() => _InitialScreamState();
}

class _InitialScreamState extends State<InitialScream> {
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: const Icon(Icons.menu_open),
          backgroundColor: Colors.blue,
          title: const Text(
            'Tarefas',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        body: AnimatedOpacity(
          opacity: opacidade ? 1 : 0,
          duration: const Duration(milliseconds: 800),
          child: ListView(
            children: [
              Tasks(
                nome: 'Aprender flutter',
                foto:
                    'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
                dificuldade: 0,
              ),
              Tasks(
                nome: 'Aprender flutter',
                foto:
                    'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
                dificuldade: 1,
              ),
              Tasks(
                nome: 'Aprender flutter',
                foto:
                    'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
                dificuldade: 10,
              ),
              Tasks(
                nome: 'Aprender flutter',
                foto:
                    'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
                dificuldade: 3,
              ),
              const SizedBox(
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
          backgroundColor: Colors.blue,
          child: const Icon(Icons.visibility),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

// Defina uma chave global para o ScaffoldMessenger
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class GlobalSnackBar extends StatefulWidget {
  const GlobalSnackBar({super.key});

  @override
  State<GlobalSnackBar> createState() => _GlobalSnackBarState();
}

class _GlobalSnackBarState extends State<GlobalSnackBar> {
  int _incrementCounter = 0;
  void showGlobalSnackBar(String message) {
    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: scaffoldMessengerKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Título'),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(" Aperte o botão  "),
            Text("$_incrementCounter", style: const TextStyle(fontSize: 24),),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(
              () {
                _incrementCounter++;
              },
            );
            showGlobalSnackBar("Você apertou o botão");
          },
        ),
      ),
    );
  }
}

// Função para mostrar o SnackBar globalmente

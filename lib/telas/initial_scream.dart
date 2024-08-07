import 'package:flutter/material.dart';

import 'package:my_app_flutter/data/task_inherited.dart';
import 'package:my_app_flutter/telas/form_screean.dart';
import '../imports.dart/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

Mensage() {}
void onButtonClicked(BuildContext context, String route) {
  Navigator.of(context).pushNamed(route);
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TaskInherited(
        child: Scaffold(
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
          body: ListView(
            children: [const Placeholder()],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              onButtonClicked(context, "/formPage");
            },
            backgroundColor: Colors.blue,
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}

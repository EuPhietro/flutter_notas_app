import 'package:flutter/material.dart';
import 'package:my_app_flutter/imports.dart/Task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({super.key, required this.child}) : super(child: child);

  @override
  final Widget child;

  static TaskInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskInherited>();
  }

 final listTask = <Tasks>[
    Tasks(
      nome: 'Aprender flutter',
      foto: 'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
      dificuldade: 0,
    ),
    Tasks(
      nome: 'Aprender flutter',
      foto: 'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
      dificuldade: 1,
    ),
    Tasks(
      nome: 'Aprender flutter',
      foto: 'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
      dificuldade: 10,
    ),
    Tasks(
      nome: 'Aprender flutter',
      foto: 'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
      dificuldade: 3,
    ),
  ];

   newTask({
    required String name,
    required String url,
    required int difficulty,
  }) {
    listTask.add(
      Tasks(nome: name, foto: url, dificuldade: difficulty),
    );
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.listTask.length != listTask.length;
  }
}

import 'package:alura_flutter_curso_2/components/tasks.dart';
import 'package:flutter/material.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Tasks> taskList = [
    Tasks('Estudar Flutter', 'assets/images/flutter.png', 3),
    Tasks('Andar de Bike', 'assets/images/bike.webp', 2),
    Tasks('Ler 50 páginas', 'assets/images/ler.jpg', 1),
    Tasks('Meditar', 'assets/images/meditar.jpeg', 4),
    Tasks('Jogar', 'assets/images/jogar.jpg', 0),
  ];

  void add(String nome,String foto, int dificuldade){
    print('Tamanho da lista: ${taskList.length}');
    taskList.add(Tasks(nome, foto, dificuldade));
    print('Tamanho da lista: ${taskList.length}');
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No Task found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return taskList.length != oldWidget.taskList.length;
  }
}

import 'package:alura_flutter_curso_2/data/task_inherited.dart';
import 'package:alura_flutter_curso_2/screens/form.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarefas'),
        leading: Container(),
      ),
      body: Container(
        color: Color.fromARGB(255, 208, 221, 237),
        child: ListView( // vai ter que ser um Inherited Widget com as informações das tarefas todas! e a habilidade de receber novas tarefas!
          //ListView ou ListView.builder? (vai receber novas tarefas depois né...)
          //conferir as transações no curso 3 de flutter(old)

          children: TaskInherited.of(context).taskList,
          padding: EdgeInsets.only(top: 8,bottom: 70),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FormScreen()),
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  final BuildContext taskContext;

  const FormScreen({Key? key, required this.taskContext}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Nova Tarefa'),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Container(
                height: 600,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 3),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Insira o nome da Tarefa!';
                          }
                          return null;
                        },
                        controller: nameController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Nome',
                            fillColor: Colors.white70,
                            filled: true),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty || int.parse(value) > 5) {
                            return 'Insira a Dificuldade de 1 a 5!';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        controller: difficultyController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Dificuldade',
                            fillColor: Colors.white70,
                            filled: true),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        onChanged: (text) {
                          print(imageController.text);
                          setState(() {});
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Insira a URL da imagem!';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.url,
                        controller: imageController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Imagem',
                            fillColor: Colors.white70,
                            filled: true),
                      ),
                    ),
                    Container(
                      width: 72,
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 2, color: Colors.blue)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          imageController.text,
                          fit: BoxFit.cover,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return Image.asset('assets/images/nophoto.png');
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print('Nome:${nameController.text}');
                            print('Dificuldade:${difficultyController.text}');
                            print('Imagem:${imageController.text}');
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Salvando nova Tarefa')));
                          }
                        },
                        child: Text('Adicionar!'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

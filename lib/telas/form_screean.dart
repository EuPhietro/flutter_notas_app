import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FormScream',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        brightness: Brightness.light
      ),
      home: Form(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'FormScream',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Name Controller
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (value != null && value.isEmpty) {
                          return 'O campo está vazio';
                        }
                        return null;
                      },
                      controller: nameController,
                      decoration: InputDecoration(
                        label: const Text('Nome'),
                        helper: const Text('Insira o nome da tarefa'),
                        filled: true,
                        fillColor: Colors.white24,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),

                  ///Difficulty Controller
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: TextFormField(
                      controller: difficultyController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        label: const Text('Difficulty'),
                        helper:
                            const Text('A dificuldade deve estar entre 1 e 5'),
                        filled: true,
                        fillColor: Colors.white24,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),

                  ///Image Controller
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: TextFormField(
                      controller: _imageController,
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'A url não é válida';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        label: const Text('Url'),
                        helper: const Text('Insira uma Url'),
                        filled: true,
                        fillColor: Colors.white24,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),

                  ///PreView Image
                  Container(
                    width: 72,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),

                      ///imageController.text: Transforma as informações recebidas pelo imageControler em String
                      child: Image.network(
                        _imageController.text,
                        fit: BoxFit.cover,
                        errorBuilder: (BuildContext context, Object exeption,
                            StackTrace? stackTrace) {
                          return Image.asset('assets/images/log.png');
                        },
                      ),
                    ),
                  ),

                  ///ElevatedButton
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.blue[100]),
                      child: const Text('Adicionar'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

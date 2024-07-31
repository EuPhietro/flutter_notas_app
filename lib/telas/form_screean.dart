import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FormScream',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
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
                    padding: const EdgeInsets.only(top: 15),
                    child: TextFormField(
                      onChanged: (text) {
                        setState(() {});
                      },
                      controller: imageController,
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'O campo Url está';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.url,
                      decoration: InputDecoration(
                        label: const Text('Insira uma Url'),
                        helper: const Text('Insira uma url válida'),
                        filled: true,
                        fillColor: Colors.white24,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  //imageContainer
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    height: 100,
                    width: 72,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(1, 45, 126, 232)
                              .withOpacity(0.5),
                          offset: const Offset(3, 3),
                          blurRadius: 5.0,
                        )
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        imageController.text,
                        fit: BoxFit.cover,
                        errorBuilder: (BuildContext context, Object exeption,
                            StackTrace? stackTrace){
                          return Image.asset("assets/images/log.png");
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
                        textStyle: const TextStyle(color: Colors.white),
                        shape: const ContinuousRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
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

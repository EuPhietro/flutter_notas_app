import 'package:flutter/material.dart';
import 'package:my_app_flutter/_communs/snackbar.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void onButtonClicked(BuildContext context, String route) {
    Navigator.popAndPushNamed(context, route);
  }

  void showGlobalSnackBar({required message, bool isErro = false}) {
    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: (isErro ? Colors.green : Colors.red),
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
      ),
    );
  }

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
        key: _formKey,
        child: ScaffoldMessenger(
          key: scaffoldMessengerKey,
          child: Scaffold(
            appBar: AppBar(
              title: const Text(
                'FormScream',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: const SizedBox(),
              backgroundColor: Colors.blue[300],
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
                        validator: (String? text) {
                          if (text != null && text.isEmpty) {
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
                        validator: (value) {
                          if (value!.isEmpty ||
                              int.parse(value) < 1 ||
                              int.parse(value) > 5) {
                            return 'A dificuldade deve estar entre 1 e 5';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Difficulty'),
                          helper: const Text(
                              'A dificuldade deve estar entre 1 e 5'),
                          filled: true,
                          fillColor: Colors.white24,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),

                    ///imageController
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: TextFormField(
                        onChanged: (text) {
                          setState(() {
                            imageController.text = text;
                          });
                        },
                        controller: imageController,
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return 'O campo Url está vazio';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.url,
                        decoration: InputDecoration(
                          label: const Text('Insira uma Url'),
                          helper: const Text('Insira uma url'),
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
                        color: const Color.fromARGB(255, 97, 163, 217),
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
                              StackTrace? stackTrace) {
                            return Image.asset("assets/images/log.png");
                          },
                        ),
                      ),
                    ),

                    ///ElevatedButton
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            showGlobalSnackBar(
                                message: "Tarefa criada!", isErro: true);
                            Navigator.pop(context);
                            return onButtonClicked(context, "/initialPage");
                          } else {
                            showGlobalSnackBar(
                                message: "Ops, algo deu errado!",
                                isErro: false);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          textStyle:
                              const TextStyle(fontWeight: FontWeight.bold),
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
      ),
    );
  }
}

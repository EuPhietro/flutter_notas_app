import 'package:flutter/material.dart';

void main() {}

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Form(
        key: _formKey,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Nova tela',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            backgroundColor: Colors.amber,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 800,
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  border: Border.all(color: Colors.black, width: 0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      //Nome Controller
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        validator: (String? value) {
                          if (value != null && value.isEmpty) {
                            return 'O campo nome está vazio,';
                          }
                          return null;
                        },
                        textAlign: TextAlign.center,
                        controller: nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'Nome',
                          fillColor: Colors.white24,
                          filled: true,
                        ),
                      ),
                    ),
                    Padding(
                      //Difficulty Controller
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        controller: difficultyController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'Dificuldade',
                          fillColor: Colors.white24,
                          filled: true,
                        ),
                        validator: (value) {
                          if (value!.isEmpty ||
                              int.parse(value) > 5 ||
                              int.parse(value) < 1) {
                            return 'Insira uma dificuldade entre 1 e 5';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      //Image Controller
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        onChanged: (text) {
                          setState(() {});
                        },
                        keyboardType: TextInputType.url,
                        textAlign: TextAlign.center,
                        controller: imageController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'Image',
                          fillColor: Colors.white24,
                          filled: true,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Insira um URL de imagem';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      //Image container
                      height: 100,
                      width: 72,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.blue),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          imageController.text,
                          //Tratando a exceção errorBuilder
                          //Valor padrão
                          errorBuilder: (BuildContext context, Object exeption,
                              StackTrace? stackTrace) {
                            return Image.asset('assets/images/log.png');
                          },
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      //ElevatedButton
                      padding: const EdgeInsets.only(top: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.blue[100]),
                        child: const Text('Adicionar'),
                      ),
                    ),
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

import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  //criando um controlador para cada vez que os campos forem preenchidos/alterados
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  // chave para o formulário olhar o estado dos campos preenchidos
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Cadastrar Tarefa",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 750,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 3),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (value != null && value.isEmpty) {
                          return "Insira o nome da tarefa";
                        }
                        return null;
                      },
                      controller: nameController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Nome Tarefa",
                        filled: true,
                        fillColor: Colors.white70,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty ||
                            int.parse(value) > 5 ||
                            int.parse(value) < 1) {
                          return "Insira uma dificuldade entre 1 e 5";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: difficultyController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Dificuldade",
                        filled: true,
                        fillColor: Colors.white70,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      onChanged: (text) {
                        setState(() {});
                      },
                      validator: (String? value) {
                        if (value != null && value.isEmpty) {
                          return "Insira um URL de imagem!";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.url,
                      controller: imageController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Imagem",
                        filled: true,
                        fillColor: Colors.white70,
                      ),
                    ),
                  ),
                  Container(
                    height: 200,
                    width: 160,
                    decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 2,
                        color: Colors.lightGreen,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        imageController.text,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stacktrace) {
                          return Image.asset("assets/images/noPhoto.png");
                        },
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Registrando tarefa"),
                        ));
                      }
                    },
                    child: const Text(
                      "Adicionar",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

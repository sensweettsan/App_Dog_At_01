import 'package:app_dogs/data/repositories/user_repository.dart';
import 'package:app_dogs/presentation/viewmodels/user_viewmodel.dart';
import 'package:flutter/material.dart';

class RegisterUserPage extends StatefulWidget {
  const RegisterUserPage({super.key});

  @override
  State<RegisterUserPage> createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final usuarioController = TextEditingController();
  final UserViewmodel userViewModel = UserViewmodel(UserRepository());

  final _formKey = GlobalKey<FormState>();

  registerUserPage() async {
    if (_formKey.currentState?.validate() ?? false) {
      final email = emailController.text;
      final usuario = usuarioController.text;
      final senha = senhaController.text;

      final message = await userViewModel.registerUser(email, usuario, senha);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(message),
          backgroundColor:
              message.contains('Sucesso') ? Colors.green : Colors.red,
        ));
        if (message.contains('Sucesso')) {
          /*Navigator.pushReplacement(
          context,
          MaterialPageRoute(build: (context) => const LoginPage()),
          );*/
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastre seu usuario'),
        backgroundColor: const Color.fromARGB(255, 255, 88, 200),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    child: Column(
                      children: [
                        const Text(
                          'Faça seu cadastro',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 200, 103, 13),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: usuarioController,
                          decoration: const InputDecoration(
                            labelText: 'Usuario',
                            labelStyle:
                                TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor entre com um usuario';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

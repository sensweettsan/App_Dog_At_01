import 'package:app_dogs/data/repositories/user_repository.dart';
import 'package:app_dogs/presentation/viewmodels/user_viewmodel.dart';
import 'package:flutter/material.dart';

import '../../../data/models/user/user_model.dart';

class RegisterUserPage extends StatefulWidget {
  const RegisterUserPage({super.key});

  @override
  State<RegisterUserPage> createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final usuarioController = TextEditingController();
  final UserViewmodel _viewModel = UserViewmodel(UserRepository());
  
  Future<void> saveUser() async {
    if (_formKey.currentState!.validate()){
      final user = User(
        senha: senhaController.text,
        usuario: usuarioController.text,
        email: emailController.text,
    );
    await _viewModel.addUser(user);

    if (mounted){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Usuario adicionado com sucesso!')),
      );
      NavigationBar.pop(context);
    }
    }
  }





  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
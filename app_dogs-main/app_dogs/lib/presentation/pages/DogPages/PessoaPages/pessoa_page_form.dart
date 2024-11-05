//estruturar o script para (Pessoa) e ver as importações.
// criar os outros arquivos (Pessoas Pages).
// ver como faz a home page.
//Estruturar a perzonalização das interfaces da WEB.

import 'package:app_dogs/data/models/pessoa/pessoa_model.dart';
import 'package:app_dogs/presentation/viewmodels/pessoa_viewmodel.dart';
import 'package:flutter/material.dart';

import '../../../../data/repositories/pessoa_repository.dart';

class PessoaPageForm extends StatefulWidget {
  const PessoaPageForm({super.key});

  @override
  State<PessoaPageForm> createState() => _PessoaPageFormState();
}

class _PessoaPageFormState extends State<PessoaPageForm> {
  final _formKey = GlobalKey<FormState>();
  final nomeController = TextEditingController();
  final telefoneController = TextEditingController();
  final emailController = TextEditingController();
  final enderecoController = TextEditingController();
  final PessoaViewmodel _viewModel = PessoaViewmodel(PessoaRepository());

  Future<void> savePessoa() async {
    if (_formKey.currentState!.validate()) {
      final pessoa = Pessoa(
          nome: nomeController.text,
          telefone: telefoneController.text,
          email: emailController.text,
          endereco: enderecoController.text);
      // print(dog.toMap());
      await _viewModel.addPessoa(pessoa);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Cliente Adicionado Com Sucesso!')),
        );
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro dos clientes'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Text(
                          'Cadastrar um novo Cliente',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: nomeController,
                          decoration: InputDecoration(
                            labelText: 'Nome',
                            labelStyle: TextStyle(color: Colors.teal.shade700),
                            border: const OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.teal.shade700),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor entre com um nome';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: telefoneController,
                          decoration: InputDecoration(
                            labelText: 'telefone',
                            labelStyle: TextStyle(color: Colors.teal.shade700),
                            border: const OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.teal.shade700),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor entre com a idade';
                            }
                            if (int.tryParse(value) == null) {
                              return 'Por favor entre com um número válido';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 30),
                        ElevatedButton.icon(
                          onPressed: savePessoa,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            padding: const EdgeInsets.symmetric(
                              vertical: 15.0,
                              horizontal: 30.0,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          icon: const Icon(Icons.save, size: 24),
                          label: const Text(
                            'Salvar',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

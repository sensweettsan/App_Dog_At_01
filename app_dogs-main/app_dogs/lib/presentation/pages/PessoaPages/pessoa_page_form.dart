//estruturar o script para (Pessoa) e ver as importações.
// criar os outros arquivos (Pessoas Pages).
// ver como faz a home page.
//Estruturar a perzonalização das interfaces da WEB.

import 'dart:convert';

import 'package:app_dogs/data/models/pessoa/pessoa_model.dart';
import 'package:app_dogs/presentation/viewmodels/pessoa_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../data/repositories/pessoa_repository.dart';

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
  final enderecoAvRuaController = TextEditingController();
  final enderecoNumeroController = TextEditingController();
  final enderecoCepController = TextEditingController();
  final enderecoCidadeController = TextEditingController();
  final enderecoEstadoController = TextEditingController();
  final PessoaViewmodel _viewModel = PessoaViewmodel(PessoaRepository());

  Future<void> savePessoa() async {
    if (_formKey.currentState!.validate()) {
      final pessoa = Pessoa(
        nome: nomeController.text,
        telefone: telefoneController.text,
        email: emailController.text,
        enderecoAvRua: enderecoAvRuaController.text,
        enderecoCep: enderecoNumeroController.text,
        enderecoNumero: enderecoNumeroController.text,
        enderecoCidade: enderecoCidadeController.text,
        enderecoEstado: enderecoEstadoController.text,
      );
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

  _buscarEndereco(String cep) async {
    if (cep.length != 8) return;

    try {
      final response =
          await http.get(Uri.parse('https://viacep.com.br/ws/$cep/json/'));

      if (!mounted) return; //verificar se o widget ainda está montado

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data.containKey('erro')) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('CEP não encontrado!')),
            );
          }
          return;
        }
        setState(() {
          enderecoAvRuaController.text = data['logradouro'] ?? '';
          enderecoCidadeController.text = data['localidade'] ?? '';
          enderecoEstadoController.text = data['uf'] ?? '';
        });
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Erro de rede ao buscar o endereço')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Erro de rede ao buscar o endereço')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro dos clientes'),
        backgroundColor: const Color.fromARGB(255, 255, 109, 223),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                              color: Color.fromARGB(255, 235, 98, 212),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: nomeController,
                            decoration: const InputDecoration(
                              labelText: 'Nome',
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0)),
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 0, 0, 0)),
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
                            decoration: const InputDecoration(
                              labelText: 'telefone',
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0)),
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 230, 107, 213)),
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
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: enderecoCepController,
                            decoration: const InputDecoration(
                              labelText: 'CEP',
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0)),
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 230, 107, 213)),
                              ),
                            ),
                            onChanged: (value) {
                              if (value.length == 8) _buscarEndereco(value);
                            },
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: enderecoAvRuaController,
                            decoration: const InputDecoration(
                              labelText: 'Avenida - Rua',
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0)),
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 230, 107, 213),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: enderecoNumeroController,
                            decoration: const InputDecoration(
                              labelText: 'Número',
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0)),
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 230, 107, 213),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: enderecoCidadeController,
                            decoration: const InputDecoration(
                              labelText: 'Cidade',
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0)),
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 230, 107, 213),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: enderecoEstadoController,
                            decoration: const InputDecoration(
                              labelText: 'Estado',
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0)),
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 230, 107, 213),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          ElevatedButton.icon(
                            onPressed: savePessoa,
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 250, 107, 207),
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
                              selectionColor: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ],
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

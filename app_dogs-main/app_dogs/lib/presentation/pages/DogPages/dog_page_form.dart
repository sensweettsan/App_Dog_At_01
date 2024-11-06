import 'package:flutter/material.dart';

import '../../../data/models/dogs/dog_model.dart';
import '../../../data/repositories/dog_repository.dart';
import '../../viewmodels/dog_viewmodel.dart';

class DogPageForm extends StatefulWidget {
  const DogPageForm({super.key});

  @override
  State<DogPageForm> createState() => _DogPageFormState();
}

class _DogPageFormState extends State<DogPageForm> {
  final _formKey = GlobalKey<FormState>();
  final nomeController = TextEditingController();
  final idadeController = TextEditingController();
  final DogViewModel _viewModel = DogViewModel(DogRepository());

  Future<void> saveDog() async {
    if (_formKey.currentState!.validate()) {
      final dog = Dog(
        name: nomeController.text,
        age: int.parse(idadeController.text),
      );
      // print(dog.toMap());
      await _viewModel.addDog(dog);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Dog Adicionado Com Sucesso!')),
        );
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Dogs'),
        backgroundColor: const Color.fromARGB(255, 248, 92, 235),
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
                          'Cadastrar um novo Dog',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 236, 73, 209),
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
                              borderSide: BorderSide(
                                  color:
                                      const Color.fromARGB(255, 253, 88, 226)),
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
                          controller: idadeController,
                          decoration: InputDecoration(
                            labelText: 'Idade',
                            labelStyle: TextStyle(
                                color: const Color.fromARGB(255, 243, 77, 207)),
                            border: const OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color:
                                      const Color.fromARGB(255, 240, 82, 227)),
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
                          onPressed: saveDog,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 245, 84, 218),
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

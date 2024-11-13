import 'package:flutter/material.dart';
import '../../../data/models/dogs/dog_model.dart';
import '../../../data/repositories/dog_repository.dart';
import '../../viewmodels/dog_viewmodel.dart';

class DogEditPage extends StatefulWidget {
  final Dog dog;

  const DogEditPage({super.key, required this.dog});

  @override
  DogEditPageState createState() => DogEditPageState();
}

class DogEditPageState extends State<DogEditPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final DogViewModel _viewModel = DogViewModel(DogRepository());

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.dog.name;
    _ageController.text = widget.dog.age.toString();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  _updateDog() async {
    if (_formKey.currentState?.validate() ?? false) {
      final updatedDog = Dog(
        id: widget.dog.id,
        name: _nameController.text,
        age: int.parse(_ageController.text),
      );

      await _viewModel.updateDog(updatedDog);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Dog atualizado com Sucusso!')));
        Navigator.pop(context, updatedDog);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edição Dog'),
        backgroundColor: const Color.fromARGB(255, 248, 73, 225),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const Text(
                        'Editar Dog',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 247, 82, 211),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Nome',
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 255, 107, 230)),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 236, 96, 194)),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor entre com um nome';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _ageController,
                        decoration: InputDecoration(
                          labelText: 'Idade',
                          labelStyle: const TextStyle(
                              color: Color.fromARGB(255, 228, 70, 188)),
                          border: const OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal.shade700),
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
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 69, 209),
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
                          'Salvar Alterações',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

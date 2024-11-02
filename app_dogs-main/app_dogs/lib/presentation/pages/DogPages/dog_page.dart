import 'package:app_dogs/presentation/pages/DogPages/dog_edit_page.dart';
import 'package:app_dogs/presentation/pages/DogPages/dog_page_form.dart';
import 'package:flutter/material.dart';
import '../../../data/models/dogs/dog_model.dart';
import '../../../data/repositories/dog_repository.dart';
import '../../viewmodels/dog_viewmodel.dart';

class DogPage extends StatefulWidget {
  const DogPage({super.key});

  @override
  DogPageState createState() => DogPageState();
}

class DogPageState extends State<DogPage> {
  List<Dog> _dogs = [];
  final DogViewModel _viewModel = DogViewModel(DogRepository());
  Dog? _lastDeleteDog;

  @override
  void initState() {
    super.initState();
    _loadDogs();
  }

  Future<void> _loadDogs() async {
    _dogs = await _viewModel.getDogs();
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _deleteDog(Dog dog) async {
    await _viewModel.deleteDog(dog.id!);
    _lastDeleteDog = dog;

    final snackBar = SnackBar(
      content: Text('${dog.name} deletado!'),
      action: SnackBarAction(
        label: 'Desfazer',
        onPressed: () {
          if (_lastDeleteDog != null && mounted) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Desfeita a Exclusão de ${_lastDeleteDog!.name}'),
            ));
            _viewModel.addDog(_lastDeleteDog!);
            setState(() {
              _dogs.add(_lastDeleteDog!);
              _lastDeleteDog = null;
            });
          }
        },
      ),
    );

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    await _loadDogs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Dogs'),
        backgroundColor: Colors.teal, // Alterando a cor da AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _dogs.isEmpty
            ? const Center(child: Text('Nenhum dog disponível.'))
            : ListView.builder(
                itemCount: _dogs.length,
                itemBuilder: (context, index) {
                  final dog = _dogs[index];
                  return Card(
                    elevation: 5, // Sombra para o card
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(15), // Bordas arredondadas
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.teal.shade300,
                        child: Text(
                          dog.name[0], // Primeira letra do nome
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        dog.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text('Idade: ${dog.age}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.orange),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DogEditPage(dog: dog)),
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              _deleteDog(dog);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DogPageForm()),
          ).then((_) => _loadDogs());
        },
        backgroundColor: Colors.teal,
        tooltip: 'Adicionar Dog',
        child: const Icon(Icons.add, size: 30),
      ),
    );
  }
}

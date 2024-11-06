import 'package:app_dogs/presentation/pages/DogPages/dog_page.dart';
import 'package:app_dogs/presentation/pages/PessoaPages/pessoa_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestão de Pets e Clientes'),
        backgroundColor: const Color.fromARGB(255, 223, 71, 236),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Cabeçalho do Drawer
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 227, 114, 255),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/profile_image.png'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Bem-vindo!',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
            // Menu para a página de Dogs
            ListTile(
              leading:
                  const Icon(Icons.pets, color: Color.fromARGB(255, 0, 0, 0)),
              title: const Text('Dogs'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DogPage()),
                );
              },
            ),
            // Menu para a página de Clientes
            ListTile(
              leading:
                  const Icon(Icons.people, color: Color.fromARGB(255, 0, 0, 0)),
              title: const Text('Clientes'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PessoaPage()));
              },
            ),
          ],
        ),
      ),
      body: const Center(child: Text('Home page')),
    );
  }
}

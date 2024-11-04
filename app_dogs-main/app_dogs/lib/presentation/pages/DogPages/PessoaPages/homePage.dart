import 'package:app_dogs/presentation/pages/DogPages/PessoaPages/pessoa_page_form.dart';
import 'package:flutter/material.dart';
import 'pessoa_page.dart'; // Certifique-se de que este é o caminho correto para a sua PessoaPage

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Clientes'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.group, // Ícone que representa clientes/pessoas
              size: 100,
              color: Colors.teal,
            ),
            const SizedBox(height: 20),
            const Text(
              'Bem-vindo ao Gerenciador de Clientes',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PessoaPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('Ver Lista de Clientes'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Aqui você pode navegar diretamente para a página de adicionar cliente
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PessoaPageForm()), // Ou qualquer outra página para adicionar pessoa
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal.shade700,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('Adicionar Novo Cliente'),
            ),
          ],
        ),
      ),
    );
  }
}

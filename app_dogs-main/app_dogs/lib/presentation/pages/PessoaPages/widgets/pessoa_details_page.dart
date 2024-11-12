import 'package:flutter/material.dart';
import '../../../../data/models/pessoa/pessoa_model.dart';

class PessoaDetailsPage extends StatelessWidget {
  const PessoaDetailsPage({super.key, required this.pessoa});
  final Pessoa pessoa;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes de ${pessoa.nome}'),
        backgroundColor: Colors.teal,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderWidget(pessoa: pessoa),
              SizedBox(height: 20),
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

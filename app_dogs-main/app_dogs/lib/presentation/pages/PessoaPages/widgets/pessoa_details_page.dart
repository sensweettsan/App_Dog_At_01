import 'package:app_dogs/data/models/pessoa/pessoa_model.dart';
import 'package:app_dogs/presentation/pages/PessoaPages/widgets/detail_row_widget.dart';
import 'package:app_dogs/presentation/pages/PessoaPages/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PessoaDetailsPage extends StatelessWidget {
  final Pessoa pessoa;
  const PessoaDetailsPage({super.key, required this.pessoa});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes de ${pessoa.nome}'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderWidget(pessoa: pessoa),
              const SizedBox(height: 20),
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DetailRowWidget(
                        icon: FontAwesomeIcons.phone,
                        label: 'Telefone',
                        value: pessoa.telefone,
                      ),
                      DetailRowWidget(
                        icon: FontAwesomeIcons.envelope,
                        label: 'Email',
                        value: pessoa.email,
                      ),
                      DetailRowWidget(
                          icon: FontAwesomeIcons.house,
                          label: 'Endereço',
                          value:
                              '${pessoa.enderecoAvRua}, ${pessoa.enderecoNumero}'),
                      DetailRowWidget(
                          icon: FontAwesomeIcons.locationArrow,
                          label: 'CEP',
                          value: pessoa.enderecoCep),
                      DetailRowWidget(
                        icon: FontAwesomeIcons.city,
                        label: 'Cidade',
                        value: pessoa.enderecoCidade,
                      ),
                      DetailRowWidget(
                        icon: FontAwesomeIcons.mapLocationDot,
                        label: 'Estado',
                        value: pessoa.enderecoEstado,
                      )
                    ],
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

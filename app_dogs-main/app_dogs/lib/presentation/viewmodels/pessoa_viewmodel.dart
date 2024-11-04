import 'package:app_dogs/data/models/pessoa/pessoa_model.dart';
import 'package:app_dogs/data/repositories/pessoa_repository.dart';

class PessoaViewmodel {
  final PessoaRepository repository;

  PessoaViewmodel(this.repository);

  Future<void> addPessoa(Pessoa pessoa) async {
    await repository.insertPessoa(pessoa);
  }

  Future<List<Pessoa>> getPessoa() async {
    return await repository.getPessoas();
  }

  Future<void> updatePessoa(Pessoa pessoa) async {
    await repository.updatePessoa(pessoa);
  }

  Future<void> deletePessoa(int? id) async {
    await repository.deletePessoa(id!);
  }
}
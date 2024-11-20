import 'package:app_dogs/data/models/user/user_model.dart';
import 'package:app_dogs/data/repositories/user_repository.dart';

class UserViewmodel {
  final UserRepository repository;

  UserViewmodel(this.repository);

  Future<String> registerUser(
      String email, String usuario, String senha) async {
    final emailExists = await repository.emailExists(email);

    if (emailExists) {
      final db = await repository.initDb();
      final result =
          await db.query('pessoas', where: 'email = ?', whereArgs: [email]);
      final idPessoa = result[0]['id'] as int;

      final userAlreadyExists = await repository.userExistsByIdPessoa(idPessoa);
      if (userAlreadyExists) {
        return 'Usuario já Esta Cadastrado';
      }

      final user = User(usuario: usuario, senha: senha, idPessoa: idPessoa);
      await repository.insertUser(user);

      return 'Usuario cadastrado com sucesso!';
    } else {
      return 'E-mail não encontrado. Procure o Adminstrador!';
    }
  }

  Future<bool> loginUser(String usuario, String senha) async {
    return await repository.verifyLogin(usuario, senha);
  }
}

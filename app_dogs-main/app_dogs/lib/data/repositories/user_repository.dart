import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class UserRepository {
  Future<Database> initDb() async {
    return openDatabase(
      join(await getDatabasesPath(), 'doggie_database.db'),
      version: 3,
    );
  }

  Future<bool> emailExists(String email) async {
    final db = await initDb();
    final result =
        await db.query('pessoas', where: 'email = ?', whereArgs: [email]);
    return result.isNotEmpty;
  }

  Future<bool> userExistsByIdPessoa(int idPessoa) async {
    final db = await initDb();
    final result =
        await db.query('login', where: 'id_pessoa =?', whereArgs: [idPessoa]);
    return result.isNotEmpty;
  }
}

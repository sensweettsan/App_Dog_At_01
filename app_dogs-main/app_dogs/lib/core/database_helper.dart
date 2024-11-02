import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseHelper {
  static Future<Database> initDb() async {
    return openDatabase(
      join(await getDatabasesPath(), 'doggie_database.db'),
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)');

        return db.execute(
            'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, telefone TEXT, email TEXT, endereco TEXT)');
      },
      version: 1,
    );
  }
}

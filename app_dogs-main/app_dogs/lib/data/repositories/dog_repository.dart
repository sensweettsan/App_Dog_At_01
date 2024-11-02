import 'package:sqflite/sqflite.dart';
import '../../core/database_helper.dart';
import '../models/dogs/dog_model.dart';

class DogRepository {
  Future<void> insertDog(Dog dog) async {
    final db = await DatabaseHelper.initDb();
    await db.insert(
      'dogs',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Dog>> getDogs() async {
    final db = await DatabaseHelper.initDb();
    final List<Map<String, Object?>> dogMaps = await db.query('dogs');
    return dogMaps.map((map) {
      return Dog(
          id: map['id'] as int,
          name: map['name'] as String,
          age: map['age'] as int);
    }).toList();
  }

  Future<void> updateDog(Dog dog) async {
    final db = await DatabaseHelper.initDb();
    await db.update(
      'dogs',
      dog.toMap(),
      where: 'id = ?',
      whereArgs: [dog.id],
    );
  }

  Future<void> deleteDog(int id) async {
    final db = await DatabaseHelper.initDb();
    await db.delete(
      'dogs',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

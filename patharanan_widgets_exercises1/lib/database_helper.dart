import 'dart:async';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final String _databaseName = "quiz_scores.db";
  static final String _tableName = "scoresHistory";
  static final int _version = 1;
  Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    final databasesPath = await getApplicationDocumentsDirectory();
    final path = join(databasesPath.path, _databaseName);
    return await openDatabase(path, version: _version, onCreate: (db, version) {
      return db.execute("CREATE TABLE $_tableName");
    });
  }

  Future<void> insertScore(int score) async {
    final db = await database;
    await db?.insert(_tableName, {'score': score});
  }

  Future<List<Map<String, dynamic>>> getScores() async {
    final db = await database;
    return await db!.query(
      _tableName,
      orderBy: 'id DESC',
      limit: 3,
    );
  }

  Future<void> deleteScore(int id) async {
    final db = await database;
    await db?.delete(_tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> deleteAllScores() async {
    final db = await database;
    await db?.delete(_tableName);
  }
}

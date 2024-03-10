import 'dart:async';

import 'package:flutter_application_demo1/quiz_ranking_main.dart';
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
      return db.execute(
          "CREATE TABLE $_tableName (id INTEGER PRIMARY KEY, score INTEGER)");
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
}

Future<List<Map<String, dynamic>>> _sortedScores() async {
  DatabaseHelper dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> sortScores = await dbHelper.getScores();
  sortScores.sort((a, b) => b['score'].compareTo(a['score']));
  return sortScores;
}

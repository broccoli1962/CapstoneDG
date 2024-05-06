import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/model/model.dart';

class SqlDataBase {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    return await initDB();
  }

  initDB() async {
    String path = join(await getDatabasesPath(), 'Capstone.db');
    return await openDatabase(path,
        version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
  }

  //데이터 베이스 초기화
  FutureOr<void> _onCreate(Database db, int version){
    String sql = '''CREATE TABLE Capstone(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    type INTEGER,
    title TEXT,
    contents TEXT,
    answer TEXT)
    ''';

    db.execute(sql);
  }

  FutureOr<void> _onUpgrade(Database db, int oldVersion, int newVersion){}
}

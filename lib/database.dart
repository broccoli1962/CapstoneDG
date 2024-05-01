import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Spec{
  int? id;
  int type;
  String? title;
  String? contents;
  String? answer;

  //null 값이 없어야 하는 것 = required
  Spec({required this.id, required this.type, required this.title,required this.contents,required this.answer});

  //c언어 라이브러리 -> 정답 == answer?
  //넣어야 하는거 = id, type[ex=1장], title, contents, answer
  Map<String, dynamic> toMap(){
    return{
      'id': id,
      'type': type,
      'title': title,
      'contents':contents,
      'answer':answer,
    };
  }
}

class SpecProvider{
  late Database _database;

  Future<Database?> get database async{
    _database = await initDB();
    return _database;
  }

  //DB 접근
  Future<List<Spec>> getDB() async{
    final db=await database;
    final List<Map<String, dynamic>> maps = await db!.query('Specs');
    if(maps.isEmpty) return [];
    List<Spec> list = List.generate(maps.length, (index){
      return Spec(
        id: maps[index]["id"],
        type: maps[index]["type"],
        title: maps[index]["title"],
        contents: maps[index]["contents"],
        answer: maps[index]["answer"],
      );
    });
  return list;
  }

  Future<void> insert(Spec spec) async {
    final db = await database;
    spec.id = await db?.insert('Specs', spec.toMap());
  }

  Future<void> update(Spec spec) async{
    final db = await database;
    await db?.update('Specs', spec.toMap(),where: "id=?",whereArgs: [spec.id],);
  }

  Future<void> delete(Spec spec) async {
    final db = await database;
    await db?.delete('Specs',where: "id=?",whereArgs: [spec.id],);
  }

  //DB 만들기
  initDB() async{
    String path = join(await getDatabasesPath(), 'Specs.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async{
        await db.execute('''
        CREATE TABLE Specs(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        type INTEGER NOT NULL,
        title TEXT,
        contents TEXT,
        answer TEXT,
        )
        ''');
      },
      onUpgrade: (db, oldVersion, newVersion){}
    );
  }
}
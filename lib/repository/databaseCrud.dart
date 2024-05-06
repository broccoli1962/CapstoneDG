import 'package:untitled/model/model.dart';
import 'package:untitled/repository/database.dart';
import 'package:sqflite/sqflite.dart';

class SqlDatabaseCrud{
  Future<void> create(Database db)async{

    List<MyDB> file = [
      MyDB(type: 0, title: 'HELLO', contents: 'THIS IS TEST', answer: 'ANSWER'),
      MyDB(type: 0, title: 'HELLO2', contents: 'THIS IS TEST2', answer: 'ANSWER2'),
    ];

    //db에 삽입
    for(var i = 0; i<file.length; i++){
      db.insert(MyDB.tableName, file[i] as Map<String, Object?>);
    }

    // var db = await SqlDataBase().database;
    // var id = await db.insert(MyDB.tableName, mydb.toJson());
    // print(mydb.clone(id: id));
  }
}
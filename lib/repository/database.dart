import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/model/model.dart';

class SqlDataBase{
  static final SqlDataBase instance = SqlDataBase._instance();

  Database? _database;

  SqlDataBase._instance(){
    _initDataBase();
  }

  factory SqlDataBase(){
    return instance;
  }

  Future<Database> get database async {
    if(_database != null) return _database!;
    await _initDataBase();
    return _database!;
  }

  Future<void> _initDataBase() async {
    var dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, 'Capstone.db');
    _database = await openDatabase(path,version: 1,onCreate: _databaseCreate);
  }

  //데이터 베이스 초기화
  void _databaseCreate(Database db, int version) async{
    await db.execute('''
    create table ${MyDB.tableName}(
      ${MyDBFields.id} integer primary key autoincrement,
      ${MyDBFields.type} type integer not null,
      ${MyDBFields.title} title text not null,
      ${MyDBFields.contents} contents text not null,
      ${MyDBFields.answer} answer text not null
    )
    ''');
  }

  void closeDataBase() async{
    if(_database !=null) await _database!.close();
  }

}
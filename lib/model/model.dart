import 'package:sqflite/sqflite.dart';

class MyDBFields{
  static final String id = 'id';
  static final String type = 'type';
  static final String title = 'title';
  static final String contents = 'contents';
  static final String answer = 'answer';
}

class MyDB {
  static String tableName = 'Capstone';
  int? id;
  int? type;
  String? title;
  String? contents;
  String? answer;

  //null 값이 없어야 하는 것 = required
  MyDB(
      {this.id,
      required this.type,
      required this.title,
      required this.contents,
      required this.answer});

  Map<String, dynamic?> toJson(){
    return{
      MyDBFields.id : id,
      MyDBFields.type : type,
      MyDBFields.title : title,
      MyDBFields.contents : contents,
      MyDBFields.answer : answer,
    };
  }

  MyDB clone({
    int? id,
    int? type,
    String? title,
    String? contents,
    String? answer,
  }){
    return MyDB(
      id: id ?? this.id,
      type: type ?? this.type,
      title: title ?? this.title,
      contents: contents ?? this.contents,
      answer : answer ?? this.answer,
    );
  }
//c언어 라이브러리 -> 정답 == answer?
//넣어야 하는거 = id, type[ex=1장], title, contents, answer
}

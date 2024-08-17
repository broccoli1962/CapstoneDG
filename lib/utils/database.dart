class FireData_P {
  final int chapter;
  final int number;
  final String title;
  final String context;
  final String hint;

  FireData_P({required this.chapter, required this.number,required this.title,required this.context,required this.hint});

  factory FireData_P.fromJson(Map<String, dynamic> json){
    return FireData_P(
      chapter: json["chapter"],
      number: json["number"],
      title: json["title"],
      context: json["context"],
      hint: json["hint"],
    );
  }
  Map<String, dynamic> toJson(){
    return{
      "chapter":chapter,
      "number":number,
      "title":title,
      "context":context,
      "hint":hint,
    };
  }

  void get(){
    print(this.title);
  }
}

class FireData_T {
  final int chapter;
  final int number;
  final String title;
  final String testCase;
  final String rtestCase;
  final String context;
  final String hint;
  final String answer;


  FireData_T({required this.chapter, required this.number,required this.title,required this.testCase,required this.rtestCase,required this.context,required this.hint,required this.answer});

  factory FireData_T.fromJson(Map<String, dynamic> json){
    return FireData_T(
      chapter: json["chapter"] ?? '',
      number: json["number"] ?? '',
      title: json["title"] ?? '',
      testCase: json["testCase"] ?? '',
      rtestCase: json["rtestCase"] ?? '',
      context: json["context"] ?? '',
      hint: json["hint"] ?? '',
      answer: json["answer"] ?? '',
    );
  }
  Map<String, dynamic> toJson(){
    return{
      "chapter":chapter,
      "number":number,
      "title":title,
      "testCase":testCase,
      "rtestCase":rtestCase,
      "context":context,
      "hint":hint,
      "answer":answer,
    };
  }

  void get(){
    print(this.title);
  }
}
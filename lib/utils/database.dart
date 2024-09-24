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
    print(title);
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


  FireData_T(
      {required this.chapter, required this.number, required this.title, required this.testCase, required this.rtestCase, required this.context, required this.hint, required this.answer});

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

  Map<String, dynamic> toJson() {
    return {
      "chapter": chapter,
      "number": number,
      "title": title,
      "testCase": testCase,
      "rtestCase": rtestCase,
      "context": context,
      "hint": hint,
      "answer": answer,
    };
  }

  void get() {
    print(title);
  }
}

class User_Create {
  final String uname;
  final String utitle;
  final String utestCase;
  final String urtestCase;
  final String ucontents;
  final String uhint;
  final String uanswer;


  User_Create({required this.uname,required this.utitle,required this.utestCase,required this.urtestCase,required this.ucontents,required this.uhint,required this.uanswer});

  factory User_Create.fromJson(Map<String, dynamic> json){
    return User_Create(
      uname: json["user_name"] ?? '',
      utitle: json["user_title"] ?? '',
      utestCase: json["user_testcase"] ?? '',
      urtestCase: json["user_rtestcase"] ?? '',
      ucontents: json["user_contents"] ?? '',
      uhint: json["user_hint"] ?? '',
      uanswer: json["user_answer"] ?? '',
    );
  }
  Map<String, dynamic> toJson(){
    return{
      "user_name":uname,
      "user_title":utitle,
      "user_testcase":utestCase,
      "user_rtestcase":urtestCase,
      "user_context":ucontents,
      "user_hint":uhint,
      "user_answer":uanswer,
    };
  }
}
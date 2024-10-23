class FireDataPractice {
  final int chapter;
  final int number;
  final String title;
  final String context;
  final String hint;

  FireDataPractice({required this.chapter, required this.number,required this.title,required this.context,required this.hint});

  factory FireDataPractice.fromJson(Map<String, dynamic> json){
    return FireDataPractice(
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
}

class FireDataTest {
  final int chapter;
  final int number;
  final String title;
  final String testCase;
  final String rtestCase;
  final String context;
  final String hint;
  final String answer;


  FireDataTest(
      {required this.chapter, required this.number, required this.title, required this.testCase, required this.rtestCase, required this.context, required this.hint, required this.answer});

  factory FireDataTest.fromJson(Map<String, dynamic> json){
    return FireDataTest(
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
}

class FireDataUser {
  final String uname;
  final String utitle;
  final String utestCase;
  final String urtestCase;
  final String ucontents;
  final String uhint;
  final String uanswer;
  final String upw;


  FireDataUser({required this.uname,required this.utitle,required this.utestCase,required this.urtestCase,required this.ucontents,required this.uhint,required this.uanswer,required this.upw});

  factory FireDataUser.fromJson(Map<String, dynamic> json){
    return FireDataUser(
      uname: json["user_name"] ?? '',
      utitle: json["user_title"] ?? '',
      utestCase: json["user_testcase"] ?? '',
      urtestCase: json["user_rtestcase"] ?? '',
      ucontents: json["user_contents"] ?? '',
      uhint: json["user_hint"] ?? '',
      uanswer: json["user_answer"] ?? '',
      upw: json["user_pw"] ?? '',
    );
  }
  Map<String, dynamic> toJson(){
    return{
      "user_name":uname,
      "user_title":utitle,
      "user_testcase":utestCase,
      "user_rtestcase":urtestCase,
      "user_contents":ucontents,
      "user_hint":uhint,
      "user_answer":uanswer,
      "user_pw":upw,
    };
  }
}
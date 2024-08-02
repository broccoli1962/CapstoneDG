class FireData {
  final int chapter;
  final int number;
  final String title;
  final String context;
  final String hint;

  FireData({required this.chapter, required this.number,required this.title,required this.context,required this.hint});

  factory FireData.fromJson(Map<String, dynamic> json){
    return FireData(
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
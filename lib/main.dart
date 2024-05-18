import 'package:flutter/material.dart';
import 'package:untitled/problem.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Test",
      home: MainPage(),
    );
  }
}

enum Page { A, B, C, D }

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

//문제 장
List<String> nameList = ['1장', '2장', '3장', '4장'];

//문제 개수
List<int> list = [3, 2, 6, 8];

class _MainPageState extends State<MainPage> {
  Page page = Page.A;

  var isChecked = false;

  @override
  Widget build(BuildContext context) {
    final Size cSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children:[
          //book image
          Container(
              height: cSize.height*0.24,
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Column(
                children: [
                  Icon(
                    Icons.menu_book,
                    size: cSize.height*0.15,
                  ),
                  const Text(
                    '공부',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              )),
          const Divider(height: 0.01,color: Colors.black,),
          //witch page?
          Container(
            height: cSize.height*0.2,
            width: double.infinity,
            color: Colors.blue,
            child: Center(
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,childAspectRatio: 2.5),
                children: [
                  for (int i = 0; i < Page.values.length; i++)
                    RadioListTile(
                        title: Text(nameList[i], style: TextStyle(fontWeight: FontWeight.bold),),
                        value: Page.values[i],
                        groupValue: page,
                        onChanged: ((Page? value) {
                          setState(() {
                            page = value!;
                          });
                        }))
                ],
              ),
            ),
          ),
          const Divider(color: Colors.black,height: 0.01,),
          //witch page count?
          Container(
            height: cSize.height*0.43,
            width: double.infinity,
            color: Colors.yellow,
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, childAspectRatio: 1.2),
              children: [
                for (int i = 0; i < list[page.index]; i++) MakeTest(pg: page, number: i+1,),
              ],
            ),
          ),
          const Divider(color: Colors.black,height: 0.01,),
        ],
      ),
      bottomNavigationBar: Container(
        height: cSize.height*0.129,
        color: Colors.cyan,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: cSize.height*0.1,
              child: Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.menu_book),
                    iconSize: 40,
                    color: Colors.black,
                    onPressed: () {  },
                  ),
                  const Text("공부", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            SizedBox(
              height: cSize.height*0.1,
              child: Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.article),
                    iconSize: 40,
                    color: Colors.black,
                    onPressed: () {  },
                  ),
                  const Text("시험", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            SizedBox(
              height: cSize.height*0.1,
              child: Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.person),
                    iconSize: 40,
                    color: Colors.black,
                    onPressed: () {  },
                  ),
                  const Text("설정", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//문제칸 만들기
class MakeTest extends StatelessWidget {
  const MakeTest({
    super.key,
    required this.pg,
    required this.number,
  });

  final Page pg;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 2, 0, 0),
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      // color: Colors.lightBlueAccent,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Front(pg: pg.index+1, number: number)));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.zero) ,side: BorderSide.none),
        ),
        child: Text("problem $number", style: TextStyle(fontWeight: FontWeight.bold),),
      ),
    );
  }
}

class Problem {
  int page;
  int number;
  String title;
  String title2;
  String contents;
  String myAnswer;
  String contents2;
  String hint;
  String answer;

  //Problem(몇장, 몇번문제, 문제제목, 소제목, 내용1, 입력받는 정답 ,내용2, 힌트, 정답);
  static List<Problem> problems = [
    Problem(1, 1,'<printf>\nprintf 문을 공부해보자.','소제목', '#include <stdio.h>\nint main(){\n printf("hello world");\nreturn 0;\n}', '','', 'hint', 'answer'),
  ];

  static Problem get(int a, int b){
    for(Problem p in problems){
      if(a==p.page&&b==p.number){
        return p;
      }
    }
    return dummy;
  }

  static Problem dummy = Problem(0, 0, 'dummy title', 'dummy title2', 'contents', 'dummy','contents2', 'hint', 'answer');

  Problem(this.page, this.number, this.title, this.title2 ,this.contents, this.myAnswer, this.contents2, this.hint, this.answer);
}
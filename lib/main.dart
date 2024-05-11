import 'package:flutter/material.dart';
import 'package:untitled/problem.dart';

void main() {
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

List<String> nameList = ['1장', '2장', '3장', '4장'];

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
              height: cSize.height*0.25,
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Column(
                children: [
                  Icon(
                    Icons.book,
                    size: cSize.height*0.15,
                  ),
                  const Text(
                    '공부',
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              )),
          //witch page?
          Container(
            height: cSize.height*0.2,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.blue, border: Border.all(color: Colors.black)),
            child: Center(
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,childAspectRatio: 2.5),
                children: [
                  for (int i = 0; i < Page.values.length; i++)
                    RadioListTile(
                        title: Text(nameList[i],),
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
          //witch page count?
          Container(
            height: cSize.height*0.45,
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
        ],
      ),
      bottomNavigationBar: Container(
        height: cSize.height*0.1,
        color: Colors.cyan,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.bookmark,
              size: cSize.height*0.075,
            ),
            Icon(
              Icons.edit,
              size: cSize.height*0.075,
            ),
            Icon(
              Icons.perm_contact_calendar,
              size: cSize.height*0.075,
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
        child: Text("problem $pg"),
      ),
    );
  }
}

class Problem {
  int page;
  int number;
  String title;
  String contents;
  String contents2;
  String hint;

  static List<Problem> problems = [
    Problem(1, 1,'printf', '#include<stdio.h>\nvoid main() {\n', 'contents2\n}', 'hint'),
  ];

  static Problem get(int a, int b){
    for(Problem p in problems){
      if(a==p.page&&b==p.number){
        return p;
      }
    }
    return dummy;
  }

  static Problem dummy = Problem(0, 0, '', 'contents', 'contents2', 'hint');

  Problem(this.page, this.number, this.title, this.contents, this.contents2, this.hint);
}
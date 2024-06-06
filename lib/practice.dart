import 'package:flutter/material.dart';
import 'package:untitled/practice_problem.dart';
import 'package:untitled/test.dart';
import 'memo.dart';

enum Page { A, B, C, D }

class Practice extends StatefulWidget {
  const Practice({super.key});

  @override
  State<Practice> createState() => _PracticeState();
}

//문제 장
List<String> nameList = ['알고리즘', '데이터베이스', '3장', '4장'];

//문제 개수
List<int> list = [3, 2, 6, 8];

class _PracticeState extends State<Practice> {
  Page page = Page.A;

  var isChecked = false;

  @override
  Widget build(BuildContext context) {
    final Size cSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.menu_book), Text(' 공부')],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          const Divider(
            height: 0.01,
            color: Colors.black,
          ),
          //witch page?
          Container(
            height: cSize.height * 0.3,
            width: double.infinity,
            color: Colors.blue,
            child: Center(
              child: ListView(
                // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 3, childAspectRatio: 2.5),
                children: [
                  for (int i = 0; i < Page.values.length; i++)
                    RadioListTile(
                        title: Text(
                          nameList[i],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
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
          const Divider(
            color: Colors.black,
            height: 0.01,
          ),
          //witch page count?
          Container(
            height: cSize.height * 0.494,
            width: double.infinity,
            color: Colors.yellow,
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, childAspectRatio: 1.2),
              children: [
                for (int i = 0; i < list[page.index]; i++)
                  MakeTest(
                    pg: page,
                    number: i + 1,
                  ),
              ],
            ),
          ),
          const Divider(
            color: Colors.black,
            height: 0.01,
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: cSize.height * 0.129,
        color: Colors.cyan,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: cSize.height * 0.1,
              child: Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.menu_book),
                    iconSize: 40,
                    color: Colors.black,
                    onPressed: () {},
                  ),
                  const Text(
                    "공부",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: cSize.height * 0.1,
              child: Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.article),
                    iconSize: 40,
                    color: Colors.black,
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => const Test()),
                          (route) => false);
                    },
                  ),
                  const Text(
                    "시험",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: cSize.height * 0.1,
              child: Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.person),
                    iconSize: 40,
                    color: Colors.black,
                    onPressed: () {},
                  ),
                  const Text(
                    "문제",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: cSize.height * 0.1,
              child: Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.person),
                    iconSize: 40,
                    color: Colors.black,
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => const memo()),
                              (route) => false);
                    },
                  ),
                  const Text(
                    "메모",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: cSize.height * 0.1,
              child: Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.person),
                    iconSize: 40,
                    color: Colors.black,
                    onPressed: () {},
                  ),
                  const Text(
                    "설정",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  )
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
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      Practice_in(pg: pg.index + 1, number: number)));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.zero),
              side: BorderSide.none),
        ),
        child: Text(
          "problem $number",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class Problem_p {
  int page;
  int number;
  String title;
  String contents;
  String hint;

  //Problem(몇장, 몇번문제, 문제제목, 내용, 힌트;
  static List<Problem_p> problems = [
    Problem_p(1, 1, 'printf 문을 공부해보자.',
        '#include <stdio.h>\nint main(){\n printf("hello world");\nreturn 0;\n}\n위와 같은 상황에서 hello world를 출력할 수 있다.',
        'hint'),
    Problem_p(1, 2, '<printf>\nprintf 문을 공부해보자.',
        '#include <stdio.h>\nint main(){\n printf("hello world");\nreturn 0;\n}',
        'hint'),
  ];

  static Problem_p get(int a, int b) {
    for (Problem_p p in problems) {
      if (a == p.page && b == p.number) {
        return p;
      }
    }
    return dummy;
  }

  static Problem_p dummy = Problem_p(0, 0, 'dummy title',
      'contents', 'hint',);

  Problem_p(this.page, this.number, this.title, this.contents, this.hint);
}

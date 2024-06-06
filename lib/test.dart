import 'package:flutter/material.dart';
import 'package:untitled/practice.dart';
import 'package:untitled/test_problem.dart';
import 'memo.dart';

enum Page { A, B, C, D, E, F, G, H }

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

//문제 장
List<String> nameList = ['1장', '2장', '3장', '4장', '5장', '6장', '7장', '8장',];

//문제 개수
List<int> list = [8, 8, 8, 8, 8, 8, 8, 8];

class _TestState extends State<Test> {
  Page page = Page.A;

  var isChecked = false;

  @override
  Widget build(BuildContext context) {
    final Size cSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.article), Text(' 시험')],
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
            color: Colors.white,
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
            color: Colors.white,
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
        color: Colors.white,
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
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const Practice()),
                          (route) => false);
                    },
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
                    onPressed: () {},
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
                    onPressed: () {
                    },
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
                      Test_in(pg: pg.index + 1, number: number)));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
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

class Problem_t {
  int page;
  int number;
  String title;
  String testCase;
  String rtestCase2;
  String contents;
  String myAnswer;
  String hint;
  String answer;

  //Problem(몇장, 몇번문제, 문제제목, 소제목, 내용1, 입력받는 정답 ,내용2, 힌트, 정답);
  static List<Problem_t> problems = [
    Problem_t(
        1,
        1,
        '<printf>\nprintf 문을 출력하세요.',
        '10\n20\n30',
        'hello world',
        '#include <stdio.h>\nint main(){\n printf("hello world");\nreturn 0;\n}',
        '',
        'hint',
        'answer'),
  ];

  static Problem_t get(int a, int b) {
    for (Problem_t p in problems) {
      if (a == p.page && b == p.number) {
        return p;
      }
    }
    return dummy;
  }

  static Problem_t dummy = Problem_t(0, 0, 'dummy title', 'dummy testcase','dummy rtestcase',
      'contents', 'dummy', 'hint', 'answer');

  Problem_t(this.page, this.number, this.title, this.testCase, this.rtestCase2, this.contents,
      this.myAnswer, this.hint, this.answer);
}

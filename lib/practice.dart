import 'package:flutter/material.dart';
import 'package:untitled/practice_problem.dart';
import 'package:untitled/test.dart';

enum Page { A, B, C, D, E, F, G, H }

class Practice extends StatefulWidget {
  const Practice({super.key});

  @override
  State<Practice> createState() => _PracticeState();
}

//문제 장
List<String> nameList = ['1장', '2장', '3장', '4장', '5장', '6장', '7장', '8장'];

//문제 개수
List<int> list = [7, 2, 6, 8, 8, 8, 8, 8];

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
                    onPressed: () {},
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
    Problem_p(1, 1, 'printf 문\n1-1\n<"Hello World의 출력">',
        '#include <stdio.h>\n'
        'void main(){\n'
        'printf("hello world");\n}',
        '출력하기 위해서는 printf("");를 사용해야 한다.'),

    Problem_p(1, 2, 'scanf 문\n1-2\n<키보드로부터 입력받기>',
        '#include <stdio.h>\n'
        'void main(){\n'
        'int a;\n\n'
        'scanf("%d", &a);\n\n'
        'printf("%d %d", a, a);\n}',
        '정수를 입력할 때에는 %d, 실수는 %f, 문자는 %c를 사용한다.\n'
        'int a;는 변수 a를 정수형으로 선언하는 문장이다.\n'
        'scanf("%d", &a);에서 정수형 변수 a의 값을 입력한다.\n'
        '프로그램을 실행하면 정수값을 입력 후 enter키를 누르면 입력한 정수값이 a에 대입된다.\n'
        'printf("%d %d", a, a);에서 %d는 정수형 a값을 출력하는 서식이다.'),

    Problem_p(1, 3, '에스케이프 시퀀스\n1-3\n<"에스케이프 시퀀스를 사용하여 문자열 출력">',
        '#include <stdio.h>\n'
        'void main(){\n'
        'printf("Apple ");\n'
        'printf("Banana ");\n'
        'printf("Cherry\￦n");\n'
        'printf("Dragonfruit\￦tEggfruit");\n}',
        '백스페이스 \￦b\n'
        '탭 \￦t\n'
        '행 바꾸기 \￦n\n'
        '이중 인용부호 \￦"\n'
        '단일 인용부호\￦\'\n'
        '역슬래시 \￦￦'),

    Problem_p(1, 4, '주석\n1-4\n<"주석의 사용">',
        '#include <stdio.h>\n'
        'void main(){\n'
        '/*printf("hello world");*/\n'
        'printf("hello world");\n}',
        '출력하기 위해서는 printf("");를 사용해야 한다.'),

    Problem_p(1, 5, 'printf 문\n1-1\n<"Hello World의 출력">',
        '#include <stdio.h>\n'
            'void main(){\n'
            'printf("hello world");\n}',
        '출력하기 위해서는 printf("");를 사용해야 한다.'),

    Problem_p(1, 6, 'printf 문\n1-1\n<"Hello World의 출력">',
        '#include <stdio.h>\n'
            'void main(){\n'
            'printf("hello world");\n}',
        '출력하기 위해서는 printf("");를 사용해야 한다.'),

    Problem_p(1, 7, 'printf 문\n1-1\n<"Hello World의 출력">',
        '#include <stdio.h>\n'
            'void main(){\n'
            'printf("hello world");\n}',
        '출력하기 위해서는 printf("");를 사용해야 한다.'),
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

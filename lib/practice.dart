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
List<int> list = [6, 2, 6, 8, 8, 8, 8, 8];

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
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
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
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.zero),
              side: BorderSide.none),
        ),
        child: Text(
          "problem $number",
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
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
        'printf("hello world\￦n"); //hello world를 출력한다.\n}',
        '출력하기 위해서는 printf("");를 사용해야 한다.'),

    Problem_p(1, 2, 'scanf 문\n1-2\n<키보드로부터 입력받기>',
        '#include <stdio.h>\n'
        'void main(){\n'
        'int a; //변수 a를 정수형으로 선언한다.\n\n'
        'scanf("%d", &a); //정수형 a에 들어갈 값을 키보드로 입력한다.\n\n'
        'printf("%d %d\￦n", a, a); //%d에 정수형 a값을 대입 후 출력한다.\n}',
        '정수를 입력할 때에는 %d, 실수는 %f, 문자는 %c를 사용한다.\n'
        '프로그램을 실행하면 정수값을 입력 후 enter키를 누르면 입력한 정수값이 a에 대입된다.\n'),

    Problem_p(1, 3, '에스케이프 시퀀스\n1-3\n<"에스케이프 시퀀스를 사용하여 문자열 출력">',
        '#include <stdio.h>\n'
        'void main(){\n'
        'printf("Apple "); //Apple을 출력한다.\n'
        'printf("Banana "); //Banana를 출력한다.\n'
        'printf("Cherry\￦n"); //Cherry를 출력한 후 행을 바꾼다.\n'
        'printf("Dragonfruit\￦tEggfruit\￦n"); //Dragonfruit를 출력하고, 탭(칸 띄우기) 후 Eggfruit를 출력한다.\n}',
        '에스케이프 시퀀스는 다음과 같은 것들이 있다.\n'
        '널 문자 \￦0            폼피드 \￦f\n'
        '벨 문자 \￦a            캐리지 리턴\￦r\n'
        '백스페이스 \￦b       이중 인용부호 \￦"\n'
        '탭 \￦t                   단일 인용부호\￦\'\n'
        '행 바꾸기 \￦n         역슬래시 \￦￦'),

    Problem_p(1, 4, '주석\n1-4\n<"주석의 사용">',
        '#include <stdio.h>\n'
        'void main(){\n'
        '/*\nprintf("hello world\￦n");\n-> hello world를 출력한다.\n*/\n'
        '//주석에 대해서 배우는 중입니다.\n'
        'printf("hello world\￦n");\n}',
        '주석은 /*와 */ 사이, 또는 // 다음에 표시한 임의의 문자열이며, 여백으로 간주된다.\n'
        '주석을 사용하면 프로그램의 작성과 독해력을 증가시키는 효과가 있다.'),

    Problem_p(1, 5, '예약어\n1-5\n<"예약어를 사용한 덧셈">',
        '#include <stdio.h>\n'
        'void main(){\n'
        'int x; //정수형 x를 선언한다.\n'
        'int y; //정수형 y를 선언한다.\n\n'
        'x = 3; //정수형 x에 3을 대입한다.\n'
        'y = 5; //정수형 y에 5를 대입한다.\n\n'
        'printf("x = %d\￦n", x + y); //x + y를 한 값을 출력한다.\n}',
        '예약어는 다음과 같다.\n'
        '  auto           break          case          char       continue      default\n'
        '   do            double         else          enum        exterm         float\n'
        '   for             goto             if             int             log          register\n'
        ' return          short         sizeof        static        struct        switch\n'
        'typedef        union       unsigned       void          while         signed\n'),

    Problem_p(1, 6, '문장\n1-6\n<"if문을 사용한 문장">',
        '#include <stdio.h>\n'
        'void main(){\n'
        'int n; //정수형 n을 선언한다.\n\n'
        'scanf("%d", &n); //키보드로 입력을 받는다.\n\n'
        'if(n % 2 == 0){ //만약 키보드로 입력받은 정수를 2로 나눴을 때 나머지가 0이면\n'
        'printf("%d는 짝수입니다.\￦n", n); //입력받은 수는 짝수입니다.를 출력한다.\n'
        '} else //그렇지 않다면(if문이 아니라면)\n'
        'printf("%d는 홀수입니다.\￦n", n); //입력받은 수는 홀수입니다.를 출력한다.\n}',
        'if()는 만약 ~~한다면\n'
        'printf(""); 출력해라.\n'
        'else는 그렇지 않다면\n'
        'printf(""); 출력해라.'),
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

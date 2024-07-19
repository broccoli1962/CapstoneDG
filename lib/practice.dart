import 'package:flutter/material.dart';
import 'package:untitled/practice_problem.dart'; // practice_problem.dart 파일의 import 문
import 'package:untitled/util.dart'; // test.dart 파일의 import 문

// 페이지 열거형 정의
enum Page { A, B, C, D, E, F, G, H }

// 문제 장의 제목 리스트
List<String> nameList = ['1장', '2장', '3장', '4장', '5장', '6장', '7장', '8장'];

// 각 장의 문제 개수 리스트
List<int> list = [6, 8, 8, 8, 8, 8, 8, 8];

// Practice 클래스: StatefulWidget을 상속하여 구현
class Practice extends StatefulWidget {
  const Practice({super.key});

  @override
  State<Practice> createState() => _PracticeState();
}

// Practice 클래스의 State 클래스
class _PracticeState extends State<Practice> {
  Page page = Page.A; // 현재 페이지 상태를 나타내는 변수

  var isChecked = false; // 체크 여부를 나타내는 변수

  // 위젯 빌드 메서드
  @override
  Widget build(BuildContext context) {
    final Size cSize = MediaQuery.of(context).size; // 화면 크기 계산

    // Scaffold 위젯 반환
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0), // AppBar의 높이를 150으로 조절
        child: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.menu_book,
                size: 50,
              ),
              SizedBox(width: 8), // 아이콘과 텍스트 사이에 간격 조절
              Text(
                '공부',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(1),
            child: Divider(
              height: 1,
              thickness: 1,
              color: Colors.black,
            ),
          ),
        ),
      ),

      body: Column(
        // Column 위젯으로 세로 배열
        children: [
          // Divider 추가
          const Divider(
            height: 0.01,
            color: Colors.black,
          ),
          // 페이지 선택 위젯
          Container(
            height: cSize.height * 0.19,
            width: double.infinity,
            color: Colors.white,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 3,
              ),
              itemCount: Page.values.length, // 페이지 수에 따라 그리드 아이템 수를 설정합니다.
              itemBuilder: (BuildContext context, int index) {
                return RadioListTile(
                  // 페이지 선택 RadioListTile
                  title: Text(
                    nameList[index], // 장 이름
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  value: Page.values[index], // 페이지 값
                  groupValue: page, // 그룹 값
                  onChanged: ((Page? value) {
                    setState(() {
                      page = value!; // 선택된 페이지 업데이트
                    });
                  }),
                );
              },
            ),
          ),
          // Divider 추가
          const Divider(
            color: Colors.black,
            height: 0.01,
          ),
          // 페이지 별 문제 그리드
          Container(
            height: cSize.height * 0.5736,
            width: double.infinity,
            color: Colors.white,
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 0.595),
              children: [
                for (int i = 0; i < list[page.index]; i++)
                  MakeTest(
                    pg: page, // 페이지
                    number: i + 1, // 문제 번호
                  ),
              ],
            ),
          ),
        ],
      ),
      // BottomNavigationBar 추가
      bottomNavigationBar: BottomBar(),
    );
  }
}

// 문제 위젯
class MakeTest extends StatelessWidget {
  const MakeTest({
    super.key,
    required this.pg,
    required this.number,
  });

  final Page pg; // 페이지
  final int number; // 문제 번호

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 2, 0, 0),
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
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
          "study: $number",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

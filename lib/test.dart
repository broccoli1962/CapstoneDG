import 'package:flutter/material.dart';
import 'package:untitled/test_show.dart';
import 'package:untitled/utils/util.dart';

enum Page { A, B, C, D, E, F, G, H }

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

//문제 장
List<String> nameList = [ '1장', '2장', '3장', '4장', '5장', '6장', '7장', '8장',];

//문제 개수
List<int> list = [8, 8, 8, 8, 8, 8, 8, 8];

class _TestState extends State<Test> {
  Page page = Page.A;

  var isChecked = false;

  @override
  Widget build(BuildContext context) {
    final Size cSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0), // AppBar의 높이를 100으로 조절
        child: AppBar(
          title: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.sticky_note_2_outlined,
                    size: 50,
                  ),
                  SizedBox(width: 5), // 아이콘과 텍스트 사이 간격 조정
                  Text(
                    '시험',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(1),
            child: Divider(
              height: 2,
              thickness: 1,
              color: Colors.black,
            ),
          ),
        ),
      ),

      body: Column(
        children: [ //witch page?
          Container(
            height: cSize.height * 0.175,
            width: double.infinity,
            color: Colors.white,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // 4열
                childAspectRatio: 3, // 그리드 아이템의 가로 세로 비율을 조정합니다.
              ),
              itemCount: Page.values.length, // 페이지 수에 따라 그리드 아이템 수를 설정합니다.
              itemBuilder: (BuildContext context, int index) {
                return RadioListTile(
                  // 페이지 선택 RadioListTile
                  title: Text(
                    nameList[index], // 장 이름
                    style: const TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
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
          const Divider(
            color: Colors.black,
            height: 0.01,
          ),
          //witch page count?
          Container(
            height: cSize.height * 0.589,
            width: double.infinity,
            color: Colors.white,
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 0.558),
              children: [
                for (int i = 0; i < list[page.index]; i++)
                  MakeTest(
                    pg: page,
                    number: i + 1,
                  ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomBar(),
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
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 12),
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      // color: Colors.lightBlueAccent,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      TestShow(pg: pg.index + 1, number: number)));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            side: BorderSide(
              color: Color((0xFFD3D3D3)), // 라인 색상 설정
              width: 2, // 라인 두께 설정
            ),
          ),
        ),
        child: Text(
          "test : $number",
          style: const TextStyle(
              fontSize: 25,
              color: Color(0xFF4169E1),
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/utils/util.dart';

import 'memo.dart';

class Minsert extends StatefulWidget {
  const Minsert({super.key});

  @override
  State<Minsert> createState() => _MinsertState();
}

class _MinsertState extends State<Minsert> {
  @override
  Widget build(BuildContext context) {
    final Size cSize = MediaQuery.of(context).size;
    TextEditingController controller = TextEditingController();
    TextEditingController controller2 = TextEditingController();

    Future<void> saveMemo() async {
      final prefs = await SharedPreferences.getInstance();
      final encodeMemo = memos.map((memo)=> '${memo.Mtitle},${memo.contents}').toList();
      await prefs.setStringList('memos', encodeMemo);
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:false,
        title: const Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.menu_book,
                      size: 50,
                    ),
                    Text(' 메모추가',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                  ],
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
      body: Column(
        children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            height: cSize.height * 0.1,
            child: TextField(
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: '  제목 입력'
              ),
              maxLines: 1,
              controller: controller2,
            ),
          ),
          const Divider(
            height: 0.01,
            color: Colors.black,
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              width: double.infinity,
              height: cSize.height * 0.6675,
              child: TextField(
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: '  내용 입력'
                ),
                maxLines: 22,
                controller: controller,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomBar(),
      floatingActionButton: Stack(
        children: [
          Align(
            alignment: Alignment(
                Alignment.bottomRight.x-0.4, Alignment.bottomRight.y
            ),
            child: FloatingActionButton(
              onPressed: () async {
                setState(() {
                  memos.add(
                    Memos(controller2.text ,controller.text),
                  );
                });
                await saveMemo();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const memo()),
                        (route) => false);
              },
              tooltip: '수정',
              child: const Text('저장'),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const memo()),
                        (route) => false);
              },
              tooltip: '취소',
              child: const Text('취소'),
            ),

          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //       memos.add(
      //         Memos(_controller2.text ,_controller.text),
      //       );
      //       Navigator.of(context).pushAndRemoveUntil(
      //           MaterialPageRoute(
      //               builder: (context) => const memo()),
      //               (route) => false);
      //     });
      //   },
      //   child: Text('저장'),
      // ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    TextEditingController _controller = TextEditingController();
    TextEditingController _controller2 = TextEditingController();

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
                            fontSize: 24, fontWeight: FontWeight.bold)),
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
              color: Color(0xFF005629)
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
              controller: _controller2,
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
                    hintText: '  내용 입력'
                ),
                maxLines: 22,
                controller: _controller,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(),
      floatingActionButton: Stack(
        children: [
          Align(
            alignment: Alignment(
                Alignment.bottomRight.x-0.4, Alignment.bottomRight.y
            ),
            child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  memos.add(
                    Memos(_controller2.text ,_controller.text),
                  );
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const memo()),
                          (route) => false);
                });
              },
              tooltip: '수정',
              child: Text('저장'),
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

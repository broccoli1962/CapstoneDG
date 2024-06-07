import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/practice.dart';
import 'package:untitled/setting.dart';
import 'package:untitled/test.dart';

class memo extends StatefulWidget {
  const memo({super.key});

  @override
  State<memo> createState() => _memoState();
}

class _memoState extends State<memo> {
  @override
  Widget build(BuildContext context) {
    final Size cSize = MediaQuery.of(context).size;
    TextEditingController _controller = TextEditingController();
    TextEditingController _controller2 = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        // AppBar 정의
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
                    Text(' 메모리스트',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Divider(
                height: 2,
                thickness: 2,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey,
            width: double.infinity,
            height: cSize.height * 0.3,
            child: ListView.separated(
              itemCount: memos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${memos[index].Mtitle}'),
                  subtitle: Text(
                    '내용: ${memos[index].contents}'
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        memos.removeAt(index);
                      });
                    },
                    icon: const Icon(Icons.delete),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  height: 2,
                  color: Colors.redAccent,
                  indent: 20,
                  endIndent: 20,
                );
              },
            ),
          ),
          Container(
            color: Colors.redAccent,
            width: double.infinity,
            height: cSize.height * 0.1,
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '제목 입력'
              ),
              maxLines: 1,
              controller: _controller2,
            ),
          ),
          Container(
            color: Colors.greenAccent,
            width: double.infinity,
            height: cSize.height * 0.395,
            child: TextField(
              decoration: InputDecoration(
                hintText: '내용 입력'
              ),
              maxLines: 22,
              controller: _controller,
            ),
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
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const setting()),
                              (route) => false);
                    },
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            memos.add(
              Memos(_controller2.text ,_controller.text),
            );
          });
        },
        child: Text('저장'),
      ),
    );
  }
}

class Memos {
  String Mtitle;
  String contents;
  Memos(this.Mtitle, this.contents);
}

List<Memos> memos = [];
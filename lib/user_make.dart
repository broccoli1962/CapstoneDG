import 'package:flutter/material.dart';
import 'package:untitled/practice.dart';
import 'package:untitled/setting.dart';
import 'package:untitled/user_main.dart';
import 'package:untitled/util.dart';

import 'memo.dart';

class UserMake extends StatefulWidget {
  const UserMake({super.key});

  @override
  State<UserMake> createState() => _UserMakeState();
}

class _UserMakeState extends State<UserMake> {
  @override
  Widget build(BuildContext context) {
    final Size cSize = MediaQuery.of(context).size;

    TextEditingController titleController = TextEditingController();
    TextEditingController ContentController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('유저 문제 제작 페이지임'),
      ),
      body: Center(
        child: Column(
          children: [
            //제목
            Container(
              child: TextField(
                controller: titleController,
              ),
            ),
            //내용
            Container(
              child: TextField(
                maxLines: 10,
                controller: ContentController,
              ),
            ),
            Container(
              child: Row(
                children: [
                  OutlinedButton(onPressed: (){
                    usert.add(UserT('null', titleController.text, ContentController.text));
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const UserTest()), (route) => false);
                  }, child: Text('확인')),
                  OutlinedButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: Text('취소')),
                ],
              ),
            ),
          ],
        ),
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
    );
  }
}

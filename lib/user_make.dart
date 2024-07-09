import 'package:flutter/material.dart';
import 'package:untitled/practice.dart';
import 'package:untitled/setting.dart';
import 'package:untitled/test.dart';
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
            BottomNav(
              icon: Icons.menu_book,
              label: '공부',
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const Practice()),
                        (route) => false);
              },
            ),
            BottomNav(
              icon: Icons.menu_book,
              label: '공부',
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const Practice()),
                        (route) => false);
              },
            ),
            BottomNav(
              icon: Icons.menu_book,
              label: '시험',
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const Test()),
                        (route) => false);
              },
            ),
            BottomNav(
              icon: Icons.menu_book,
              label: '문제',
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const UserTest()),
                        (route) => false);
              },
            ),
            BottomNav(
              icon: Icons.menu_book,
              label: '메모',
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const memo()),
                        (route) => false);
              },
            ),
            BottomNav(
              icon: Icons.menu_book,
              label: '설정',
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const setting()),
                        (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}

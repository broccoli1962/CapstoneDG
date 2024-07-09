import 'package:flutter/material.dart';
import 'package:untitled/practice.dart';
import 'package:untitled/setting.dart';
import 'package:untitled/test.dart';
import 'package:untitled/user_make.dart';
import 'memo.dart';
import 'util.dart';

class UserTest extends StatefulWidget {
  const UserTest({super.key});

  @override
  State<UserTest> createState() => _UserTestState();
}

String searchText = "";

class _UserTestState extends State<UserTest> {
  @override
  Widget build(BuildContext context) {
    final Size cSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('hello'),
        backgroundColor: Colors.greenAccent,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const UserMake()),
                );
              },
              child: Text('문제 만들기')),
        ],
      ),
      body: Center(
        child: Row(
          children: [
            Container(
              child: TextField(
                decoration: InputDecoration(
                  hintText: '검색어 입력',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                  });
                },
              ),
            ),
            ListView.separated(
              itemBuilder: (BuildContext, int index) {
                return UserList(usert[index], index);
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemCount: usert.length,
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

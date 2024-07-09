import 'package:flutter/material.dart';
import 'package:untitled/practice.dart';
import 'package:untitled/setting.dart';
import 'package:untitled/test.dart';
import 'package:untitled/user_main.dart';
import 'package:untitled/util.dart';

import 'memo.dart';

class UserView extends StatefulWidget {
  const UserView({super.key, required this.ViewIndex});

  final int ViewIndex;

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  @override
  Widget build(BuildContext context) {
    final Size cSize = MediaQuery.of(context).size;

    //텍스트 컨트롤
    late TextEditingController userController;
    late FocusNode _focusNode;



    return Scaffold(
      appBar: AppBar(
        title: Text('유저 문제 푸는 페이지임'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(child: Text(usert[widget.ViewIndex].name),),
            Container(child: Text(usert[widget.ViewIndex].title),),
            Container(child: TextField(
            ),),
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

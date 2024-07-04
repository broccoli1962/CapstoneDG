import 'package:flutter/material.dart';
import 'package:untitled/practice.dart';
import 'package:untitled/setting.dart';
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

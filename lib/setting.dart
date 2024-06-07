import 'package:flutter/material.dart';
import 'package:untitled/memo.dart';
import 'package:untitled/practice.dart';
import 'package:untitled/test.dart';

class setting extends StatefulWidget {
  const setting({super.key});

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  @override
  Widget build(BuildContext context) {
    final Size cSize = MediaQuery.of(context).size;

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
                      Icons.person,
                      size: 50,
                    ),
                    Text(' 설정',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
<<<<<<< HEAD
=======
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
>>>>>>> main
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
<<<<<<< HEAD
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(
            height: 2,
            thickness: 1,
            color: Colors.black,
          ),
        ),
=======
>>>>>>> main
      ),
      body: Column(
        children: [
          Container(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
<<<<<<< HEAD
                  Text('계정 관리', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black)),
                  Container(
                    height: cSize.height*0.15,
                    width: cSize.width*0.9,
                    color: Colors.black12,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(onPressed: () {}, child: Text('로그인 하기', style: TextStyle(fontSize: 17, color: Colors.black),),),
=======
                  Text('계정관리'),
                  Container(
                    height: cSize.height*0.2,
                    width: cSize.width*0.9,
                    color: Colors.blueGrey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(onPressed: () {}, child: Text('로그인 하기', style: TextStyle(color: Colors.white),),),
>>>>>>> main
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
<<<<<<< HEAD
                Text('이용 정보', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black)),
                Container(
                  height: cSize.height*0.2,
                  width: cSize.width*0.9,
                  color: Colors.black12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(onPressed: () {}, child: Text('개인정보 이용 방침', style: TextStyle(fontSize: 17, color: Colors.black)),),
                      TextButton(onPressed: () {}, child: Text('이용 약관', style: TextStyle(fontSize: 17, color: Colors.black)),),
=======
                Text('이용정보'),
                Container(
                  height: cSize.height*0.2,
                  width: cSize.width*0.9,
                  color: Colors.blueGrey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(onPressed: () {}, child: Text('개인정보 이용 방침', style: TextStyle(color: Colors.white)),),
                      TextButton(onPressed: () {}, child: Text('이용 약관', style: TextStyle(color: Colors.white)),),
>>>>>>> main
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
<<<<<<< HEAD
                Text('설정', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black)),
                Container(
                  height: cSize.height*0.2,
                  width: cSize.width*0.9,
                  color: Colors.black12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(onPressed: () {}, child: Text('광고 제거 하기', style: TextStyle(fontSize: 17, color: Colors.black)),),
=======
                Text('설정'),
                Container(
                  height: cSize.height*0.2,
                  width: cSize.width*0.9,
                  color: Colors.blueGrey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(onPressed: () {}, child: Text('광고 제거 하기', style: TextStyle(color: Colors.white)),),
>>>>>>> main
                    ],
                  ),
                ),
              ],
            ),
<<<<<<< HEAD
          ),
=======
          )
>>>>>>> main
        ],
      ),
      bottomNavigationBar: Container(
        height: cSize.height * 0.129,
<<<<<<< HEAD
        color: Colors.white,
        child: Row(

=======
        color: Colors.cyan,
        child: Row(
>>>>>>> main
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
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => const memo()),
                              (route) => false);
                    },
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
                    onPressed: () {},
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

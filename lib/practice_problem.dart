import 'dart:core';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:untitled/practice.dart';
import 'package:untitled/test.dart';

class Practice_in extends StatefulWidget {
  const Practice_in({
    required this.pg,
    required this.number,
    super.key,
  });

  final int pg;
  final int number;

  @override
  State<Practice_in> createState() => _Practice_inState();
}

class _Practice_inState extends State<Practice_in> {

  @override
  Widget build(BuildContext context) {
    final Size cSize = MediaQuery.of(context).size;
    final Problem_p view = Problem_p.get(widget.pg, widget.number);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:false,
        title: Text(view.title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text('돌아가기')),
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          //
          Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(40, 40, 0, 0),
                  child: Text('설명\n ${view.contents}', style:TextStyle(color: Colors.white, fontSize: 15,fontWeight: FontWeight.bold, letterSpacing: 2.0)),
                  height: cSize.height*0.65,
                  width: double.infinity,
                  color: Colors.brown,
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(40, 40, 0, 0),
            height: cSize.height*0.145,
            width: double.infinity,
            color: Colors.lightBlueAccent,
            child: Text('팁 ${view.hint}', style:TextStyle(color: Colors.redAccent, fontSize: 15,fontWeight: FontWeight.bold, letterSpacing: 2.0)),
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
                          MaterialPageRoute(builder: (context) => const Practice()),
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
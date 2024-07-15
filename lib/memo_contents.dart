import 'package:flutter/material.dart';
import 'package:untitled/util.dart';

import 'memo.dart';

class Mcontents extends StatefulWidget {
  const Mcontents({super.key, required this.mnumber});

  final int mnumber;

  @override
  State<Mcontents> createState() => _McontentsState();
}

class _McontentsState extends State<Mcontents> {
  @override
  Widget build(BuildContext context) {
    final Size cSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
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
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(
            height: 1,
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
            height: cSize.height*0.15,
            child: Text(memos[widget.mnumber].Mtitle),
          ),
          const Divider(
            color: Colors.blue,
            height: 0.01,
          ),
          Container(
            color: Colors.white,
            width: double.infinity,
            height: cSize.height*0.6471,
            child: SingleChildScrollView(child: Text(memos[widget.mnumber].contents))
          ),
          const Divider(
            color: Colors.blue,
            height: 0.01,
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
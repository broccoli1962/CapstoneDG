import 'dart:core';
import 'package:flutter/material.dart';
import 'package:untitled/util.dart';

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
        title: Text(
          view.title, textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text('돌아가기')),
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(
            height: 2,
            thickness: 1,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  height: cSize.height*0.55,
                  width: double.infinity,
                  color: Colors.white,
                  child: SingleChildScrollView(
                      child: Text('${view.contents}', style:TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold, letterSpacing: 2.0))
                  ),
                )
              ],
            ),
          ),
          const Divider(
            color: Colors.black,
            height: 0.01,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            height: cSize.height*0.218,
            width: double.infinity,
            color: Colors.white,
            child: SingleChildScrollView(
                child: Text(view.hint, style:const TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.bold, letterSpacing: 2.0))
            ),
          ),
          const Divider(
            color: Colors.black,
            height:0.01,
          )
        ],
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
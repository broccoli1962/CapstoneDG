import 'dart:core';
import 'package:flutter/material.dart';
import 'main.dart';


class Front extends StatefulWidget {
  const Front({required this.pg, required this.number, super.key,});

  final int pg;
  final int number;

  @override
  State<Front> createState() => _FrontState();
}

class _FrontState extends State<Front> {

  @override
  Widget build(BuildContext context) {
    final Size cSize = MediaQuery.of(context).size;
    final Problem view = Problem.get(widget.pg, widget.number);

    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: const Text('문제 풀기'),
      ),
      body: Column(
        children: [
          //problem
          Container(
            width: double.infinity,
            height: cSize.height*0.25,
            decoration: const BoxDecoration(color: Colors.yellow),
            child: Text(view.title),
          ),
          //hint
          Container(
            width: double.infinity,
            height: cSize.height*0.25,
            decoration: const BoxDecoration(color: Colors.amber),
            child: Text(view.contents),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: cSize.height*0.1,
        color: Colors.cyan,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.bookmark,
              size: cSize.height*0.075,
            ),
            Icon(
              Icons.edit,
              size: cSize.height*0.075,
            ),
            Icon(
              Icons.perm_contact_calendar,
              size: cSize.height*0.075,
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/repository/database.dart';
import 'package:untitled/repository/databaseCrud.dart';
import 'main.dart';

class Front extends StatefulWidget {
  const Front({super.key});

  @override
  State<Front> createState() => _FrontState();
}

class _FrontState extends State<Front> {
  final _model = SqlDataBase();

  @override
  Widget build(BuildContext context) {
    final Size cSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: const Text('문제 풀기'),
      ),
      body: Column(
        children: [
          //problem name
          Container(
            width: double.infinity,
            height: cSize.height*0.25,
            decoration: const BoxDecoration(color: Colors.lightBlue),
            child: OutlinedButton(onPressed: (){
              var db= _model.database;
            },
              child: Text('DB생성'),
            ),

          ),
          //problem
          Container(
            width: double.infinity,
            height: cSize.height*0.25,
            decoration: const BoxDecoration(color: Colors.yellow),
          ),
          //hint
          Container(
            width: double.infinity,
            height: cSize.height*0.25,
            decoration: const BoxDecoration(color: Colors.amber),
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

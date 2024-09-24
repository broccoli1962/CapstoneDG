import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled/utils/database.dart';
import 'package:untitled/utils/util.dart';

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
  String title = "";
  String contents = "";
  String hint = "";

//data 가져오기
  Future<void> _initData() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final ref = db
        .collection("practice")
        .withConverter(
            fromFirestore: (snapshot, _) =>
                FireData_P.fromJson(snapshot.data()!),
            toFirestore: (FireData_P product, _) => product.toJson())
        .where("chapter", isEqualTo: widget.pg)
        .where("number", isEqualTo: widget.number);
    final docSnap = await ref.get();
    final inData = docSnap.docs.first.data();

    setState(() {
      title = inData.title.replaceAll("\\n", "\n");
      contents = inData.context.replaceAll("\\n", "\n");
      hint = inData.hint.replaceAll("\\n", "\n");
    });
  }

  @override
  void initState() {
    _initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size cSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(10), // 버튼의 크기 조절을 위한 여백
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: const BorderSide(
                  color: Color(0xFF4169E1),
                ),
                backgroundColor: Colors.white,
              ),
              child: const Text(
                '돌아가기',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 2, thickness: 1, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  height: cSize.height * 0.55,
                  width: double.infinity,
                  color: Colors.white,
                  child: SingleChildScrollView(
                      child: Text(contents,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0))),
                )
              ],
            ),
          ),
          const Divider(
            color: Colors.black,
            height: 0.01,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            height: cSize.height * 0.218,
            width: double.infinity,
            color: Colors.white,
            child: SingleChildScrollView(
                child: Text(hint,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0))),
          ),
        ],
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}

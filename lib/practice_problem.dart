import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/practice.dart';
import 'utils/http_api.dart';

class Front extends StatefulWidget {
  const Front({
    required this.pg,
    required this.number,
    super.key,
  });

  final int pg;
  final int number;

  @override
  State<Front> createState() => _FrontState();
}

class _FrontState extends State<Front> {
  final getapi = jdoodleAPI(ClientId: '', ClientSecret: '');
  String _output = '';

  @override
  Widget build(BuildContext context) {
    final Size cSize = MediaQuery.of(context).size;
    final Problem view = Problem.get(widget.pg, widget.number);

    //초기값
    String tt = view.contents;
    TextEditingController inputController = TextEditingController(text: tt);
    // final CustomTagController controller = CustomTagController();

    void dispose(){
      inputController.dispose();
      super.dispose();
    }


    Future<void> _executeCode() async {
      final code = view.contents+view.contents2;
      final language = 'c';

      try{
        final output = await getapi.executeCode(code, language);
        setState(() {
          _output = '출력 결과 : $output';
        });
      } on Exception catch(e){
        setState(() {
          _output = 'Error:$e';
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('문제 풀기'),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            //title
            Container(
              width: double.infinity,
              height: cSize.height * 0.17,
              padding: EdgeInsets.all(20),
              decoration: const BoxDecoration(color: Colors.yellow),
              child: Column(
                children: [
                  Text(view.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                  Text(view.title2, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                ],
              ),
            ),
            //problem
            Container(
              height: cSize.height * 0.4,
              child: TextFormField(
                cursorHeight: 22,
                cursorColor: Colors.orange,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                ),
                maxLines: 20,
              ),
            ),
            Divider(height: 0.1, color: Colors.black,),
            Container(
              width: double.infinity,
              height: cSize.height * 0.31,
              decoration: const BoxDecoration(color: Colors.white),
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        view.myAnswer = inputController.text;
                      });
                    },
                    child: Text('입력'),
                  ),
                  ElevatedButton(onPressed: _executeCode, child: Text('출력되라')),
                  Text('$_output'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: cSize.height*0.129,
        color: Colors.cyan,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: cSize.height*0.1,
              child: Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.keyboard_arrow_left),
                    iconSize: 40,
                    color: Colors.black,
                    onPressed: () {  },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: cSize.height*0.1,
              child: Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.home),
                    iconSize: 40,
                    color: Colors.black,
                    onPressed: () {  },
                  ),
                  Text("돌아가기", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            SizedBox(
              height: cSize.height*0.1,
              child: Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.keyboard_arrow_right),
                    iconSize: 40,
                    color: Colors.black,
                    onPressed: () {  },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'dart:core';
import 'package:flutter/material.dart';
import 'main.dart';
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
  final getapi = jdoodleAPI(ClientId: 'c545e7d1c9cfdfb23050d82cc1d7238e', ClientSecret: '3cfe0a0759248985345d668251e65b5335a633ef4de3000f900c7d8c5d7b1ad');
  String _output = '';

  @override
  Widget build(BuildContext context) {
    TextEditingController inputController = TextEditingController();
    final Size cSize = MediaQuery.of(context).size;
    final Problem view = Problem.get(widget.pg, widget.number);

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
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: const Text('문제 풀기'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //title
                Container(
                  width: double.infinity,
                  height: cSize.height * 0.25,
                  decoration: const BoxDecoration(color: Colors.yellow),
                  child: Text('$_output'),
                ),
                //problem
                Container(
                  width: double.infinity,
                  height: cSize.height * 0.25,
                  decoration: const BoxDecoration(color: Colors.amber),
                  child: Text(view.contents +view.myAnswer+view.contents2),
                ),
                Container(
                  width: double.infinity,
                  height: cSize.height * 0.31,
                  decoration: const BoxDecoration(color: Colors.white),
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: inputController,
                        decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(width: 1, color: Colors.redAccent),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(width: 1, color: Colors.redAccent),
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            labelText: 'input,'),
                      ),
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
        ),
      ),
      bottomNavigationBar: Container(
        height: cSize.height * 0.1,
        color: Colors.cyan,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.bookmark,
              size: cSize.height * 0.075,
            ),
            Icon(
              Icons.edit,
              size: cSize.height * 0.075,
            ),
            Icon(
              Icons.perm_contact_calendar,
              size: cSize.height * 0.075,
            ),
          ],
        ),
      ),
    );
  }
}

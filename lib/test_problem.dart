import 'dart:core';
import 'package:flutter/material.dart';
import 'package:untitled/util.dart';
import 'utils/http_api.dart';

class Test_in extends StatefulWidget {
  const Test_in({
    required this.pg,
    required this.number,
    super.key,
  });

  final int pg;
  final int number;

  @override
  State<Test_in> createState() => _Test_inState();
}


class _Test_inState extends State<Test_in> {
  final getapi = jdoodleAPI(ClientId: '', ClientSecret: '');
  String _output = '';

  late Problem_t view;

  //텍스트 컨트롤
  late CustomTextColor _controller;
  late FocusNode _focusNode;

  @override
  void initState(){
    super.initState();
    view = Problem_t.get(widget.pg, widget.number);
    _controller = CustomTextColor(text: view.contents);
    _focusNode = FocusNode();

    _focusNode.addListener(() {
      if(!_focusNode.hasFocus) {
        _changeTextFieldValue(_controller.text);
      }
    });
  }

  @override
  void dispose(){
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _changeTextFieldValue(String newValue){
    setState(() {
      _controller.text = newValue;
    });
  }

  //메인 화면 구성
  @override
  Widget build(BuildContext context) {
    final Size cSize = MediaQuery.of(context).size;
    final Problem_t view = Problem_t.get(widget.pg, widget.number);


    void explain(context){
      showDialog(context: context, builder: (BuildContext context) {
        return AlertDialog(
          title: Text('해설'),
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Text(view.hint, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          ),
          insetPadding: const EdgeInsets.all(10),
          actions: [
            OutlinedButton(onPressed: (){Navigator.of(context).pop(); }, child: Text('ok')),
          ],
        );
      }
      );
    }

//코딩 api
    Future<void> _executeCode() async {
      final code = view.contents;
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading:false,
        title: Text(view.title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text('돌아가기')),
        ],
        leading: Padding(
          padding: EdgeInsets.all(2.0),
          child: TextButton(child: Text('출력하기'), onPressed: (){}),
        ),
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

      body:
        Column(
          children: [
            Container(
              width: double.infinity,
              height: cSize.height * 0.17,
              padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
              decoration: const BoxDecoration(color: Colors.white),
              child: SingleChildScrollView( // SingleChildScrollView로 감싸기
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '입력 값',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    Text(view.testCase),
                  ],
                ),
              ),
            ),

            const Divider(
              color: Colors.black,
              height: 0.01,
            ),

            Container(
              width: double.infinity,
              height: cSize.height * 0.17,
              padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
              decoration: const BoxDecoration(color: Colors.white),
              child: SingleChildScrollView( // SingleChildScrollView로 감싸기
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '출력 값',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    Text(view.rtestCase2),
                  ],
                ),
              ),
            ),

            const Divider(
              color: Colors.black,
              height: 0.01,
            ),

            Container(
              width: double.infinity,
              height: cSize.height*0.55651,
              decoration: const BoxDecoration(color: Colors.white),
              padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: TextField(
                maxLines: 22,
                controller: _controller,
                focusNode: _focusNode,
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {explain(context);}, child: Text('문제풀이'),),
    );
  }
}
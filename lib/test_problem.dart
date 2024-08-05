import 'dart:core';
import 'package:flutter/material.dart';
import 'package:untitled/utils/util.dart';
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
  late String _contents;

  @override
  void initState(){
    super.initState();
    view = Problem_t.get(widget.pg, widget.number);
  }

  void _onChangedText(String newValue){
    setState(() {
      _contents = newValue;
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
          title: const Text('해설'),
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Text(view.hint, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
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
        title: Text(view.title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: const Text('돌아가기')),
        ],
        leading: Padding(
          padding: const EdgeInsets.all(2.0),
          child: TextButton(onPressed: _executeCode, child: const Text('출력하기')),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(
            height: 2,
            thickness: 1,
              color: Color(0xFF005629)
          ),
        ),
      ),

      body:
        Column(
          children: [
            Container(
              width: double.infinity,
              height: cSize.height * 0.17,
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
              decoration: const BoxDecoration(color: Colors.white),
              child: SingleChildScrollView( // SingleChildScrollView로 감싸기
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
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
                    const Text(
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
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: CustomTextField(
                onTextChanged: _onChangedText,
                initialText: view.contents,
                maxLines: 23,
              )
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {explain(context);}, child: Text('문제풀이'),),
    );
  }
}
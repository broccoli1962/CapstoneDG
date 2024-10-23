import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled/utils/database.dart';
import 'package:untitled/utils/util.dart';
import 'utils/http_api.dart';

class TestShow extends StatefulWidget {
  const TestShow({
    required this.pg,
    required this.number,
    super.key,
  });

  final int pg;
  final int number;

  @override
  State<TestShow> createState() => _TestShowState();
}

class _TestShowState extends State<TestShow> {
  //jdoodle api
  final getapi = JdoodleAPI(clientId: 'c545e7d1c9cfdfb23050d82cc1d7238e', clientSecret: '42abd4de7564b91e4c19d07ac7819b412b30835a6f227de0cdeb3afc158664f1');
  String _output = '';

  late String _contents;

  //코딩 api
  Future<void> _executeCode() async {
    late String code = _contents;
    const language = 'c';

    try {
      final output = await getapi.executeCode(code, language);
      setState(() {
        if(output == answer) {
          _output = '출력 결과 : \n$output\n정답입니다.';
        }else{
          _output = '오답입니다.';
        }
      });
    } on Exception catch (e) {
      setState(() {
        _output = 'Error:$e';
      });
    }

    finalData(context);
  }

  //텍스트 실시간 변경
  void _onChangedText(String newValue) {
    setState(() {
      _contents = newValue;
    });
  }

  //db
  String title = "";
  String testCase = "";
  String rtestCase = "";
  String contents = "";
  String hint = "";
  String answer = "";

  Future<void> _initData() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final ref = db
        .collection("test")
        .withConverter(
            fromFirestore: (snapshot, _) =>
                FireDataTest.fromJson(snapshot.data()!),
            toFirestore: (FireDataTest product, _) => product.toJson())
        .where("chapter", isEqualTo: widget.pg)
        .where("number", isEqualTo: widget.number);
    try{
      final docSnap = await ref.get();
      if(docSnap.docs.isNotEmpty){
        final inData = docSnap.docs.first.data();

        setState(() {
          title = inData.title.replaceAll("\\n", "\n");
          testCase = inData.testCase.replaceAll("\\n", "\n");
          rtestCase = inData.rtestCase.replaceAll("\\n", "\n");
          // contents = inData.context.replaceAll("\\n", "\n");
          tmp?.controller?.text = inData.context.replaceAll("\\n", "\n");
          hint = inData.hint.replaceAll("\\n", "\n");
          answer = inData.answer;
        });
      }else{
        setState(() {
          title = "데이터 불러오기 실패";
          testCase = "데이터 불러오기 실패";
          rtestCase = "데이터 불러오기 실패";
          contents = "데이터 불러오기 실패";
          hint = "데이터 불러오기 실패";
          answer = "데이터 불러오기 실패";
        });
      }
    }catch(e){
      print('error : $e');
    }
  }

  //메인 화면 구성
  void explain(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('해설'),
            content: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text(
                hint,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            insetPadding: const EdgeInsets.all(10),
            actions: [
              OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('ok')),
            ],
          );
        },
    );
  }

  void finalData(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('결과값'),
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Text(
              _output,
              style:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          insetPadding: const EdgeInsets.all(10),
          actions: [
            OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('ok')),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  CustomTextField ?tmp;

  @override
  Widget build(BuildContext context) {
    tmp = CustomTextField(
      onTextChanged: _onChangedText,
      initialText: contents,
      maxLines: 23,
    );
    final Size cSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
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
        leading: Padding(
          padding: const EdgeInsets.all(2),
          child: TextButton(
              onPressed: _executeCode,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: const BorderSide(
                  color: Color(0xFF4169E1),
                ),
                backgroundColor: Colors.white,
              ),
              child: const Text('출력하기', style: TextStyle(color: Colors.black))),
        ),
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
            width: double.infinity,
            height: cSize.height * 0.17,
            padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
            decoration: const BoxDecoration(color: Colors.white),
            child: SingleChildScrollView(
              // SingleChildScrollView로 감싸기
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '입력 값',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  Text(testCase),
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
            padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
            decoration: const BoxDecoration(color: Colors.white),
            child: SingleChildScrollView(
              // SingleChildScrollView로 감싸기
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '출력 값',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  Text(rtestCase),
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
              height: cSize.height * 0.55651,
              decoration: const BoxDecoration(color: Colors.white),
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: tmp,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          explain(context);
        },
        child: const Text('문제풀이'),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:untitled/utils/http_api.dart';
import 'package:untitled/utils/util.dart';

class UserView extends StatefulWidget {
  const UserView({super.key, required this.ViewIndex});

  final int ViewIndex;

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  //jdoodle api
  final getapi = jdoodleAPI(
      ClientId: 'c545e7d1c9cfdfb23050d82cc1d7238e',
      ClientSecret:
          '42abd4de7564b91e4c19d07ac7819b412b30835a6f227de0cdeb3afc158664f1');
  String _output = '';

  @override
  void initState(){
    super.initState();
  }

  //코딩 api
  Future<void> _executeCode() async {
    late String code = contentController;
    const language = 'c';

    try {
      final output = await getapi.executeCode(code, language);
      setState(() {
        _output = '출력 결과 : $output';
      });
    } on Exception catch (e) {
      setState(() {
        _output = 'Error:$e';
      });
    }
    finalData(context);
  }

  String contentController = "";

  void onChangedContentText(String newText) {
    setState(() {
      contentController = newText;
    });
  }

  void explain(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('해설'),
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Text(
              ulist[widget.ViewIndex].uhint,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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

  CustomTextField ?tmp;

  @override
  Widget build(BuildContext context) {
    final Size cSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          ulist[widget.ViewIndex].utitle,
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
                  Text(ulist[widget.ViewIndex].utestCase),
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
                  Text(ulist[widget.ViewIndex].urtestCase),
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
            child: tmp = CustomTextField(
              onTextChanged: onChangedContentText,
              initialText: ulist[widget.ViewIndex].ucontents,
              maxLines: 23,
            ),
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

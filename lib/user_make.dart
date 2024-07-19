import 'package:flutter/material.dart';
import 'package:untitled/user_main.dart';
import 'package:untitled/util.dart';

class UserMake extends StatefulWidget {
  const UserMake({super.key});

  @override
  State<UserMake> createState() => _UserMakeState();
}

class _UserMakeState extends State<UserMake> {
  @override
  Widget build(BuildContext context) {

    //텍스트 컨트롤
    late String titleController;
    late String contentController;

    void _onChangedText(String newText){
      setState(() {
        titleController = newText;
        contentController = newText;
      });
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('유저 문제 제작 페이지임'),
      ),
      body: Center(
        child: Column(
          children: [
            //제목
            Container(
              child: CustomTextField(
                initialText: "",
                onTextChanged: _onChangedText,
              ),
            ),
            //내용
            Container(
              child: CustomTextField(
                initialText: "",
                onTextChanged: _onChangedText,
                maxLines: 10,
              ),
            ),
            Container(
              child: Row(
                children: [
                  OutlinedButton(onPressed: (){
                    usert.add(UserT('null', titleController, contentController));
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const UserTest()), (route) => false);
                  }, child: Text('확인')),
                  OutlinedButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: Text('취소')),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}

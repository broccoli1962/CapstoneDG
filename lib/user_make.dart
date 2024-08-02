import 'package:flutter/material.dart';
import 'package:untitled/user_main.dart';
import 'package:untitled/utils/util.dart';

class UserMake extends StatefulWidget {
  const UserMake({super.key});

  @override
  State<UserMake> createState() => _UserMakeState();
}

//텍스트 컨트롤
String titleController = "";
String contentController = "";

class _UserMakeState extends State<UserMake> {
  @override
  Widget build(BuildContext context) {

    void onChangedTitleText(String newText){
      setState(() {
        titleController = newText;
      });
    }

    void onChangedContentText(String newText){
      setState(() {
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
                initialText: titleController,
                onTextChanged: onChangedTitleText,
              ),
            ),
            //내용
            Container(
              child: CustomTextField(
                initialText: contentController,
                onTextChanged: onChangedContentText,
                maxLines: 10,
              ),
            ),
            Container(
              child: Row(
                children: [
                  OutlinedButton(onPressed: (){
                    print(titleController);
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

//메모
import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled/practice.dart';
import 'package:untitled/setting.dart';
import 'package:untitled/test.dart';
import 'package:untitled/user_main.dart';

import '../memo.dart';
import 'database.dart';

class Memos {
  String Mtitle;
  String contents;

  Memos(this.Mtitle, this.contents);
}

class FilteredMemo extends Memos{
  FilteredMemo(super.Mtitle, super.contents, this.index);
  int index;
}

// 문제 클래스
class Problem_p {
  int page; // 장
  int number; // 문제 번호
  String title; // 제목
  String contents; // 내용
  String hint; // 힌트

  // 문제 목록
  //Problem(몇장, 몇번문제, 문제제목, 내용, 힌트;
  static List<Problem_p> problems = [

  ];

// 페이지와 문제 번호에 해당하는 문제 반환
  static Problem_p get(int a, int b) {
    for (Problem_p p in problems) {
      if (a == p.page && b == p.number) {
        return p;
      }
    }
    return dummy; // 문제가 없는 경우 더미 반환
  }

  // 더미 문제
  static Problem_p dummy = Problem_p(
    0,
    0,
    'dummy title',
    'contents',
    'hint',
  );

  // Problem_p 클래스 생성자
  Problem_p(this.page, this.number, this.title, this.contents, this.hint);
}


//시험
class Problem_t {
  int page;
  int number;
  String title;
  String testCase;
  String rtestCase2;
  String contents;
  String myAnswer;
  String hint;
  String answer;

  //Problem(몇장, 몇번문제, 제목, 조건값, 출력값, 내용, 정답, 문제풀이, 정답값),
  static List<Problem_t> problems = [
    Problem_t(
        1,
        1,
        '1-1\n<"Hi C programing">\n을 출력하세요.',
        '10\n20\n30\n40\n50\n60',
        'Hi C programing',
        //
        '#include <stdio.h>\n'
            'int main(){\n'
            '//안에 들어갈 내용을 적으세요.\n}',
        '',
        'hint',
        'answer'),
  ];

  static Problem_t get(int a, int b) {
    for (Problem_t p in problems) {
      if (a == p.page && b == p.number) {
        return p;
      }
    }
    return dummy;
  }

  static Problem_t dummy = Problem_t(
      0,
      0,
      'dummy title',
      'dummy testcase',
      'dummy rtestcase',
      'contents',
      'dummy',
      'hint',
      'answer');

  Problem_t(this.page, this.number, this.title, this.testCase, this.rtestCase2,
      this.contents,
      this.myAnswer, this.hint, this.answer);
}

//유저가 문제 제작
// class UserT {
//   String name;
//   String title;
//   String content;
//
//   UserT(this.name, this.title, this.content);
// }
//
// class UserList extends StatelessWidget {
//   UserList(this._data, this.number);
//
//   final UserT _data;
//   final int number;
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(_data.name),
//       subtitle: Text(_data.title),
//       onTap: () {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) =>
//                     UserView(ViewIndex: number)));
//       },
//     );
//   }
// }
//final List<UserT> usert = [];
Map<DocumentSnapshot,User_Create> uList = {};

//바텀 바 클래스
class BottomNav extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const BottomNav({super.key, 
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.1,
      child: Column(
        children: [
          IconButton(
            onPressed: onPressed,
            icon: Icon(icon),
            iconSize: 40,
            color: Colors.black,
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.black, width: 1),),
      ),
      height: MediaQuery.of(context).size.height * 0.129,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BottomNav(
            icon: Icons.menu_book,
            label: '공부',
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const Practice()),
                      (route) => false);
            },
          ),
          BottomNav(
            icon: Icons.sticky_note_2_outlined,
            label: '시험',
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const Test()),
                      (route) => false);
            },
          ),
          BottomNav(
            icon: Icons.person,
            label: '문제',
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const UserTest()),
                      (route) => false);
            },
          ),
          BottomNav(
            icon: Icons.draw,
            label: '메모',
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const memo()),
                      (route) => false);
            },
          ),
          /*BottomNav(
            icon: Icons.settings,
            label: '설정',
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const setting()),
                      (route) => false);
            },
          ),*/
        ],
      ),
    );
  }
}

//텍스트 색 변경
class CustomTextColor extends TextEditingController{
  CustomTextColor({super.text});

  @override
  TextSpan buildTextSpan({
    required BuildContext context,
    TextStyle? style,
    required bool withComposing,
  }){
    List<String> words = text.split(" ");
    List<TextSpan> children = [];
    for(final String word in words){
      TextSpan span;
      switch (word) {
        case "int":
          span = TextSpan(text: word, style: const TextStyle(color: Colors.red));
          break;
        case "float":
          span = TextSpan(text: word, style: const TextStyle(color: Colors.red));
          break;
        default:
          span = TextSpan(text: word, style: const TextStyle(color: Colors.black));
          break;
      }
      children.add(span);
      children.add(const TextSpan(text: " "));
    }
    return TextSpan(children: children);
  }
}

class CustomTextField extends StatefulWidget {
  final String initialText; //변화후 텍스트
  final ValueChanged<String> onTextChanged; //변경 전 텍스트
  int? maxLines;
  CustomTextColor ?controller;

  CustomTextField({super.key, 
    required this.initialText,
    required this.onTextChanged,
    this.maxLines,
});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}
//커스텀 텍스트 필드
class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode _focusNode;
  late CustomTextColor _controller;

  @override
  void initState(){
    super.initState();
    _controller = CustomTextColor(text: widget.initialText);
    widget.controller = _controller;

    _focusNode = FocusNode();

    _focusNode.addListener(() {
      if(!_focusNode.hasFocus){
        widget.onTextChanged(_controller.text);
      }
    });
  }

  @override
  void dispose(){
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      focusNode: _focusNode,
      maxLines: widget.maxLines,
      onChanged: widget.onTextChanged,
    );
  }
}
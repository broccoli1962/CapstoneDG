import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled/practice.dart';
import 'package:untitled/test.dart';
import 'package:untitled/user.dart';

import '../memo.dart';
import 'database.dart';

class Memos {
  String memoTitle;
  String contents;

  Memos(this.memoTitle, this.contents);
}

class FilteredMemo extends Memos{
  FilteredMemo(super.memoTitle, super.contents, this.index);
  int index;
}

Map<DocumentSnapshot,FireDataUser> uList = {};

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
                      builder: (context) => const User()),
                      (route) => false);
            },
          ),
          BottomNav(
            icon: Icons.draw,
            label: '메모',
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const Memo()),
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
      decoration: const InputDecoration(
        border: InputBorder.none,
      ),
      controller: _controller,
      focusNode: _focusNode,
      maxLines: widget.maxLines,
      onChanged: widget.onTextChanged,
    );
  }
}
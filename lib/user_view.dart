import 'package:flutter/material.dart';
import 'package:untitled/utils/util.dart';


class UserView extends StatefulWidget {
  const UserView({super.key, required this.ViewIndex});

  final int ViewIndex;

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  @override
  Widget build(BuildContext context) {
    final Size cSize = MediaQuery.of(context).size;

    //텍스트 컨트롤
    late TextEditingController userController;
    late FocusNode _focusNode;



    return Scaffold(
      appBar: AppBar(
        title: Text('유저 문제 푸는 페이지임'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(child: Text(usert[widget.ViewIndex].name),),
            Container(child: Text(usert[widget.ViewIndex].title),),
            Container(child: TextField(
            ),),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}

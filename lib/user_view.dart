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
        backgroundColor: Colors.white,
        title: Text('문제'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Text(usert[widget.ViewIndex].name),),
            Container(
              color: Colors.white,
              child: Text(usert[widget.ViewIndex].title),),
            Container(
              color: Colors.white,
              child: TextField(
            ),),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}

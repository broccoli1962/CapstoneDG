import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/user_main.dart';
import 'package:untitled/user_view.dart';
import 'package:untitled/utils/database.dart';
import 'package:untitled/utils/util.dart';

class UserUpdate extends StatefulWidget {
  const UserUpdate({super.key, required this.viewIndex});

  final int viewIndex;

  @override
  State<UserUpdate> createState() => _UserUpdateState();
}

// //텍스트 컨트롤
// String titleController = "";
// String contentController = "";

class _UserUpdateState extends State<UserUpdate> {
  final _formKey = GlobalKey<FormState>();
  final unameController = TextEditingController();
  final utitleController = TextEditingController();
  final utestcaseController = TextEditingController();
  final urtestcaseController = TextEditingController();
  final ucontentsController = TextEditingController();
  final uhintController = TextEditingController();
  final uanswerController = TextEditingController();
  final upwController = TextEditingController();

  @override
  void dispose() {
    unameController.dispose();
    utitleController.dispose();
    utestcaseController.dispose();
    urtestcaseController.dispose();
    ucontentsController.dispose();
    uhintController.dispose();
    uanswerController.dispose();
    upwController.dispose();
    super.dispose();
  }

  Future<void> updateData() async {
    // QuerySnapshot tmp = await FirebaseFirestore.instance.collection('user_create').get();
    // tmp.docs[viewIndex].id;
    DocumentSnapshot ss = uList.keys.elementAt(widget.viewIndex);
    User_Create dd = User_Create(
        uname: unameController.text,
        utitle: utitleController.text,
        utestCase: utestcaseController.text,
        urtestCase: urtestcaseController.text,
        ucontents: ucontentsController.text,
        uhint: uhintController.text,
        uanswer: uanswerController.text,
        upw: upwController.text
    );
    uList[ss] = dd;
    await ss.reference.update(dd.toJson());
    //ss.reference.update({});
  }

  @override
  void initState() {
    User_Create block = uList.values.elementAt(widget.viewIndex);
    unameController.text = block.uname;
    utitleController.text = block.utitle;
    utestcaseController.text = block.utestCase;
    urtestcaseController.text = block.urtestCase;
    ucontentsController.text = block.ucontents;
    uhintController.text = block.uhint;
    uanswerController.text = block.uanswer;
    upwController.text = block.upw;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person,
                      size: 50,
                    ),
                    Text(' 문제제작',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ],
        ),
        centerTitle: true,
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
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: unameController,
                      decoration: const InputDecoration(
                        labelText: '사용자 이름',
                        filled: true, // 배경 색상을 채우기 위해 true로 설정
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '사용자 이름을 입력하세요.';
                        }
                        return null;
                      },
                    ),
                    const Divider(
                      height: 2,
                      thickness: 1,
                      color: Colors.black,
                    ),
                    TextFormField(
                      controller: utitleController,
                      maxLines: 2,
                      decoration: const InputDecoration(
                        labelText: '제목 이름',
                        filled: true, // 배경 색상을 채우기 위해 true로 설정
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '제목을 입력하세요.';
                        }
                        return null;
                      },
                    ),
                    const Divider(
                      height: 2,
                      thickness: 1,
                      color: Colors.black,
                    ),
                    TextFormField(
                      controller: utestcaseController,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        labelText: '입력값',
                        filled: true, // 배경 색상을 채우기 위해 true로 설정
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '입력값를 입력하세요.';
                        }
                        return null;
                      },
                    ),
                    const Divider(
                      height: 2,
                      thickness: 1,
                      color: Colors.black,
                    ),
                    TextFormField(
                      controller: urtestcaseController,
                      maxLines: 2,
                      decoration: const InputDecoration(
                        labelText: '출력값',
                        filled: true, // 배경 색상을 채우기 위해 true로 설정
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '출력값을 입력하세요.';
                        }
                        return null;
                      },
                    ),
                    const Divider(
                      height: 2,
                      thickness: 1,
                      color: Colors.black,
                    ),
                    TextFormField(
                      controller: ucontentsController,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        labelText: '문제 내용',
                        filled: true, // 배경 색상을 채우기 위해 true로 설정
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '문제 내용를 입력하세요.';
                        }
                        return null;
                      },
                    ),
                    const Divider(
                      height: 2,
                      thickness: 1,
                      color: Colors.black,
                    ),
                    TextFormField(
                      controller: uhintController,
                      maxLines: 2,
                      decoration: const InputDecoration(
                        labelText: '힌트',
                        filled: true, // 배경 색상을 채우기 위해 true로 설정
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '힌트를 입력하세요.';
                        }
                        return null;
                      },
                    ),
                    const Divider(
                      height: 2,
                      thickness: 1,
                      color: Colors.black,
                    ),
                    TextFormField(
                      controller: uanswerController,
                      maxLines: 1,
                      decoration: const InputDecoration(
                        labelText: '정답',
                        filled: true, // 배경 색상을 채우기 위해 true로 설정
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '정답을 입력하세요.';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: upwController,
                      maxLines: 1,
                      decoration: const InputDecoration(
                        labelText: '비밀번호',
                        filled: true, // 배경 색상을 채우기 위해 true로 설정
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '비밀번호를 입력하세요.';
                        }
                        return null;
                      },
                    ),
                    const Divider(
                      height: 2,
                      thickness: 1,
                      color: Colors.black,
                    ),
                    Container(
                      color: Colors.white,
                      child: Row(
                        children: [
                          OutlinedButton(
                              onPressed: () {
                                updateData();
                                Navigator.pop(context);
                                Navigator.pop(context);
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => const UserTest()),
                                        (route) => false);
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => UserView(viewIndex: widget.viewIndex)));
                                //Navigator.pop(context);
                                //_createData();
                              },
                              child: const Text('확인')),
                          OutlinedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('취소')),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}

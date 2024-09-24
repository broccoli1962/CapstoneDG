import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled/utils/database.dart';
import 'package:untitled/utils/util.dart';

class UserMake extends StatefulWidget {
  const UserMake({super.key});

  @override
  State<UserMake> createState() => _UserMakeState();
}

// //텍스트 컨트롤
// String titleController = "";
// String contentController = "";

class _UserMakeState extends State<UserMake> {
  final _formKey = GlobalKey<FormState>();
  final unameController = TextEditingController();
  final utitleController = TextEditingController();
  final utestcaseController = TextEditingController();
  final urtestcaseController = TextEditingController();
  final ucontentsController = TextEditingController();
  final uhintController = TextEditingController();
  final uanswerController = TextEditingController();

  @override
  void dispose() {
    unameController.dispose();
    utitleController.dispose();
    utestcaseController.dispose();
    urtestcaseController.dispose();
    ucontentsController.dispose();
    uhintController.dispose();
    uanswerController.dispose();
    super.dispose();
  }

  Future<void> _createData() async {
    final userCreate = User_Create(
        uname: unameController.text,
        utitle: utitleController.text,
        utestCase: utestcaseController.text,
        urtestCase: urtestcaseController.text,
        ucontents: ucontentsController.text,
        uhint: uhintController.text,
        uanswer: uanswerController.text);

    try {
      await FirebaseFirestore.instance
          .collection('user_create')
          .add(userCreate.toJson());

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('문제 업로드 완료')),
      );
      Navigator.pop(context);
    } catch (e) {
      print('데이터 처리 오류: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    // void onChangedTitleText(String newText){
    //   setState(() {
    //     titleController = newText;
    //   });
    // }
    //
    // void onChangedContentText(String newText){
    //   setState(() {
    //     contentController = newText;
    //   });
    // }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: const Text('문제제작')),
      body: Column(
        children: [
          const Divider(
            height: 2,
            thickness: 1,
            color: Colors.black,
          ),
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
                      decoration: const InputDecoration(
                        labelText: '테스트 케이스',
                        filled: true, // 배경 색상을 채우기 위해 true로 설정
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '테스트 케이스를 입력하세요.';
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
                      decoration: const InputDecoration(
                        labelText: '테스트 케이스 반환값',
                        filled: true, // 배경 색상을 채우기 위해 true로 설정
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '테스트 케이스 반환값을 입력하세요.';
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
                    const Divider(
                      height: 2,
                      thickness: 1,
                      color: Colors.black,
                    ),
                    // //제목
                    // Container(
                    //   color: Colors.white,
                    //   child: CustomTextField(
                    //     initialText: titleController,
                    //     onTextChanged: onChangedTitleText,
                    //   ),
                    // ),
                    // //내용
                    // Container(
                    //   color: Colors.white,
                    //   child: CustomTextField(
                    //     initialText: contentController,
                    //     onTextChanged: onChangedContentText,
                    //     maxLines: 10,
                    //   ),
                    // ),
                    Container(
                      color: Colors.white,
                      child: Row(
                        children: [
                          OutlinedButton(
                              onPressed: () {
                                _createData();
                                //ulist.add(User_Create(uname: 'null', utitle: titleController, utestCase: 'null', urtestCase: 'null', ucontents: contentController, uhint: 'null', uanswer: 'null'));
                                // Navigator.of(context).pushAndRemoveUntil(
                                //     MaterialPageRoute(builder: (
                                //         context) => const UserTest()), (route) => false);
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

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/memo.dart';
import 'package:untitled/memo_contents.dart';
import 'package:untitled/utils/util.dart';

class MemoUpdate extends StatefulWidget {
  const MemoUpdate({super.key, required this.viewIndex});

  final int viewIndex;

  @override
  State<MemoUpdate> createState() => _MemoUpdateState();
}

class _MemoUpdateState extends State<MemoUpdate> {
  final _formKey = GlobalKey<FormState>();
  final MtitleController = TextEditingController();
  final McontentsController = TextEditingController();

  Future<void> loadMemos() async{
    final prefs = await SharedPreferences.getInstance();
    final encodeMemo = prefs.getStringList('memos');
    if(encodeMemo != null){
      memos = encodeMemo.map((encodeMemo) {
        final memoData = encodeMemo.split(',');
        return Memos(memoData[0], memoData[1]);
      }).toList();
    }
  }

  Future<void> saveMemo() async {
    memos[widget.viewIndex].Mtitle = MtitleController.text;
    memos[widget.viewIndex].contents = McontentsController.text;
    final prefs = await SharedPreferences.getInstance();
    final encodeMemo = memos.map((memo)=> '${memo.Mtitle},${memo.contents}').toList();
    await prefs.setStringList('memos', encodeMemo);
  }

  @override
  void initState() {
    loadMemos();
    MtitleController.text = memos[widget.viewIndex].Mtitle;
    McontentsController.text = memos[widget.viewIndex].contents;
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    MtitleController.dispose();
    McontentsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
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
                        Icons.menu_book,
                        size: 50,
                      ),
                      Text('메모수정',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
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
                      controller: MtitleController,
                      decoration: const InputDecoration(
                        labelText: '제목',
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
                      controller: McontentsController,
                      maxLines: 10,
                      decoration: const InputDecoration(
                        labelText: '내용',
                        filled: true, // 배경 색상을 채우기 위해 true로 설정
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '내용을 입력하세요.';
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
                                saveMemo();
                                Navigator.pop(context);
                                Navigator.pop(context);
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => const memo()),
                                        (route) => false);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Mcontents(
                                            mnumber: widget.viewIndex)));
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

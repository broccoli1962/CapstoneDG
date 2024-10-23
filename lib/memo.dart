import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/memo_insert.dart';
import 'package:untitled/utils/util.dart';
import 'memo_show.dart';

class Memo extends StatefulWidget {
  const Memo({super.key});

  @override
  State<Memo> createState() => _MemoState();
}

List<Memos> memos = [];
List<Memos> filtered = [];
TextEditingController searchController = TextEditingController();

class _MemoState extends State<Memo> {
  @override
  void initState() {
    super.initState();
    searchController.addListener(searchFilter);
    searchFilter();
    loadMemos();
  }

  Future<void> loadMemos() async{
    final prefs = await SharedPreferences.getInstance();
    final encodeMemo = prefs.getStringList('memos');
    if(encodeMemo != null){
      memos = encodeMemo.map((encodeMemo) {
        final memoData = encodeMemo.split(',');
        return Memos(memoData[0], memoData[1]);
      }).toList();
    }
    searchFilter();
  }

  Future<void> saveMemo() async {
    final prefs = await SharedPreferences.getInstance();
    final encodeMemo = memos.map((memo)=> '${memo.memoTitle},${memo.contents}').toList();
    await prefs.setStringList('memos', encodeMemo);
  }

  void searchFilter() {
    filtered.clear();
    final munja = searchController.text.toLowerCase();
    for (int i = 0; i < memos.length; i++) {
      Memos memo = memos[i];
      if (munja.isEmpty || memo.memoTitle.toLowerCase().contains(munja)) {
        filtered.add(FilteredMemo(memo.memoTitle, memo.contents, i));
      }
    }
    setState(() {});
  }

  @override
  void dispose() {
    searchController.removeListener(searchFilter);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size cSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          // AppBar 정의
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
                        Icons.draw,
                        size: 50,
                      ),
                      Text(' 메모',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(1),
            child: Divider(height: 2, thickness: 1, color: Colors.black),
          ),
        ),
      ),
      body: Column(
        children: [
          //검색 바
          SearchBar(
            controller: searchController,
            leading: const Icon(Icons.search, color: Colors.blue),
            backgroundColor: const WidgetStatePropertyAll(Colors.white),
            shape: WidgetStateProperty.all(const ContinuousRectangleBorder()),
            side: WidgetStateProperty.all(
                const BorderSide(color: Colors.white, width: 0)), // 테두리 색상 변경
          ),
          const Divider(
            height: 2,
            thickness: 1,
            color: Colors.grey,
          ),
          Container(
            color: Colors.white,
            width: double.infinity,
            height: cSize.height * 0.695,
            child: ListView.separated(
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                FilteredMemo memo = filtered[index] as FilteredMemo;
                return ListTile(
                  title: Text(memo.memoTitle),
                  trailing: IconButton(
                    onPressed: () {
                      memos.removeAt(memo.index);
                      saveMemo();
                      // memos.removeAt(index);
                      searchFilter();
                    },
                    icon: const Icon(Icons.delete),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MemoShow(
                                  mnumber: memo.index,
                                )));
                  },
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  height: 2,
                  color: Colors.black,
                  indent: 20,
                  endIndent: 20,
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomBar(),
      floatingActionButton: Stack(
        children: [
          Align(
            alignment:
                Alignment(Alignment.bottomRight.x, Alignment.bottomRight.y),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MemoInsert()));
              },
              tooltip: '추가',
              child: const Text(
                '추가',
                style: TextStyle(fontSize: 17, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

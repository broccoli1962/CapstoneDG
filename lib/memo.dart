import 'package:flutter/material.dart';
import 'package:untitled/memo_insert.dart';
import 'package:untitled/util.dart';

import 'memo_contents.dart';

class memo extends StatefulWidget {
  const memo({super.key});

  @override
  State<memo> createState() => _memoState();
}

List<Memos> memos = [];
List<Memos> filtered = [];

class _memoState extends State<memo> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchController.addListener(Searchfilter);
    filtered = memos;
  }

  void Searchfilter() {
    final munja = searchController.text.toLowerCase();
    setState(() {
      filtered = memos.where((memo) {
        return memo.Mtitle.toLowerCase().contains(munja);
      }).toList();
    });
  }

  @override
  void dispose() {
    searchController.removeListener(Searchfilter);
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size cSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
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
                      size: 40,
                    ),
                    Text(' 메모리스트',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
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
          child: Divider(
            height: 2,
            thickness: 1,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          //검색 바
          Container(
            child: TextField(
              controller: searchController,
              maxLines: 1,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.blueAccent,
                ),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            width: double.infinity,
            height: cSize.height * 0.710,
            child: ListView.separated(
              itemCount: memos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(memos[index].Mtitle),
                  trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        memos.removeAt(index);
                      });
                    },
                    icon: const Icon(Icons.delete),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Mcontents(
                                  mnumber: index,
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
          const Divider(
            color: Colors.black,
            height: 0.01,
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(),
      floatingActionButton: Stack(
        children: [
          Align(
            alignment: Alignment(
                Alignment.bottomRight.x - 0.4, Alignment.bottomRight.y),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Minsert()));
              },
              tooltip: '추가',
              child: const Text('추가'),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: () {},
              tooltip: '삭제',
              child: const Text('삭제'),
            ),
          ),
        ],
      ),
    );
  }
}

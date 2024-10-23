import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled/user_create.dart';
import 'package:untitled/user_show.dart';
import 'package:untitled/utils/database.dart';
import 'utils/util.dart';

class User extends StatefulWidget {
  const User({super.key});

  @override
  State<User> createState() => _UserState();
}

String searchText = "";

class _UserState extends State<User> {
  TextEditingController searchController = TextEditingController();

  Future<void> _initData() async {
    final QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('user_create').get();
    uList.clear();
    for(var docs in snapshot.docs){
      uList[docs] = FireDataUser.fromJson(docs.data() as Map<String, dynamic>);
    }
    searchFilter();
  }

  List<FireDataUser> filtered = [];

  @override
  void initState() {
    _initData();
    super.initState();
    searchController.addListener(searchFilter);
    filtered = uList.values.toList();
  }

  void searchFilter() {
    final munja = searchController.text.toLowerCase();
    setState(() {
      filtered = uList.values.where((us) {
        return us.uname.toLowerCase().contains(munja);
      }).toList();
    });
  }

  @override
  void dispose() {
    searchController.removeListener(searchFilter);
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
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
                      Text(' 문제',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ],
          ),
          backgroundColor: Colors.white,
          actions: [
            Container(
              margin: const EdgeInsets.all(10), // 버튼 외부 여백 설정
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const UserCreate()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // 버튼 배경색
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  side: const BorderSide(
                    color: Color(0xFF4169E1),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 8), // 버튼 크기 조정
                ),
                child: const Text(
                  '문제 만들기',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(1.0),
            child: Divider(
              height: 2,
              thickness: 1,
              color: Colors.black,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            //검색 바
            Container(
              color: Colors.white,
              child: TextField(
                controller: searchController,
                maxLines: 1,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (buildContext, int index) {
                  return ListTile(
                      title: Text(filtered[index].uname),
                      subtitle: Text(filtered[index].utitle),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    UserShow(viewIndex: uList.values.toList().indexOf(filtered[index]))));
                      });
                  //return UserList(filtered[index], index);
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                  height: 2,
                  thickness: 1,
                  color: Colors.black,
                ),
                itemCount: filtered.length, //filtered.length,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}

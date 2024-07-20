import 'package:flutter/material.dart';
import 'package:untitled/user_make.dart';
import 'util.dart';

class UserTest extends StatefulWidget {
  const UserTest({super.key});

  @override
  State<UserTest> createState() => _UserTestState();
}

String searchText = "";

class _UserTestState extends State<UserTest> {
  TextEditingController searchController = TextEditingController();
  List<UserT> filtered = [];

  @override
  void initState(){
    super.initState();
    searchController.addListener(Searchfilter);
    filtered = usert;
  }

  void Searchfilter(){
    final munja = searchController.text.toLowerCase();
    setState(() {
      filtered = usert.where((us) {
        return us.title.toLowerCase().contains(munja);
      }).toList();
    });
  }

  @override
  void dispose(){
    searchController.removeListener(Searchfilter);
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                      size: 40,
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
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const UserMake()),
                );
              },
              child: const Text('문제 만들기')),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(
            height: 1,
            thickness: 1,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
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
            Expanded(
              child: ListView.separated(
                itemBuilder: (BuildContext, int index) {
                  return UserList(filtered[index], index);
                },

                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemCount: filtered.length,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
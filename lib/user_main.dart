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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('hello'),
        backgroundColor: Colors.greenAccent,
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
      ),
      body: Center(
        child: ListView.separated(
          itemBuilder: (BuildContext, int index) {
            return UserList(usert[index], index);
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemCount: usert.length,
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
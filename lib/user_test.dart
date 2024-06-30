import 'package:flutter/material.dart';

class UserTest extends StatefulWidget {
  const UserTest({super.key});

  @override
  State<UserTest> createState() => _UserTestState();
}

class _UserTestState extends State<UserTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('hello'),
        ),
    );
  }
}

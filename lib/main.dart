import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Test",
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

enum Page { A, B, C, D }

List<int> list = [3, 2, 4, 4];

class _MainPageState extends State<MainPage> {
  Page page = Page.A;

  var isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //book image
          Flexible(
              flex: 30,
              child: Container(
                  height: 180,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: const Column(
                    children: [
                      Icon(
                        Icons.book,
                        size: 100,
                      ),
                      Text(
                        '공부',
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ))),
          //witch page?
          Flexible(
            flex: 25,
            child: Container(
              width: double.infinity,
              height: 230,
              decoration: BoxDecoration(
                  color: Colors.blue, border: Border.all(color: Colors.black)),
              child: Center(
                child: ListView(
                  children: [
                    RadioListTile(
                      title: const Text("radio 1"),
                      value: Page.A,
                      groupValue: page,
                      onChanged: ((Page? value) {
                        setState(() {
                          page = value!;
                        });
                      }),
                    ),
                    RadioListTile(
                      title: const Text("radio 2"),
                      value: Page.B,
                      groupValue: page,
                      onChanged: ((Page? value) {
                        setState(() {
                          page = value!;
                        });
                      }),
                    ),
                    RadioListTile(
                      title: const Text("radio 3"),
                      value: Page.C,
                      groupValue: page,
                      onChanged: ((Page? value) {
                        setState(() {
                          page = value!;
                        });
                      }),
                    ),
                    RadioListTile(
                      title: const Text("radio 4"),
                      value: Page.D,
                      groupValue: page,
                      onChanged: ((Page? value) {
                        setState(() {
                          page = value!;
                        });
                      }),
                    )
                  ],
                ),
              ),
            ),
          ),
          //witch page count?
          Flexible(
            flex: 45,
            child: Container(
              width: double.infinity,
              color: Colors.yellow,
              child: ListView(
                children: [
                  for (int i = 0; i < list[page.index]; i++) MakeTest(pg: page),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 100,
        color: Colors.cyan,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.book,
              size: 80,
            ),
            Icon(
              Icons.book,
              size: 80,
            ),
            Icon(
              Icons.book,
              size: 80,
            ),
          ],
        ),
      ),
    );
  }
}

class MakeTest extends StatelessWidget {
  const MakeTest({
    super.key,
    required this.pg,
  });

  final Page pg;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 2, 0, 0),
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      // color: Colors.lightBlueAccent,
      child: ElevatedButton(
        onPressed: () {},
        child: Text("problem $pg"),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber,
        ),
      ),
    );
  }
}

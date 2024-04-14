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

List<String> nameList = ['1장', '2장', '3장', '4장'];

List<int> list = [3, 2, 6, 8];

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
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  children: [
                    for (int i = 0; i < Page.values.length; i++)
                      RadioListTile(
                          title: Text(nameList[i]),
                          value: Page.values[i],
                          groupValue: page,
                          onChanged: ((Page? value) {
                            setState(() {
                              page = value!;
                            });
                          }))
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
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
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
              Icons.bookmark,
              size: 80,
            ),
            Icon(
              Icons.edit,
              size: 80,
            ),
            Icon(
              Icons.perm_contact_calendar,
              size: 80,
            ),
          ],
        ),
      ),
    );
  }
}

//문제칸 만들기
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
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber,
        ),
        child: Text("problem $pg"),
      ),
    );
  }
}

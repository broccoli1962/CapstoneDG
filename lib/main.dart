import 'package:flutter/material.dart';

void main() => runApp(MyApp());

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

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(
       children: [
         //book image
         Container(
           height: 180,
           padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
           child: const Column(
             children: [
               Icon(Icons.book, size: 100,),
               Text('공부',style: TextStyle(fontSize: 30),),
             ],
           )
         ),
         //witch page?
         Container(
           width: double.infinity,
           height:  230,

           decoration: BoxDecoration(
             color: Colors.blue,
             border: Border.all(color: Colors.black)
           ),

           child: const Row(
             children: [
               Text('hello', style: TextStyle(fontSize: 20),),
               Text('hello', style: TextStyle(fontSize: 20),),
               Text('hello', style: TextStyle(fontSize: 20),),
             ],
           ),
         ),
         //witch page count?
         Expanded(
           child: Container(
             width: double.infinity,
             height: 200,
             color: Colors.yellow,
           ),
         )
       ],
     ), 
      bottomNavigationBar: const SizedBox(
        height: 130,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.book, size: 80,),
              Icon(Icons.book, size: 80,),
              Icon(Icons.book, size: 80,),
            ],
          ),
        ),
    );
  }
}

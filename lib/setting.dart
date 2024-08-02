import 'package:flutter/material.dart';
import 'package:untitled/utils/util.dart';

class setting extends StatefulWidget {
  const setting({super.key});

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
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
                      Icons.settings,
                      size: 40,
                    ),
                    Text(' 설정',
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
          Container(
            color: Colors.white,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('계정 관리', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black)),
                  Container(
                    height: cSize.height*0.15,
                    width: cSize.width*0.9,
                    color: Colors.black12,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(onPressed: () {}, child: Text('로그인 하기', style: TextStyle(fontSize: 17, color: Colors.black),),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Container(
            color: Colors.white,
            child: Center(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('이용 정보', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black)),
                Container(
                  height: cSize.height*0.2,
                  width: cSize.width*0.9,
                  color: Colors.black12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(onPressed: () {}, child: Text('개인정보 이용 방침', style: TextStyle(fontSize: 17, color: Colors.black)),),
                      TextButton(onPressed: () {}, child: Text('이용 약관', style: TextStyle(fontSize: 17, color: Colors.black)),),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ),

          Container(
            color: Colors.white,
            child: Center(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('설정', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black)),
                Container(
                  height: cSize.height*0.2,
                  width: cSize.width*0.9,
                  color: Colors.black12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(onPressed: () {}, child: Text('광고 제거 하기', style: TextStyle(fontSize: 17, color: Colors.black)),),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ),
          Container(
            color: Colors.white,
            height: cSize.height*0.110,
          ),
          const Divider(
            color: Colors.black,
            height: 0.01,
          ),
        ],
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
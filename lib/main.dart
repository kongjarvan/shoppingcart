import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// 실행클래스
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // const 붙이면 싱글톤 패턴을 따로 구현할 필요가 없음
      home: HomePage(),
    );
  }
}

// 첫페이지
class HomePage extends StatelessWidget {
  // final을 붙이면 상태가 없는 변수가 됨 (상수)

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("HomePage 실행됨");
    return Scaffold(
      body: Column(
        children: [
          DayComponent(),
          Container(
            color: Colors.blue,
            height: 200,
            child: Text(
              "밤",
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}

class DayComponent extends StatefulWidget {
  const DayComponent({Key? key}) : super(key: key);

  @override
  State<DayComponent> createState() => _DayComponentState();
}

class _DayComponentState extends State<DayComponent> {
  String upData = "낮";

  @override
  Widget build(BuildContext context) {
    print("실행됨");
    return Row(
      children: [
        ElevatedButton(
            onPressed: () {
              setState(() {
                upData = "해";
              }); // setState로 값 변경시, 변경 후 화면 다시 그림
              print(upData);
            },
            child: Text("클릭")),
        Container(
          color: Colors.yellow,
          height: 200,
          child: Text(
            "${upData}",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}

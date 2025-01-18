import 'package:flutter/material.dart';

class MyProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu), // 메뉴 버튼
          onPressed: () {
            // 메뉴 버튼 클릭 시 동작
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('메뉴 버튼 클릭됨')),
            );
          },
        ),
        title: Text('마이 프로필'), // 제목
        actions: [
          IconButton(
            icon: Icon(Icons.settings), // 설정 버튼
            onPressed: () {
              // 설정 버튼 클릭 시 동작
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('설정 버튼 클릭됨')),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          '마이 프로필 화면',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

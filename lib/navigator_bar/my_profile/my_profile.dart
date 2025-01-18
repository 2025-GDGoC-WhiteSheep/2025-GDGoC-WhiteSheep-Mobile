import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProfileScreen extends StatefulWidget {
  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  String _nickname = '...'; // 닉네임 초기값

  @override
  void initState() {
    super.initState();
    _loadNickname(); // 닉네임 로드
  }

  // 닉네임 불러오기
  Future<void> _loadNickname() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _nickname = prefs.getString('nickname') ?? 'Guest'; // 닉네임 로드, 없으면 'Guest'
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, // AppBar 배경색 검정
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white), // 메뉴 버튼 아이콘 흰색
          onPressed: () {
            // 메뉴 버튼 클릭 시 동작
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('메뉴 버튼 클릭됨')),
            );
          },
        ),
        title: Text(
          '마이 프로필',
          style: TextStyle(color: Colors.white), // 제목 텍스트 흰색
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white), // 설정 버튼 아이콘 흰색
            onPressed: () {
              // 설정 버튼 클릭 시 동작
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('설정 버튼 클릭됨')),
              );
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.black, // 화면 배경색 검정
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 닉네임 왼쪽 정렬
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0), // 닉네임 상단 간격
              child: Text(
                _nickname, // 닉네임 텍스트
                style: TextStyle(
                  fontSize: 25, // 텍스트 크기
                  fontWeight: FontWeight.bold, // 볼드체
                  color: Colors.white, // 닉네임 텍스트 흰색
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  '마이 프로필 화면',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white, // 화면 텍스트 흰색
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

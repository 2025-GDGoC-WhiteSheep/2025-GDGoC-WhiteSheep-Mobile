import 'package:flutter/material.dart';

class backEnd extends StatefulWidget {
  const backEnd({super.key});

  @override
  State<backEnd> createState() => _backEndState();
}

class _backEndState extends State<backEnd> {
  int _currentIndex = 1; // 현재 선택된 탭 설정 (탐색 탭)

  final List<Widget> _tabs = [
    Center(child: Text('홈')), // 홈 탭
    Center(child: Text('탐색')), // 탐색 탭 (현재 페이지)
    Center(child: Text('마이 프로필')), // 마이 프로필 탭
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C1C21),
        elevation: 0,
        title: Row(
          children: [
            Icon(Icons.vpn_key, color: Colors.white),
            SizedBox(width: 8), // 아이콘과 텍스트 간격
            Text(
              'K-word',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.search, color: Colors.white),
          ),
        ],
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF212429), // Navigation Bar 색상 변경
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white, // 선택된 아이템 색상
        unselectedItemColor: Colors.grey, // 선택되지 않은 아이템 색상
        onTap: _onTap,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '탐색'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '마이 프로필'),
        ],
      ),
    );
  }
}

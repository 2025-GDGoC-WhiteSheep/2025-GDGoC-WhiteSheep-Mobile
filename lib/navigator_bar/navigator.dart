import 'package:flutter/material.dart';
import 'package:gdgoc2025whitesheepmobile/navigator_bar/search/search.dart';
import 'package:gdgoc2025whitesheepmobile/router/router.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    Center(child: Text('홈')),
    KeywordPageWrapper(), // Wrapping KeywordPage to retain navigation bar
    Center(child: Text('마이 프로필')),
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF212429), // Navigation Bar 색상 변경
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

class KeywordPageWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => Theme(
            data: ThemeData(
              scaffoldBackgroundColor: Color(0xFF212429), // 배경색 설정
              textTheme: TextTheme(
                bodyLarge: TextStyle(color: Colors.white),
                bodyMedium: TextStyle(color: Colors.white),
              ),
              appBarTheme: AppBarTheme(
                backgroundColor: Color(0xFF212429),
                iconTheme: IconThemeData(color: Colors.white),
                titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              iconTheme: IconThemeData(color: Colors.white),
            ),
            child: KeywordPage(),
          ),
        );
      },
    );
  }
}

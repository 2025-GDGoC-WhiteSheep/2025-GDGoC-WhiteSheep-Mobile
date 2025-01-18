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
            // 친구도 나도 100% 이득 박스
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xFF292929), // 배경색
                  borderRadius: BorderRadius.circular(10), // 모서리 둥글게
                ),
                padding: EdgeInsets.all(16), // 내부 여백
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 텍스트 부분
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '친구도 나도 100% 이득!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4), // 텍스트 간격
                          Text(
                            '친구에게 K-word를 소개해주세요.',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // 이미지 부분
                    Image.asset(
                      'assets/images/key-icon.png',
                      width: 40, // 이미지 너비
                      height: 40, // 이미지 높이
                      fit: BoxFit.contain, // 이미지 비율 유지
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20), // 아래 UI와 간격
            // 랭킹, 컨텐츠 등록하기, 최근 본 컨텐츠
            Column(
              children: [
                // 랭킹 버튼
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: ElevatedButton(
                    onPressed: () {}, // 버튼 동작은 추가하지 않음
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF292929), // 배경색
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // 모서리 둥글게
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16), // 버튼 내부 여백
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.emoji_events, color: Colors.white, size: 24),
                        SizedBox(width: 16),
                        Text(
                          '랭킹',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // 컨텐츠 등록하기 버튼
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: ElevatedButton(
                    onPressed: () {}, // 버튼 동작은 추가하지 않음
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF292929), // 배경색
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // 모서리 둥글게
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16), // 버튼 내부 여백
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.favorite, color: Colors.white, size: 24),
                        SizedBox(width: 16),
                        Text(
                          '컨텐츠 등록하기',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // 최근 본 컨텐츠 버튼
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: ElevatedButton(
                    onPressed: () {}, // 버튼 동작은 추가하지 않음
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF292929), // 배경색
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // 모서리 둥글게
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16), // 버튼 내부 여백
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.article, color: Colors.white, size: 24),
                        SizedBox(width: 16),
                        Text(
                          '최근 본 컨텐츠',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20), // 간격 추가
            // 이미지 카드
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFFFF),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/and.png',
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 10),
                    Text(
                      '디자이너가 꼭 기억해야 할 5가지 UX 법칙',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // UI 항목 빌더
  Widget _buildListItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 56,
          decoration: BoxDecoration(
            color: Color(0xFF292929),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Icon(icon, color: Colors.white, size: 24),
              SizedBox(width: 16),
              Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

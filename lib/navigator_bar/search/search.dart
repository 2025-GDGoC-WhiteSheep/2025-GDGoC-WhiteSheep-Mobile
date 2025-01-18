import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class KeywordPage extends StatefulWidget {
  @override
  _KeywordPageState createState() => _KeywordPageState();
}

class _KeywordPageState extends State<KeywordPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C21), // 배경 색상
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // "키워드로 몰입주제 찾기" 제목
            Text(
              '키워드로 몰입주제 찾기',
              style: TextStyle(
                color: const Color(0xFF82B2FC),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 60),
            Text(
              '기획자',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _buildButton('+ PM', '/PM'),
                _buildButton('+ 앱 기획', '/APP'),
                _buildButton('+ 웹 기획', '/WEB'),
              ],
            ),
            SizedBox(height: 20),
            Text(
              '개발자',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _buildButton('+ 프론트', '/FRONT'),
                _buildButton('+ 백엔드', '/BACK'),
                _buildButton('+ 풀스택', '/FULL'),
              ],
            ),
            SizedBox(height: 20),
            Text(
              '디자이너',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _buildButton('+ UI/UX디자인', '/UIUX'),
                _buildButton('+ 그래픽 디자인', '/GRAPHIC'),
                _buildButton('+ 인하우스', '/INHOUSE'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 추천 항목을 나타내는 둥근 버튼 형태
  Widget _buildButton(String label, String route) {
    return ElevatedButton(
      onPressed: () {
        // 지정된 경로로 이동
        context.go(route);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey.shade800, // 버튼 배경색
        shape: StadiumBorder(), // 둥근 모양
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      child: Text(
        label,
        style: TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }
}

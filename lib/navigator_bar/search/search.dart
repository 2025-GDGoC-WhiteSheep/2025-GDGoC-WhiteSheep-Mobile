import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class KeywordPage extends StatefulWidget {
  @override
  _KeywordPageState createState() => _KeywordPageState();
}

class _KeywordPageState extends State<KeywordPage> {
  final TextEditingController _controller = TextEditingController();
  List<dynamic> _galleryItems = []; // 서버에서 받은 데이터 저장

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
                _buildButton('+ UI/UX디자인', '/UIUX'),
                // 다른 버튼들
              ],
            ),
            SizedBox(height: 20),
            if (_galleryItems.isNotEmpty) _buildGallery(), // 갤러리 데이터가 있을 경우 표시
          ],
        ),
      ),
    );
  }

  // 추천 항목을 나타내는 둥근 버튼 형태
  Widget _buildButton(String label, String route) {
    return ElevatedButton(
      onPressed: () async {
        // 키워드를 백엔드로 전송하고 응답 처리
        await _fetchGalleryData(label);
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

  // 백엔드에서 키워드에 해당하는 데이터를 가져오는 함수
  Future<void> _fetchGalleryData(String keyword) async {
    final response = await http.post(
      Uri.parse('http://192.168.187.6:8081/info/boards?keyword=${keyword}'), // 실제 URL로 변경
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        _galleryItems = data;
      });
    } else {
      // 실패 시 처리
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('갤러리 데이터를 불러오지 못했습니다')),
      );
    }
  }

  // 갤러리 형식으로 데이터 표시
  Widget _buildGallery() {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 3개의 열로 구성된 그리드
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: _galleryItems.length,
        itemBuilder: (context, index) {
          final item = _galleryItems[index];
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(item['imageUrl']), // 이미지 URL
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                item['name'], // 이름
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.black54, // 텍스트 배경
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class uiUx extends StatelessWidget {
  final List<Map<String, dynamic>> boards; // 전달받은 데이터

  const uiUx({super.key, required this.boards});

  @override
  Widget build(BuildContext context) {
    // 이미지 파일 경로 리스트 (1.png ~ 6.png)
    final imagePaths = [
      'assets/images/1.png',
      'assets/images/2.png',
      'assets/images/3.png',
      'assets/images/4.png',
      'assets/images/5.png',
      'assets/images/6.png',
    ];
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2열 그리드
            crossAxisSpacing: 16, // 열 간격
            mainAxisSpacing: 16, // 행 간격
          ),
          itemCount: boards.length,
          itemBuilder: (context, index) {
            final board = boards[index];
            final imagePath =
                imagePaths[index % imagePaths.length]; // 이미지 파일 순환

            return GestureDetector(
              onTap: () {
                // 이미지를 클릭하면 URL 출력
                final url = board['url'] ?? 'URL 없음';
                print('클릭한 URL: $url');
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 이미지 공간 (로컬 이미지 사용)
                  Container(
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  // 이름 출력
                  Text(
                    board['name'] ?? '이름 없음',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

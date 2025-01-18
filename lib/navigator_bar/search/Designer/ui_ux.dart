import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class uiUx extends StatelessWidget {
  final List<Map<String, dynamic>> boards; // 전달받은 데이터

  const uiUx({super.key, required this.boards});

  @override
  Widget build(BuildContext context) {
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
            SizedBox(width: 8),
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
            final imagePath = imagePaths[index % imagePaths.length];
            final url = board['url'] ?? '';

            return GestureDetector(
              onTap: () async {
                if (url.isNotEmpty) {
                  try {
                    final uri = Uri.parse(url); // URL을 Uri로 변환
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(
                        uri,
                        mode: LaunchMode.externalApplication, // 외부 브라우저에서 열기
                      );
                      // 브라우저에서 돌아오면 /dontwatch로 이동
                      context.push('/dontwatch');
                    } else {
                      print('URL을 열 수 없습니다: $uri');
                    }
                  } catch (e) {
                    print('URL 열기 중 오류 발생: $e');
                  }
                } else {
                  print('URL이 비어 있습니다.');
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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

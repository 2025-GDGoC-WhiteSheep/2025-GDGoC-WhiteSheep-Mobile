import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
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
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 이벤트 페이지 슬라이더
            _buildEventSlider(),
            SizedBox(height: 20),
            // 관심사 모아보기 섹션
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center, // 가운데 정렬
                children: [
                  Center(
                    // 텍스트를 가운데 정렬
                    child: Text(
                      '취업준비 처음 시작하는\n사람의 관심사를 모아모아 🔍',
                      textAlign: TextAlign.center, // 텍스트 가운데 정렬
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24, // 텍스트 크기 증가
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // 관심사 카드 리스트
                  _buildInterestCards(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 이벤트 슬라이더 위젯
  Widget _buildEventSlider() {
    return Container(
      height: 230, // 높이 증가
      child: PageView(
        children: [
          _buildSliderItem('assets/images/dance.png', '우리 함께 꿈을 찾아요'),
          _buildSliderItem('assets/images/dance.png', '우리 함께 꿈을 찾아요'),
          _buildSliderItem('assets/images/dance.png', '우리 함께 꿈을 찾아요'),
        ],
      ),
    );
  }

  // 슬라이더 항목
  Widget _buildSliderItem(String imagePath, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              height: 180, // 이미지 높이
              width: double.infinity, // 이미지 폭
            ),
          ),
          SizedBox(height: 8), // 이미지와 텍스트 간격
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // 관심사 카드 리스트
  Widget _buildInterestCards() {
    return Column(
      children: [
        _buildInterestCard(
          title: 'UIUX 디자이너의 작지만 큰 습관',
          subtitle: '하루의 만족을 만드는 습관',
          views: '3,435명이 봤어요.',
          imagePath: 'assets/images/2222.png',
        ),
        SizedBox(height: 10),
        _buildInterestCard(
          title: '피그마에서 빠질 수 없는 기능 5가지',
          subtitle: '피그마 필수기능',
          views: '2,022명이 봤어요.',
          imagePath: 'assets/images/3333.png',
        ),
      ],
    );
  }

  // 관심사 카드 위젯
  Widget _buildInterestCard({
    required String title,
    required String subtitle,
    required String views,
    required String imagePath,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  views,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              width: 80,
              height: 80,
              fit: BoxFit.cover, // 이미지가 잘리지 않고 유지되도록 설정
            ),
          ),
        ],
      ),
    );
  }
}

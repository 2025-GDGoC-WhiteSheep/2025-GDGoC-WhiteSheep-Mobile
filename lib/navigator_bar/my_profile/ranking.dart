import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';

import 'package:go_router/go_router.dart';

class RankingPage extends StatelessWidget {
  final List<String> names = [
    '리얼취준',
    '취준언제',
    '햄들어요',
    '코딩천재',
    '자바왕',
    '플러터러',
    '알고리즘러',
    '웹개발왕',
    'UX디자이너',
    '풀스택러'
  ]; // 이름 리스트

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('랭킹'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/myProfile');
          },
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            // 상단 탭바
            Container(
              color: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '일간',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  Text(
                    '주간',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    '월간',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ],
              ),
            ),
            // 날짜 선택
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.chevron_left, color: Colors.white),
                  Text(
                    '1월13일 ~ 1월19일',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Icon(Icons.chevron_right, color: Colors.white),
                ],
              ),
            ),
            // 메달 순위 섹션
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(Icons.emoji_events, size: 50, color: Colors.amber),
                      Text(
                        '리얼취준',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        '25점',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.emoji_events, size: 50, color: Colors.grey),
                      Text(
                        '취준언제',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        '18점',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.emoji_events, size: 50, color: Colors.brown),
                      Text(
                        '햄들어요',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        '15점',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // 개인 등수 섹션
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '미션 3,910명 오늘 전체 접속자 13,117명\n내 등수 3,800등 상위 99%',
                style: TextStyle(color: Colors.grey, fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
            Divider(color: Colors.grey),
            // 랭킹 리스트 타이틀
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    '랭킹',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            // 랭킹 리스트
            Expanded(
              child: ListView.builder(
                itemCount: names.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(FontAwesomeIcons.crown, color: Colors.amber),
                    title: Text(
                      names[index], // 랜덤 이름 리스트 사용
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      '${25 - index}점', // 점수 표시
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing:
                        Icon(Icons.sentiment_satisfied, color: Colors.blue),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

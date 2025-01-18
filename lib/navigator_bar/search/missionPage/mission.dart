import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MissionPage extends StatefulWidget {
  final int level;

  const MissionPage({super.key, required this.level});

  @override
  _MissionPageState createState() => _MissionPageState();
}

class _MissionPageState extends State<MissionPage> {
  late Future<Map<String, dynamic>> _missionData;
  String? _selectedOption; // 선택된 옵션 값
  String? _resultMessage; // 결과 메시지

  @override
  void initState() {
    super.initState();
    _missionData = fetchMission(widget.level);
  }

  Future<Map<String, dynamic>> fetchMission(int level) async {
    const int boardId = 1; // 고정된 boardId 값
    final url = Uri.parse(
        'http://192.168.187.6:8081/info/mission?boardId=$boardId&level=$level');

    print('API 호출: $url');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        print('API 호출 성공: ${response.body}');
        final responseBody = utf8.decode(response.bodyBytes);
        final jsonResponse = json.decode(responseBody);
        return jsonResponse; // 반환된 JSON 데이터를 Map으로 변환
      } else {
        print('서버 오류: ${response.statusCode}');
        throw Exception('서버 오류: ${response.statusCode}');
      }
    } catch (e) {
      print('API 호출 중 오류 발생: $e');
      throw Exception('API 호출 중 오류 발생: $e');
    }
  }

  void _submitAnswer(Map<String, dynamic> mission) {
    final correctAnswer = mission['answer'];
    if (_selectedOption == correctAnswer) {
      setState(() {
        _resultMessage = '정답입니다!';
      });
    } else {
      setState(() {
        _resultMessage = '오답입니다. 나중에 다시 풀어보세요!';
      });
    }

    // 결과 메시지를 보여준 후 페이지 이동
    Future.delayed(const Duration(seconds: 2), () {
      context.go('/MainScreen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('미션'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _missionData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('오류 발생: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            final mission = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 문제 이름
                  Text(
                    mission['name'] ?? '',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // 문제 이미지
                  Image.asset(
                    'assets/images/computer.png',
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 20),
                  // 문제 질문
                  Text(
                    mission['question'] ?? '',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // 선택지 목록
                  ...?mission['options']?.map<Widget>((option) {
                    return ListTile(
                      title: Text(option),
                      leading: Radio<String>(
                        value: option,
                        groupValue: _selectedOption, // 현재 선택된 값
                        onChanged: (value) {
                          setState(() {
                            _selectedOption = value; // 선택된 옵션 업데이트
                          });
                        },
                      ),
                    );
                  }).toList(),
                  const SizedBox(height: 20),
                  // 제출하기 버튼
                  Center(
                    child: ElevatedButton(
                      onPressed: _selectedOption == null
                          ? null // 선택된 옵션이 없으면 비활성화
                          : () => _submitAnswer(mission),
                      child: const Text('제출하기'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // 버튼 배경색
                        foregroundColor: Colors.white, // 텍스트 색상
                        padding: const EdgeInsets.symmetric(
                            horizontal: 150, vertical: 15), // 버튼 크기
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30), // 둥근 버튼
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // 결과 메시지
                  if (_resultMessage != null)
                    Text(
                      _resultMessage!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text('데이터가 없습니다.'),
            );
          }
        },
      ),
    );
  }
}

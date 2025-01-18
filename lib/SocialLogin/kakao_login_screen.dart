import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:http/http.dart' as http; // HTTP 요청 패키지
import 'package:shared_preferences/shared_preferences.dart';

class KakaoLoginScreen extends StatefulWidget {
  @override
  _KakaoLoginScreenState createState() => _KakaoLoginScreenState();
}

class _KakaoLoginScreenState extends State<KakaoLoginScreen> {
  Future<void> _loginWithKakao() async {
    try {
      // 카카오톡 또는 카카오 계정으로 로그인
      if (await isKakaoTalkInstalled()) {
        await UserApi.instance.loginWithKakaoTalk();
      } else {
        await UserApi.instance.loginWithKakaoAccount();
      }

      // 로그인 성공 후 사용자 정보 가져오기
      User user = await UserApi.instance.me();
      print('User ID: ${user.id}'); // 사용자 고유 ID 확인

      //프론트에 정보 저장
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('nickname', user.kakaoAccount?.profile?.nickname ?? '');
      await prefs.setString('userId', user.id.toString());
      print('유저 정보 저장 완료!');

      // 백엔드로 사용자 ID 전송
      await _sendUserIdToBackend(user.id);

      // 로그인 성공 후 /MainScreen로 이동
      GoRouter.of(context).go('/MainScreen');
    } catch (e) {
      print('로그인 실패: $e');
    }
  }

  Future<void> _sendUserIdToBackend(int userId) async {
    const backendUrl = 'http://192.168.187.6:8081'; // 백엔드 URL 설정

    try {
      final response = await http.post(
        Uri.parse(backendUrl),
        headers: {'Content-Type': 'application/json'}, // JSON 형식으로 전송
        body: jsonEncode({'userId': userId}),
      );
      if (response.statusCode == 200) {
        print('사용자 ID 전송 성공: ${response.body}');
      } else {
        print('사용자 ID 전송 실패: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('백엔드 전송 중 오류 발생: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C21), // 배경색
      appBar: AppBar(
        title: const Text('Kakao Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/3dicons-pencil-dynamic-color.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              '소셜로그인 방식으로 시작하기',
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: _loginWithKakao,
              child: Image.asset(
                'assets/images/kakao_login.png',
                width: 300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

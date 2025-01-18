import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class KakaoLoginScreen extends StatefulWidget {
  @override
  _KakaoLoginScreenState createState() => _KakaoLoginScreenState();
}

class _KakaoLoginScreenState extends State<KakaoLoginScreen> {
  Future<void> _loginWithKakao() async {
    try {
      if (await isKakaoTalkInstalled()) {
        await UserApi.instance.loginWithKakaoTalk();
      } else {
        await UserApi.instance.loginWithKakaoAccount();
      }
      // 로그인 성공 후 /keywordsPage로 이동
      GoRouter.of(context).go('/keywordsPage');
    } catch (e) {
      print('로그인 실패: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x1C1C21),
      appBar: AppBar(
        title: Text('Kakao Login'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/3dicons-pencil-dynamic-color.png',
            width: 100,
            height: 100,
          ),
          const SizedBox(height: 20),
          // const Text(),
        ],
      )),
    );
  }
}

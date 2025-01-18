import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:gdgoc2025whitesheepmobile/router/router.dart';

void main() {
  KakaoSdk.init(nativeAppKey: 'fd1129b7302f5f0877e04483bd504f3f');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Kakao social login',
      routerConfig: router,
    );
  }
}

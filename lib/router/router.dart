import 'package:gdgoc2025whitesheepmobile/navigator_bar/navigator.dart';
import 'package:go_router/go_router.dart';
import 'package:gdgoc2025whitesheepmobile/SocialLogin/kakao_login_screen.dart';

import '../navigator_bar/my_profile/my_profile.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: '/', // 카카오 로그인 화면
    builder: (context, state) => KakaoLoginScreen(),
    // builder: (context, state) => KakaoLoginScreen(),
  ),
  GoRoute(
    path: '/MainScreen',
    builder: (context, state) => MainScreen(),
  ),
  GoRoute(
    path: '/myProfile',
    builder: (context, state) => MyProfileScreen(),
  )
]);

import 'package:flutter/material.dart';
import 'package:gdgoc2025whitesheepmobile/SocialLogin/splash.dart';
import 'package:gdgoc2025whitesheepmobile/navigator_bar/dontwatch.dart';
import 'package:gdgoc2025whitesheepmobile/navigator_bar/my_profile/ranking.dart';
import 'package:gdgoc2025whitesheepmobile/navigator_bar/navigator.dart';
import 'package:gdgoc2025whitesheepmobile/navigator_bar/search/Designer/graphic.dart';
import 'package:gdgoc2025whitesheepmobile/navigator_bar/search/Designer/inHouse.dart';
import 'package:gdgoc2025whitesheepmobile/navigator_bar/search/Designer/ui_ux.dart';
import 'package:gdgoc2025whitesheepmobile/navigator_bar/search/PM/appMake.dart';
import 'package:gdgoc2025whitesheepmobile/navigator_bar/search/PM/pm.dart';
import 'package:gdgoc2025whitesheepmobile/navigator_bar/search/PM/webMake.dart';
import 'package:gdgoc2025whitesheepmobile/navigator_bar/search/Programmer/backend.dart';
import 'package:gdgoc2025whitesheepmobile/navigator_bar/search/Programmer/front.dart';
import 'package:gdgoc2025whitesheepmobile/navigator_bar/search/Programmer/fullStack.dart';
import 'package:gdgoc2025whitesheepmobile/navigator_bar/search/missionPage/mission.dart';
import 'package:gdgoc2025whitesheepmobile/navigator_bar/search/search.dart';
import 'package:gdgoc2025whitesheepmobile/navigator_bar/search/selectmission.dart';
import 'package:go_router/go_router.dart';
import 'package:gdgoc2025whitesheepmobile/SocialLogin/kakao_login_screen.dart';

import '../navigator_bar/my_profile/my_profile.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => SplashScreen(),
  ),
  GoRoute(
    path: '/login', // 카카오 로그인 화면
    builder: (context, state) => KakaoLoginScreen(),
  ),
  GoRoute(
    path: '/keywordsPage',
    builder: (context, state) => KeywordPage(),
  ),
  GoRoute(
    path: '/MainScreen',
    builder: (context, state) => MainScreen(),
  ),
  // 탐색 화면에서의 요소들 이동 경로
  // 기획자 3개 요소
  GoRoute(
    path: '/PM',
    builder: (context, state) => pmPage(),
  ),
  GoRoute(
    path: '/APP',
    builder: (context, state) => appMake(),
  ),
  GoRoute(
    path: '/WEB',
    builder: (context, state) => webMake(),
  ),
  // 개발자 3개 요소
  GoRoute(
    path: '/FRONT',
    builder: (context, state) => frontEnd(),
  ),
  GoRoute(
    path: '/BACK',
    builder: (context, state) => backEnd(),
  ),
  GoRoute(
    path: '/FULL',
    builder: (context, state) => fullStack(),
  ),
  // 디자이너 3개 요소
  GoRoute(
    path: '/UIUX',
    builder: (context, state) {
      final boards = state.extra as List<Map<String, dynamic>>?; // 전달받은 데이터

      if (boards == null) {
        // 데이터가 없는 경우 에러 메시지 표시
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF1C1C21),
            title: Text('K-word', style: TextStyle(color: Colors.white)),
          ),
          body: Center(
            child: Text(
              '데이터를 불러올 수 없습니다.',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      }

      return uiUx(boards: boards); // 데이터를 uiUx로 전달
    },
  ),

  GoRoute(
    path: '/GRAPHIC',
    builder: (context, state) => graphic(),
  ),
  GoRoute(
    path: '/INHOUSE',
    builder: (context, state) => inHouse(),
  ),
  GoRoute(
    path: '/MainScreen',
    builder: (context, state) => MainScreen(),
  ),
  GoRoute(
    path: '/myProfile',
    builder: (context, state) => MyProfileScreen(),
  ),
  GoRoute(
    path: '/dontwatch',
    builder: (context, state) => donewatch(),
  ),
  GoRoute(
    path: '/select',
    builder: (context, state) => const SelectMissionPage(),
  ),
  GoRoute(
    path: '/mission',
    builder: (context, state) {
      final level = state.extra as int; // 전달된 level 값 가져오기
      return MissionPage(level: level);
    },
  ),
  GoRoute(
    path: '/ranking',
    builder: (context, state) => RankingPage(),
  ),
]);

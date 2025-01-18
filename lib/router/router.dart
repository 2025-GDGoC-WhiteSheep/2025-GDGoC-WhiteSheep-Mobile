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
import 'package:gdgoc2025whitesheepmobile/navigator_bar/search/search.dart';
import 'package:go_router/go_router.dart';
import 'package:gdgoc2025whitesheepmobile/SocialLogin/kakao_login_screen.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: '/', // 카카오 로그인 화면
    builder: (context, state) => KakaoLoginScreen(),
    // builder: (context, state) => KakaoLoginScreen(),
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
    builder: (context, state) => const pmPage(),
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
    builder: (context, state) => uiUx(),
  ),
  GoRoute(
    path: '/GRAPHIC',
    builder: (context, state) => graphic(),
  ),
  GoRoute(
    path: '/INHOUSE',
    builder: (context, state) => inHouse(),
  ),
]);

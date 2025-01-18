import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SelectMissionPage extends StatelessWidget {
  const SelectMissionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('단계별 미션 수행하기'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop(); // 뒤로 가기
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/climb.png',
              width: 350,
              height: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              '탐색단계가 끝났으면 다음은 학습단계입니다.\n영상을 보기만 하면 학습효과가 떨어진다고 합니다.\n미션을 통해 배운 내용을 학습해보세요!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => context.push('/mission', extra: 1), // 난이도 1단계
              child: const Text('난이도 1단계'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => context.push('/mission', extra: 2), // 난이도 2단계
              child: const Text('난이도 2단계'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => context.push('/mission', extra: 3), // 난이도 3단계
              child: const Text('난이도 3단계'),
            ),
          ],
        ),
      ),
    );
  }
}

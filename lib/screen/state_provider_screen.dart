import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/riverpod/state_provider_screen.dart';

import '../layout/default_layout.dart';

// ConsumerWidget을 사용하면 riverpod을 사용할 수 있음
// 기존 StatelessWidget과 build에서 WidgetRef가 추가되는 것을 제외하고는 다른 점이 없음
class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(numberProvider); // ref.watch : 특정 provider를 바라보고 있다가 변경이 되면 build를 다시 실행
    // read: 무언가를 눌렀을 때 실행되는 경우
    // watch: build함수 안에서 직접적으로 UI에 반영하기 위해 가져오는 경우

    return DefaultLayout(
        title: 'StateProviderScreen',
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                provider.toString(),
              ),
              ElevatedButton(
                  onPressed: () {
                    // state: 지금 현재 상태
                    // 현재 0
                    ref.read(numberProvider.notifier).update((state) => state + 1); // 버튼을 눌렀을 때 실행되는 경우 read
                  },
                  child: Text(
                    'up'
                  )
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (_) => _NextScreen())
                    );
                  },
                  child: Text(
                      'next screen'
                  )
              )
            ],
          ),
        )
    );
  }
}

// 같은 provider를 watch하고 있으면 데이터를 공유할 수 있음
class _NextScreen extends ConsumerWidget {
  const _NextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(numberProvider); // ref.watch : 특정 provider를 바라보고 있다가 변경이 되면 build를 다시 실행

    return DefaultLayout(
        title: 'StateProviderScreen',
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                provider.toString(),
              ),
              ElevatedButton(
                  onPressed: () {
                    // state: 지금 현재 상태
                    // 현재 0
                    ref.read(numberProvider.notifier).update((state) => state + 1); // 버튼을 눌렀을 때 실행되는 경우 read
                  },
                  child: Text(
                      'up'
                  )
              )
            ],
          ),
        )
    );
  }
}


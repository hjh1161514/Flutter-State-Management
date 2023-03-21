import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/layout/default_layout.dart';
import 'package:flutter_state_management/riverpod/future_provider.dart';

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(multiplesFutureProvider); // state는 AsyncValue 상태로 들어옴. when이 꼭 필요함

    return DefaultLayout(
        title: 'FutureProviderScreen',
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 비동기 처리
            state.when(
                data: (data) { // loading이 끝나서 data가 있을 때 실행
                  return Text(
                    data.toString(),
                    textAlign: TextAlign.center,
                  );
                },
                error: (err, stack) => Text( // 에러 발생 시
                  err.toString(),
                ),
                loading: () => Center(child: CircularProgressIndicator()), // loading이 되고 있을 떄 실행되는 함수
            )
          ],
        )
    );
  }
}

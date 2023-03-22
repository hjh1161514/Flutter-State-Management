import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/layout/default_layout.dart';
import 'package:flutter_state_management/riverpod/code_generation_provider.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state1 = ref.watch(gStateProvider);
    final state2 = ref.watch(gStateFutureProvider);
    final state3 = ref.watch(gStateFuture2Provider);
    final state4 = ref.watch(gStateMultiplyProvider(
      number1: 10,
      number2: 20,
    ));

    return DefaultLayout(
        title: 'CodeGenerationScreen',
        body: Column(
          children: [
            Text('State1 : $state1'),
            state2.when(
              data: (data) { // loading이 끝나서 data가 있을 때 실행
                return Text(
                  'State2 : $data',
                  textAlign: TextAlign.center,
                );
              },
              error: (err, stack) => Text( // 에러 발생 시
                err.toString(),
              ),
              loading: () => Center(child: CircularProgressIndicator()), // loading이 되고 있을 떄 실행되는 함수
            ),
            state3.when(
              data: (data) { // loading이 끝나서 data가 있을 때 실행
                return Text(
                  'State3 : $data',
                  textAlign: TextAlign.center,
                );
              },
              error: (err, stack) => Text( // 에러 발생 시
                err.toString(),
              ),
              loading: () => Center(child: CircularProgressIndicator()), // loading이 되고 있을 떄 실행되는 함수
            ),
            Text('State4 $state4'),
          ],
        )
    );
  }
}

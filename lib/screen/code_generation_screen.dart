import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/layout/default_layout.dart';
import 'package:flutter_state_management/riverpod/code_generation_provider.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build');

    final state1 = ref.watch(gStateProvider);
    final state2 = ref.watch(gStateFutureProvider);
    final state3 = ref.watch(gStateFuture2Provider);
    final state4 = ref.watch(gStateMultiplyProvider(
      number1: 10,
      number2: 20,
    ));
    // final state5 = ref.watch(gStateNotifierProvider);

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
            // Text('State5 $state5'),
            // _StateFiveWidget(),
            Consumer( // 부분적 렌더링 가능
                builder: (context, ref, child) {
                  final state5 = ref.watch(gStateNotifierProvider);
                  return Row(
                    children: [
                      Text('State5 $state5'),
                      child!, // child에 들어가는 건 다시 build를 하지 않음
                    ],
                  );
                },
                child: Text('hello'), // consumer 위젯의 child 파라미터에 제공됨
            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: (){
                      ref.read(gStateNotifierProvider.notifier).increment();
                    },
                    child: Text('Increment')
                ),
                ElevatedButton(
                    onPressed: (){
                      ref.read(gStateNotifierProvider.notifier).decrement();
                    },
                    child: Text('Decrement')
                ),
              ],
            ),
            /// invalidate()
            /// 유효하지 않게 함 = state를 유효하지 않게 해서 초기의 상태로 되돌림
            // 누르면 초기값으로 돌아감
            ElevatedButton(
                onPressed: (){
                  ref.invalidate(gStateNotifierProvider);
                },
                child: Text('Invalidate')
            ),
          ],
        )
    );
  }
}

// increment, decrement를 진행하면 전체 state가 다시 build
// statew5만 다시 build하고 싶기 떄문에 새로운 widget으로 분리해야 함
/// 이것 또한 번거로움 => Consumer 위젯 제공
class _StateFiveWidget extends ConsumerWidget {
  const _StateFiveWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state5 = ref.watch(gStateNotifierProvider);
    return Text('State5 $state5');
  }
}


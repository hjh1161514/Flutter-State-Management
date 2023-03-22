import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/layout/default_layout.dart';
import 'package:flutter_state_management/riverpod/select_provider.dart';

class SelectProviderScreen extends ConsumerWidget {
  const SelectProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build');
    // final state = ref.watch(selectProvider);
    // 위의 코드를 사용하면 항상 build가 되는데 특정 값이 변경되었을 때만 build를 하고 싶다면 select 사용

    // hasBought의 값이 바뀌지만 화면에는 나타나지 않음
    final state = ref.watch(selectProvider.select((value) => value.isSpicy)); // watch는 build를 재실행
    // listen에도 적용 가능
    ref.listen(selectProvider.select((value) => value.hasBought),
            (previous, next) {
              print('next: $next');
            },
    );

    return DefaultLayout(
        title: 'SelectProviderScreen',
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(state.toString()),
              // Text(
              //   state.name,
              // ),
              // Text(
              //   state.isSpicy.toString(),
              // ),
              // Text(
              //   state.hasBought.toString(),
              // ),
              ElevatedButton(
                  onPressed: (){
                    ref.read(selectProvider.notifier).toggleIsSpice();
                  },
                  child: Text('Spicy Toggle')
              ),
              ElevatedButton(
                  onPressed: (){
                    ref.read(selectProvider.notifier).toggleHasBought();
                  },
                  child: Text('HasBought Toggle')
              ),
            ],
          ),
        )
    );
  }
}

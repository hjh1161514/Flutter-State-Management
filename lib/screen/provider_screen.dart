import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/layout/default_layout.dart';
import 'package:flutter_state_management/riverpod/provder.dart';

import '../riverpod/state_notifier_provider.dart';

class ProviderScreen extends ConsumerWidget {
  const ProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // filteredShoppingListProvider는 provider인데 안에서 shoppingListProvider를 또 watch
    final state = ref.watch(filteredShoppingListProvider); // 위의 기능을 하는 provider를 watch

    print(state);

    return DefaultLayout(
        title: 'ProviderScreen',
        actions: [
          PopupMenuButton<FilterState>(
            // itemBuilder: list로 넣고 싶은 아이템을 추가
              itemBuilder: (_) => FilterState.values.map(
                (e) => PopupMenuItem( // popup 메뉴 버튼을 눌렀을 떄 나오는 각각의 아이템
                  value: e,
                  child:
                    Text(
                      e.name
                    ),
                ),
              ).toList(),
              onSelected: (value) {
                print(value);
                ref.read(filterProvider.notifier).update((state) => value); // 선택한 값으로 상태 변경
              },
          ),
        ],
        body: ListView(
          children:  state
              .map(
                (e) => CheckboxListTile(
              title: Text(e.name),
              value: e.hasBought, // 오른쪽 체크박스 체크 여부
                  /// watch를 하는 건 filteredShoppingListProvider인데 shoppingListProvider를 변경해도 값이 바뀜
                  /// 그 이유? 'provder.dart'에서 ref.watch를 하면 widget 안에서 watch하는 것처럼 provider 안에서 watch 실행
              onChanged: (value){
                // 함수에서 provider를 가져옴
                // toggleHasBouht를 사용할 수 있는 이유? -> .notifier를 사용하면 class가 그대로 오기 떄문
                ref.read(shoppingListProvider.notifier).toggleHasBought(
                  name: e.name,
                );
              },
            ),
          )
              .toList(),
        )
    );
  }
}

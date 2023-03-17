import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/layout/default_layout.dart';
import 'package:flutter_state_management/model/shopping_item_model.dart';
import 'package:flutter_state_management/riverpod/state_notifier_provider.dart';

class StateNotifierProviderScreen extends ConsumerWidget {
  const StateNotifierProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<ShoppingItemModel> state = ref.watch(shoppingListProvider); // watch를 사용하면 state가 그대로 주입. 

    return DefaultLayout(
        title: 'StateNotifierProvider',
        body: ListView(
          children: state
              .map(
                  (e) => CheckboxListTile(
                      title: Text(e.name),
                      value: e.hasBought, // 오른쪽 체크박스 체크 여부
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
        ),
    );
  }
}

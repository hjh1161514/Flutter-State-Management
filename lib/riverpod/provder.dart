import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/model/shopping_item_model.dart';
import 'package:flutter_state_management/riverpod/state_notifier_provider.dart';

/*
// filteredShoppingListProvider는 provider인데 안에서 shoppingListProvider를 또 watch
final filteredShoppingListProvider = Provider(
        (ref) => ref.watch(shoppingListProvider), // shoppingListProvider에 있는 상태가 Provider로 전달됨
        // 1. 반환되는 값은 shoppingListProvider의 state
        // 2. => (arrow function)을 사용했기 때문에 반환되는 값을 Provider에 또 반환
        // 3. 이 반환되는 값이 변경이 되면 build가 다시 실행
);
 */
final filteredShoppingListProvider = Provider<List<ShoppingItemModel>>(
      (ref) {
        final filterState = ref.watch(filterProvider); // action 버튼을 누를 떄마다 변경 가능 // watch를 해서 filterProvider가 변경될 때마다 재실행
        final shoppingListState = ref.watch(shoppingListProvider);

        if (filterState == FilterState.all) {
          return shoppingListState;
        }

        return shoppingListState.where((element) =>
        filterState == FilterState.spicy ? element.isSpicy : !element.isSpicy).toList();
      }
);

// 필터링 상태 지정
enum FilterState{
  notSpicy,
  spicy,
  all
}

// 선택하는 필터에 따라서 내용을 보내줌
final filterProvider = StateProvider<FilterState>((ref) => FilterState.all);
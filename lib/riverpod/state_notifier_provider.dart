import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/model/shopping_item_model.dart';

// provider로 만들기. 위젯에서 사용하기 위해
final shoppingListProvider = StateNotifierProvider<ShoppingListNotifier, List<ShoppingItemModel>>( // <어떤 StateNotifier를 상속한 class 타입, 클래스가 관리하는 상태 타입>
        (ref) => ShoppingListNotifier() // 관리할 class를 instance로
);

// StateNotifier에 상태 관리할 타입을 무조건 지정해 주어야 함
class ShoppingListNotifier extends StateNotifier<List<ShoppingItemModel>>{
  // 생성자 필수
  // 상속받은 StateNotifier의 <> 값이 들어감
  ShoppingListNotifier():
      super ([
        ShoppingItemModel(
            name: '김치',
            quantity: 3,
            hasBought: false,
            isSpicy: true,
        ),
        ShoppingItemModel(
          name: '라면',
          quantity: 5,
          hasBought: false,
          isSpicy: true,
        ),
        ShoppingItemModel(
          name: '삼겹살',
          quantity: 10,
          hasBought: false,
          isSpicy: false,
        ),
        ShoppingItemModel(
          name: '수박',
          quantity: 6,
          hasBought: false,
          isSpicy: false,
        ),
      ],
      ); //처음에 어떤 값으로 초기화할 지

  // 상태 변경 함수
  void toggleHasBought({required String name}) {
    // 현재 값을 불러오기 위해서는 state 값을 사용
    // 여기서 state는 super에 정의되어 있는 list
    state = state.map((e) => // map은 새로운 값을 반환
    // 아이템의 이름이 input 받은 이름과 같으면 toggle
    e.name == name ? ShoppingItemModel(
        name: e.name,
        quantity: e.quantity,
        hasBought: !e.hasBought,
        isSpicy: e.isSpicy,
    ) : e ) // 아닐 경우에는 똑같은 e 값을 사용
        .toList();
  }

}
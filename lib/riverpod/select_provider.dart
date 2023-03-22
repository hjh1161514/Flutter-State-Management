// state notifier provider
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/model/shopping_item_model.dart';

// class 작성 후 마지막에 provider 만들기
final selectProvider = StateNotifierProvider<SelectNotifier, ShoppingItemModel> ((ref) => SelectNotifier());

class SelectNotifier extends StateNotifier<ShoppingItemModel> {
  SelectNotifier():
      super(
        ShoppingItemModel(
            name: '김치',
            quantity: 3,
            hasBought: false,
            isSpicy: true
        ),
      );

  toggleHasBought() {
    // state = ShoppingItemModel(
    //     name: state.name,
    //     quantity: state.quantity,
    //     hasBought: !state.hasBought,
    //     isSpicy: state.isSpicy,
    // );
    /// toggleHasBought, toggleIsSpice는 공통되는 코드가 많아서 ShoppingItemModel에 copyWith를 생성해 사용
    state = state.copyWith(
      hasBought: !state.hasBought,
    );
  }

  toggleIsSpice() {
    state = state.copyWith(
      isSpicy: !state.isSpicy,
    );
  }
}
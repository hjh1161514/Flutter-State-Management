import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/layout/default_layout.dart';
import 'package:flutter_state_management/riverpod/family_modifier_provider.dart';

class FamilyModifierScreen extends ConsumerWidget {
  const FamilyModifierScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(familyModifierProvier(3)); // familyModifierProvider에 ()를 추가해 data(FamilyModifierProvider에)를 받아야 함

    return DefaultLayout(
        title: 'FamilyModifierScreen',
        body: Center(
          child: state.when( // future는 when 사용
              data: (data) => Text(data.toString()),
              error: (err, stack) => Text(err.toString()),
              loading: () => CircularProgressIndicator()
          )
        )
    );
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';

// 명시적으로 하기 위해 class 사용
class Parameter{
  final String name;
  final String company;

  Parameter({
    required this.name,
    required this.company,
  });
}

// modifier는 어느 provider든 상관 없음
/// familyModifierProvier : provider를 생성할 떄 생성하는 순간에 어떤 변수를 입력해서
/// 변수로 안의 로직을 변경해야 할 때 사용

// modifier는 provider에 .하고 무언가를 추가할 수 있음
final familyModifierProvier = FutureProvider.family <List<int>, int>((ref, data) async {
  await Future.delayed(Duration(seconds: 2));

  return List.generate(5, (index) => index * data);
});
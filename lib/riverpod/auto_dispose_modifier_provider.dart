import 'package:flutter_riverpod/flutter_riverpod.dart';

// autoDispose : 새로운 값을 받지 않고 알아서 자동으로 삭제함
/// 데이터가 캐싱되는 (= 데이터를 기억) FutureProvider와 달리 authDispose를 사용하면 매번 새로 값이 생성
/// => 자동으로 케시를 삭제 = 사용하지 않을 떄는 데이터가 삭제되어야 하는 provider가 필요할 떄 사용
final authDisposeModifierProvider = FutureProvider.autoDispose<List<int>>((ref) async {
  await Future.delayed(Duration(seconds: 2));

  return [1, 2, 3, 4, 5];
});
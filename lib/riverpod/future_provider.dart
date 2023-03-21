import 'package:flutter_riverpod/flutter_riverpod.dart';

// FutureProvider는 FutureBuilder처럼 뒤로 갔다가 다시 왔을 떄 캐싱.
// 다시 로딩이 되지 않고 기억하고 있음
final multiplesFutureProvider = FutureProvider<List<int>>((ref) async {
  await Future.delayed(
      Duration(
          seconds: 2
      ),
  );

  return [1,2,3,4,5,6];
});
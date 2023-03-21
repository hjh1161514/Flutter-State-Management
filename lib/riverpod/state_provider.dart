import 'package:flutter_riverpod/flutter_riverpod.dart';

// StateProvider 안에 반환해 주고 싶은 값을 작성
// 제너릭에는 어떤 타입의 값을 관리하게 될 지 넣어줌
final numberProvider = StateProvider<int>((ref) => 0);
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'code_generation_provider.g.dart';

/// code generation을 사용하는 이유
// 1) 어떤 Provider를 사용할 지 결정할 고민이 필요 없도록
// Provider, FutrueProvider, StreamProvider 등 어떤 걸 쓸 지 고민할 필요 없이 자동으로 결정해 줌
// StateNotifierProvider 명시 필요
// 'flutter pub run build_runner build' 명령어 필요

final _testProvider = Provider<String>((ref) => 'Hello Code Generation');

// gState는 함수의 정의를 위해 작성, watch를 해야 할 것은 g파일에 있음
// _textProvider와 같지만, 함수 형태라서 더 직관적
@riverpod
String gState(GStateRef ref) {
  return 'Hello Colde Generation';
}


// 2) Parameter > Family 파라미터를 일반 함수처럼 사용할 수 있도록
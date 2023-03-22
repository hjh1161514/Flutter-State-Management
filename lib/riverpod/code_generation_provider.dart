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

/// 일반적으로 riverpod 어노테이션을 사용하면 AutoDispose(캐시 저장x)로 만들어 짐
@riverpod
Future<int> gStateFuture(GStateFutureRef ref) async {
  await Future.delayed(Duration(seconds: 3));

  return 10;
}

// AutoDispose를 사용하고 싶지 않다면
@Riverpod(
  // 값을 살려두어라
  /// AutoDispose가 아닌 provider가 사용됨
  keepAlive: true, // 기본값 false
)
Future<int> gStateFuture2(GStateFuture2Ref ref) async {
  await Future.delayed(Duration(seconds: 3));

  return 10;
}


// 2) Parameter > Family 파라미터를 일반 함수처럼 사용할 수 있도록
class Parameter{
  final int number1;
  final int number2;

  Parameter({
    required this.number1,
    required this.number2,
  });
}


final _testFamilyProvider = Provider.family<int, Parameter>(
   (ref, parameter) => parameter.number1 * parameter.number2,
);

// number1과 number2를 provider에 전달하고자 한 것인데
// 기존 방식 (위)는 코드가 많아짐
// 이를 해결하기 위해 generation에서 아래처럼 사용 -> 매우 간편해짐
@riverpod
int gStateMultiply(GStateMultiplyRef ref, {
  // class를 선언할 필요 없음
  required int number1,
  required int number2,
}) {
  return number1 * number2;
}

// StateNotifierProvider
@riverpod
class GStateNotifier extends _$GStateNotifier{
  // 차이점) build 함수 내에서 초기값을 지정
  @override
  int build() {
    return 0;
  }

  increment() {
    state ++;
  }

  decrement() {
    state --;
  }
}
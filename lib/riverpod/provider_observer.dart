import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logger extends ProviderObserver {
  // provider를 update 했을 때 사용
  @override
  void didUpdateProvider(ProviderBase<Object?> provider, Object? previousValue,
      Object? newValue, ProviderContainer container) { // container는 flutter에서 고려하지 않아도 됨
    print('[Provider Update] provider: $provider / pv : $previousValue / nv: $newValue');
  }

  // provider를 추가하면 사용
  @override
  void didAddProvider(ProviderBase<Object?> provider, Object? value, ProviderContainer container) {
    print('[Provider Added] provider: $provider / value : $value');
  }

  @override
  void didDisposeProvider(ProviderBase<Object?> provider, ProviderContainer container) {
    print('[Provider Dispose] provider: $provider');
  }
}
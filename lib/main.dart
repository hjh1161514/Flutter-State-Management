import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/riverpod/provider_observer.dart';
import 'package:flutter_state_management/screen/home_screen.dart';

void main() {
  runApp(
      ProviderScope(
        // observers는 주로 logging을 확인하는 데 사용
        observers: [
          Logger(), // 하위에 있는 모든 provider들이 update가 되었을 떄 무조건 호출
        ],
          child: MaterialApp(
          home: HomeScreen(),
      ))
  );
}

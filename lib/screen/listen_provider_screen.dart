import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/layout/default_layout.dart';
import 'package:flutter_state_management/riverpod/listen_provider.dart';

class ListenProviderScreen extends ConsumerStatefulWidget {
  const ListenProviderScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ListenProviderScreen> createState() => _ListenProviderScreenState();
}

class _ListenProviderScreenState extends ConsumerState<ListenProviderScreen> with TickerProviderStateMixin{
  late final TabController controller;

  @override
  void initState() {
    super.initState();
    
    controller = TabController(
        length: 10,
        vsync: this,
        // initState는 단발적 실행이기 때문에 watch 사용 불가.
        initialIndex: ref.read(listenProvider), // 기존 listenProvider에 있는 값을 초기 값으로 하기 때문에 provider가 삭제될 때까지 화면을 변경해도 수가 유지
    );
  }
  
  @override
  Widget build(BuildContext context) {
    // listen: provider가 변경될 때마다 아래 함수 실행
    // listene: dispose를 할 필요가 없음. 절대로 중복으로 listen이 되지 않도록 설계되어 있음
    ref.listen<int>(listenProvider, (previous, next) { // <int>를 통해 previous와 next의 타입 지정 가능
      print(previous);
      print(next);

      if(previous != next) {
        // 변경된 값에 의해서 controller가 실행됨
        controller.animateTo( // listenProvider 안에 숫자가 변경
          next,
        );
      }

    }); // previous: 기존 상태, next: 변경될 다음 상태

    return DefaultLayout(
        title: 'ListenProviderScreen',
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(), // 스크롤로 움직일 수 없도록
          controller: controller,
          children: List.generate(10, (index) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(index.toString()),
              ElevatedButton(
                  onPressed: (){
                    ref.read(listenProvider.notifier)
                        .update((state) => state == 10 ? 10 : state + 1); // 마지막 페이지가 아니면 페이지가 1씩 올라감
                  },
                  child: Text(
                    '다음'
                  ),
              ),
              ElevatedButton(
                onPressed: (){
                  ref.read(listenProvider.notifier)
                      .update((state) => state == 0 ? 0 : state - 1);
                },
                child: Text(
                    '뒤로'
                ),
              ),
            ],
          )),
        )
    );
  }
}

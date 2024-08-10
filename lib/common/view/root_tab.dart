import 'package:flutter/material.dart';
import 'package:flutter_delivery_app/common/const/colors.dart';
import 'package:flutter_delivery_app/common/layout/default_layout.dart';
import 'package:flutter_delivery_app/restaurant/view/restaurant_screen.dart';

class RootTab extends StatefulWidget {
  const RootTab({super.key});

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> with SingleTickerProviderStateMixin {
  late TabController controller; //late 를 이용해서 나중에 선언

  int index = 0;

  @override
  void initState() {
    super.initState();
    // length에는 컨트롤할 화면의 개수 vsync(랜더링 엔진 )에는 현재 컨트롤러를 사용하는 state를 넣어줌 (이때 넣어주는 this가 기능을 가지고 있어야해서
    // 기본적으로 this를 넣을 떄는 SingleTickerProviderStateMixin이라는 것을 같이 넣어줌 ) -> 애니메이션과 관련된 컨트롤러는 이런 세팅이 꽤나 있음
    controller = TabController(length: 4, vsync: this);
    //컨트롤러가 바뀔 때마다 tab 리스너를 실행할 수 있도록 함
    controller.addListener(tabListener);
  }

  void tabListener() {
    setState(() {
      index = controller.index;
    });
  }

  @override
  void dispose() {
    controller.removeListener(tabListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: "코팩 딜리버리",
      backgroundColor: PRIMARY_COLOR,
      bottomNavigationBar: BottomNavigationBar(
        // 선택된 색상
        selectedItemColor: PRIMARY_COLOR,
        // 선택 안 된 색상
        unselectedItemColor: BODY_TEXT_COLOR,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        // 기본이 shifting : 선택된 탭이 조금 더 크게 표현 되는 것
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          // 움직이고 싶은 인덱스로 이동하게 할 수 있는 코드
          controller.animateTo(index);
        },
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood_outlined),
            label: '음식',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined),
            label: '주문',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: '프로필',
          ),
        ],
      ),
      child: TabBarView(
        // 화면만 만들었을 때 움직이지 않을 수 있도록 하는 것
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          const RestaurantScreen(),
          Center(child: Container(child: const Text('음식'))),
          Center(child: Container(child: const Text('주문'))),
          Center(child: Container(child: const Text('프로필'))),
        ],
      ),
    );
  }
}

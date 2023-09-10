import 'package:flutter/material.dart';
import '../page1/page1.dart';
import '../page2/page2.dart';
import '../page3/page3.dart';
import '../missionPage/missionPage.dart';
import '../signup_page/signup_user_type_select_page.dart';
import '../login_page/login_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
          child: Row(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MissionPage()));
            },
            child: const Text('미션페이지'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignUpPage(), // 회원가입 페이지로 이동
                ),
              );
            },
            child: const Text('회원가입'), // 회원가입 버튼 추가
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(), // 회원가입 페이지로 이동
                ),
              );
            },
            child: const Text('로그인'), // 로그인 페이지 이동 버튼 추가
          ),
        ],
      )),
      bottomNavigationBar: BottomAppBar(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Page1()));
            },
            child: const Text('Page1!!'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Page2()));
            },
            child: const Text('Page2!!'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Page3()));
            },
            child: const Text('Page3!!'),
          )
        ],
      )),
    );
  }
}

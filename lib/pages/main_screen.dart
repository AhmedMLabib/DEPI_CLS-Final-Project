import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharek/pages/add_page.dart';
import 'package:sharek/pages/home_chat_page.dart';

import 'package:sharek/pages/home_page.dart';
import 'package:sharek/pages/profile_page.dart';
import 'package:sharek/pages/requests_page.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final RxInt _currentIndex = 4.obs;

  final pages = [
    ProfilePage(),
    RequestsPage(),
    AddPage(),
    HomeChatPage(),
    HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[_currentIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex.value,
          selectedItemColor: Color.fromARGB(255, 157, 192, 138),
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            _currentIndex.value = index;
          },
          items: const [

            BottomNavigationBarItem(icon: Icon(Icons.mail), label: "طلبات"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "الحساب"),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline),
              label: "اضافة",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: "دردشة"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "الرئيسية"),
          ],
        ),
      ),
    );
  }
}

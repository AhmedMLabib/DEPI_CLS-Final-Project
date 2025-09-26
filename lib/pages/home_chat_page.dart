import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharek/Colors/Colors.dart';

import 'chat_page.dart';
import 'notifications_page.dart';

class HomeChatPage extends StatelessWidget {
  HomeChatPage({super.key});
  // this data is just testing the ui
  final persons = [
    "Ahmed",
    "Ali",
    "Mahmoud",
    "Omar",
    "Hassan",
    "Mostafa",
    "Khaled",
    "Ibrahim",
    "Tarek",
    "Youssef",
    "Hany",
    "Adel",
    "Amr",
    "Wael",
    "Sherif",
    "Mohamed",
    "Karim",
    "Nour",
    "Samir",
    "Saif",
    "Ayman",
    "Ehab",
    "Fady",
    "Magdy",
    "Hossam",
    "Ashraf",
    "Mina",
    "Yasser",
    "Sami",
    "Ramy",
    "Walid",
    "Bassel",
    "Fares",
    "Gamal",
    "Lotfy",
    "Mamdouh",
    "Essam",
    "Shady",
    "Rashed",
    "Tamer",
    "Hesham",
    "Osama",
    "Karem",
    "Nader",
    "Ziad",
    "Hazem",
    "Sherbiny",
    "Hamdy",
    "Alaa",
    "Bahaa",
    "Khalifa",
    "Galal",
    "Mostafa K",
    "Othman",
    "Rafik",
    "Malek",
    "Bassem",
    "Hany M",
    "Maher",
    "Nashaat",
    "Yehia",
    "Moataz",
    "Islam",
    "Reda",
    "Fouad",
    "Atef",
    "Lotfi",
    "Sameh",
    "Ashour",
    "Sayed",
    "Nabil",
    "Arafat",
    "Sabry",
    "Ihab",
    "Akram",
    "Montaser",
    "Salah",
    "Anwar",
    "Hamza",
    "Mourad",
    "Shehab",
    "Raafat",
    "Fathy",
    "Shahin",
    "Adham",
    "Maged",
    "Ammar",
    "Hady",
    "Emad",
    "Safwat",
    "Belal",
    "Amer",
    "Hussein",
    "Farouk",
    "Younes",
    "Rizk",
    "Gad",
    "Zakaria",
    "Sobhy",
    "Refaat",
    "Nagib",
  ];
  final messages = [
    "Hey, how are you?",
    "I'm fine, what about you?",
    "Did you finish the project?",
    "Let's meet tomorrow.",
    "Call me when you’re free.",
    "Don't forget the meeting at 5.",
    "I’ll send you the files tonight.",
    "Where are you now?",
    "Good morning!",
    "See you soon.",
    "Thanks a lot!",
    "That sounds great.",
    "Can you explain again?",
    "I’ll be late today.",
    "Happy Birthday!",
    "Good night 🌙",
    "Congratulations 🎉",
    "Long time no see!",
    "What do you think?",
    "Check your email please.",
  ];
  final times = [
    "09:15 AM",
    "09:45 AM",
    "10:10 AM",
    "10:30 AM",
    "11:00 AM",
    "11:25 AM",
    "12:00 PM",
    "12:15 PM",
    "01:00 PM",
    "01:30 PM",
    "02:00 PM",
    "02:20 PM",
    "03:00 PM",
    "03:40 PM",
    "04:10 PM",
    "05:00 PM",
    "06:15 PM",
    "07:00 PM",
    "08:20 PM",
    "09:00 PM",
  ];
  final random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.notifications_none_outlined, size: 35),
          onPressed: () {
            Get.to(NotificationsPage());
          },
        ),
        title: Align(
          alignment: Alignment.centerRight,
          child: Image.asset(
            'assets/images/Logo black.png',
            height: 40,
            color: Color.fromARGB(255, 99, 151, 110),
          ),
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: persons.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    final person = persons[index];
                    final profilePic = Icon(
                      Icons.person,
                      color: mainColor,
                      size: 40,
                    );
                    Get.to(
                      () => ChatPage(),
                      transition: Transition.rightToLeft,
                      arguments: {"name": person, "profilePic": profilePic},
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 70,
                    alignment: Alignment.centerLeft,
                    decoration: const BoxDecoration(color: Colors.white60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // عشان النصوص متبقاش في النص
                      children: [
                        Row(
                          children: [
                            Icon(Icons.person, color: mainColor, size: 40),
                            const SizedBox(width: 8),
                            Text(
                              persons[index],
                              style: TextStyle(color: mainColor, fontSize: 22),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              messages[random.nextInt(messages.length)],
                              style: TextStyle(color: secondaryColor),
                            ),
                            Text(
                              times[random.nextInt(times.length)],
                              style: TextStyle(color: secondaryColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

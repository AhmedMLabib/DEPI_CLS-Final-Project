import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharek/Colors/Colors.dart';
import 'package:sharek/pages/profile_details_from_chat_page.dart';
import 'package:sharek/pages/profile_page.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, Object>;
    final String name = args["name"] as String;
    final Widget profilePic = args["profilePic"] as Widget;
    // this controller is just for testing
    final msgCont = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            profilePic,
            const SizedBox(width: 6),
            InkWell(
              onTap: () {
                Get.to(ProfilePage());
              },

              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: mainColorDark,
                        ),
                      ),
                      Text(
                        "verified User",
                        style: TextStyle(
                          color: secondaryColorLight,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(
                () => ProfileDetailsFromChat(),
                transition: Transition.rightToLeft,

                // ARGUMENTS ARE DYNAMIC SOLVE IT SOON!!!!!!!!!!!!!
                arguments: [name, profilePic],
              );
            },
            icon: const Icon(Icons.more_vert, size: 28),
          ),
        ],
        backgroundColor: secondaryColor,
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: const [
                // ListTile(title: Text("Hello!")),
                // ListTile(title: Text("How are you?")),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: msgCont,
                    minLines: 1,
                    maxLines: 4,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    decoration: InputDecoration(
                      hintText: "Enter a message...",
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 14,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Colors.blue.shade300,
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.image, color: mainColor),
                ),
                SizedBox(height: 8),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.send, color: mainColor),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}

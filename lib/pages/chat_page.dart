import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("This is the Chat Page", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

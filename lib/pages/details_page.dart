import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({super.key});
  final item = Get.arguments ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "This is the Details Page item ${item["productName"]}",
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}

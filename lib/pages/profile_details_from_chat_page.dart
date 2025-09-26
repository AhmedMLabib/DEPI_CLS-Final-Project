import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharek/Colors/Colors.dart';

class ProfileDetailsFromChat extends StatelessWidget {
  ProfileDetailsFromChat({super.key});
  // this is for test only
  var notificationVal = true;

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments; // dynamic!!!!!!!!
    final String name = args[0];
    final Widget profilePic = args[1];
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(),
              Column(
                children: [
                  profilePic,
                  Text(
                    name,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(),
            ],
          ),
          SizedBox(height: 32),
          Container(
            height: 100,
            width: double.infinity,
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.circular(15),
            ),

            child: Column(
              children: [
                Row(
                  spacing: 8,
                  children: [
                    Icon(Icons.notifications, color: Colors.white, size: 32),
                    Text(
                      "Mute notification",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Switch(
                      value: notificationVal,
                      onChanged: (notificationVal) {},
                      activeColor: Colors.white, // لون الدائرة (thumb) وهي On
                      activeTrackColor: secondaryColor, // لون الخلفية وهي On
                      inactiveThumbColor:
                          Colors.grey.shade400, // لون الدائرة وهي Off
                      inactiveTrackColor:
                          Colors.grey.shade300, // لون الخلفية وهي Off
                      trackOutlineColor: MaterialStateProperty.all(
                        Colors.transparent,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Container(
            height: 100,
            width: double.infinity,
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.circular(15),
            ),

            child: Column(
              children: [
                Row(
                  spacing: 8,
                  children: [
                    Icon(
                      Icons.vertical_align_top,
                      color: Colors.white,
                      size: 32,
                    ),
                    Text(
                      "Pin Chat",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Switch(
                      value: notificationVal,
                      onChanged: (notificationVal) {},
                      activeColor: Colors.white, // لون الدائرة (thumb) وهي On
                      activeTrackColor: secondaryColor, // لون الخلفية وهي On
                      inactiveThumbColor:
                          Colors.grey.shade400, // لون الدائرة وهي Off
                      inactiveTrackColor:
                          Colors.grey.shade300, // لون الخلفية وهي Off
                      trackOutlineColor: MaterialStateProperty.all(
                        Colors.transparent,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Get.snackbar("Notification", "$name is blocked");
            },
            child: Container(
              height: 100,
              width: double.infinity,
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(15),
              ),

              child: Column(
                children: [
                  Row(
                    spacing: 8,
                    children: [
                      Icon(Icons.report, color: Colors.red, size: 32),
                      Text(
                        "Block $name",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      Expanded(child: SizedBox()),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

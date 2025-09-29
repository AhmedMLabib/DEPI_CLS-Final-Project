import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharek/Colors/Colors.dart';

class ProfileDetailsFromChat extends StatelessWidget {
  ProfileDetailsFromChat({super.key});

  // reactive values using GetX
  final RxBool notificationVal = true.obs;
  final RxBool pinChatVal = false.obs;

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    final String name = args[0];
    final Widget profilePic = args[1];

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  profilePic,
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 32),
          // mute notifications
          Obx(
            () => settingsTile(
              icon: Icons.notifications,
              text: "Mute notification",
              trailing: Switch(
                value: notificationVal.value,
                onChanged: (v) => notificationVal.value = v,
                activeColor: Colors.white,
                activeTrackColor: secondaryColor,
                inactiveThumbColor: Colors.grey.shade400,
                inactiveTrackColor: Colors.grey.shade300,
                trackOutlineColor: MaterialStateProperty.all(
                  Colors.transparent,
                ),
              ),
            ),
          ),
          // pin chat
          Obx(
            () => settingsTile(
              icon: Icons.vertical_align_top,
              text: "Pin Chat",
              trailing: Switch(
                value: pinChatVal.value,
                onChanged: (v) => pinChatVal.value = v,
                activeColor: Colors.white,
                activeTrackColor: secondaryColor,
                inactiveThumbColor: Colors.grey.shade400,
                inactiveTrackColor: Colors.grey.shade300,
                trackOutlineColor: MaterialStateProperty.all(
                  Colors.transparent,
                ),
              ),
            ),
          ),
          // block user
          settingsTile(
            icon: Icons.report,
            text: "Block $name",
            textColor: Colors.red,
            onTap: () {
              Get.snackbar("Notification", "$name is blocked");
            },
          ),
        ],
      ),
    );
  }

  Widget settingsTile({
    required IconData icon,
    required String text,
    Color? textColor,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 100,
        width: double.infinity,
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Icon(icon, color: textColor ?? Colors.white, size: 32),
            const SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: textColor ?? Colors.white,
              ),
            ),
            const Spacer(),
            if (trailing != null) trailing,
          ],
        ),
      ),
    );
  }
}

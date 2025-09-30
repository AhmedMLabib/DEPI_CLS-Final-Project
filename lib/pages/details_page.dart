import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharek/pages/requests_page.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    if (args == null || args is! Map<String, dynamic>) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: Text("لا توجد بيانات للعرض")),
      );
    }
    final item = args as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: Image.asset(
            'assets/images/Logo black.png',
            height: 40,
            color: const Color.fromARGB(255, 99, 151, 110),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                child: Stack(
                  children: [
                    Image.asset(
                      item['mainPicture'] as String,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 100),
                      padding: const EdgeInsets.only(top: 60),
                      width: double.infinity,
                      height: 100,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 99, 151, 110),
                            Color.fromARGB(120, 99, 151, 110),
                            Colors.transparent,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Card(
                shadowColor: Colors.black,
                elevation: 7,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            item["location"] as String,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            item["date"],
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Column(
                          children: [
                            Text(
                              item["userName"] as String,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              item["isVerified"] ? "موثق" : "غير موثق",
                              style: TextStyle(
                                color: item["isVerified"]
                                    ? const Color.fromARGB(255, 99, 151, 110)
                                    : Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          item['userProfilePic'] as String,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                item["productName"] as String,
                textDirection: TextDirection.rtl,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                item["description"] as String,
                textDirection: TextDirection.rtl,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 99, 151, 110),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () =>
                      Get.to(() => const RequestsPage(), arguments: item),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 99, 151, 110),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    "أطلب",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

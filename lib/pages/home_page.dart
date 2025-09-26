import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharek/pages/details_page.dart';
import 'package:sharek/pages/notifications_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final address = "الجيزة , مصر";
  final searchController = TextEditingController();
  final categories = ['ملابس', 'إلكترونيات', 'كتب', 'طعام'];

  final items = [
    {
      "mainPicture": "assets/images/laptop.jpg",
      "userName": "أحمد علي",
      "isVerified": true,
      "userProfilePic": "assets/images/profile.png",
      "date": "2025-09-26",
      "location": "القاهرة، مصر",
      "productName": "لاب توب",
    },
    {
      "mainPicture": "assets/images/book.jpg",
      "userName": "سارة محمد",
      "isVerified": false,
      "userProfilePic": "assets/images/profile.png",
      "date": "2025-09-20",
      "location": "الإسكندرية، مصر",
      "productName": "كتاب",
    },
    {
      "mainPicture": "assets/images/t-shirt.jpg",
      "userName": "عمر خالد",
      "isVerified": true,
      "userProfilePic": "assets/images/profile.png",
      "date": "2025-09-15",
      "location": "الجيزة، مصر",
      "productName": "تي شيرت",
    },
    {
      "mainPicture": "assets/images/food.jpg",
      "userName": "ليلى علي",
      "isVerified": false,
      "userProfilePic": "assets/images/profile.png",
      "date": "2025-09-10",
      "location": "المنصورة، مصر",
      "productName": "طعام",
    },
  ];

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                textDirection: TextDirection.rtl,
                children: [Icon(Icons.location_on), Text(address)],
              ),
              // Search Bar
              SizedBox(height: 10),
              TextField(
                controller: searchController,
                textDirection: TextDirection.rtl,

                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 157, 192, 138),
                  hintTextDirection: TextDirection.rtl,
                  hintStyle: TextStyle(fontSize: 16, color: Colors.white),
                  hintText: 'أبحث',
                  prefixIcon: IconButton(
                    icon: Icon(Icons.search, size: 30, color: Colors.white),
                    onPressed: () {
                      print('Search: ${searchController.text}');
                    },
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 10),
              // Categories
              GridView.builder(
                shrinkWrap: true,

                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 157, 192, 138),
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Text(
                    categories[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                itemCount: categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 8,
                  mainAxisExtent: 30,
                ),
              ),
              SizedBox(height: 10),
              // Items
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return Card(
                      margin: EdgeInsets.only(bottom: 24),
                      color: Colors.white60,
                      elevation: 12,
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: InkWell(
                        onTap: () {
                          Get.to(() => DetailsPage(), arguments: item);
                        },
                        child: Column(
                          textDirection: TextDirection.rtl,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(Icons.location_on, size: 16),
                                  Text(item['location'] as String),
                                  Spacer(),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            item['userName'] as String,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                          if (item['isVerified'] as bool) ...[
                                            SizedBox(width: 5),
                                            Icon(
                                              Icons.check_circle,
                                              color: Color.fromARGB(
                                                255,
                                                99,
                                                151,
                                                110,
                                              ),
                                              size: 16,
                                            ),
                                          ],
                                        ],
                                      ),
                                      Text(item['date'] as String),
                                    ],
                                  ),
                                  SizedBox(width: 10),

                                  CircleAvatar(
                                    backgroundImage: AssetImage(
                                      item['userProfilePic'] as String,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                                right: 8.0,
                                bottom: 8.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['productName'] as String,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  // SizedBox(height: 4),
                                  // Row(
                                  //   children: [
                                  //     Icon(Icons.location_on, size: 16),
                                  //     SizedBox(width: 4),
                                  //     Text(item['location'] as String),
                                  //   ],
                                  // ),
                                ],
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(32),
                                bottomRight: Radius.circular(32),
                              ),
                              child: Image.asset(
                                item['mainPicture'] as String,
                                width: double.infinity,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: items.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

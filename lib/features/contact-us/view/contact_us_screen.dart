import 'package:flutter/material.dart';

import '../../../core/shared-widgets/app_bar.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefualtAppBar(title: "إتصل بنا"),
      body: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.centerRight,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "كلية الأتصالات والمعلومات ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            SizedBox(height: 15),
            Text(
              "الشؤون الفنية والمرافق والصيانة",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "رقم مكتب المساعدة :95671 ",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Text(
                  "الرياض    ",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Text(
                    "443103797@tvtc.edu.sa",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

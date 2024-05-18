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
              "البريد الالكتروني",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "كلية الأتصالات والمعلومات ",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "رقم مكتب المساعدة :95671 ",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "الرياض: 443103797@tvtc.edu.sa",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

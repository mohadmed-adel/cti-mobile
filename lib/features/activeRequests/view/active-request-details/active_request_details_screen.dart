import 'package:flutter/material.dart';

import '../../models/requested_services_model.dart';
import 'widgets/add_attachment_tap.dart';
import 'widgets/leave_comment_tap..dart';
import 'widgets/request_detials_tap.dart';

class ActiveRequestDetailsScreen extends StatelessWidget {
  const ActiveRequestDetailsScreen({super.key, required this.requestedService});
  final RequestedServiceModel requestedService;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "تفاصيل الخدمة",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(text: "تفاصيل الطلب"),
              Tab(text: "أضف تعليق"),
              Tab(text: "أضف ملحق"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            RequestDetailsTap(requestedService: requestedService),
            LeaveCommentTap(requestedServicesId: requestedService.id!),
            AddAttachmentTap(requestedService: requestedService),
          ],
        ),
      ),
    );
  }
}

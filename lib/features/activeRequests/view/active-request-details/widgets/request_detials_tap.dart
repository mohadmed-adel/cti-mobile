import 'package:cti/features/activeRequests/view/active-request-details/widgets/display_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/requested_services_model.dart';

class RequestDetailsTap extends StatelessWidget {
  const RequestDetailsTap({super.key, required this.requestedService});
  final RequestedServiceModel requestedService;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DisplayItem(
            title: "رقم التذكرة",
            value: requestedService.id.toString(),
          ),
          DisplayItem(
            title: "الموقع",
            value: requestedService.location ?? "",
          ),
          DisplayItem(
            title: "الخدمة المطلوبه",
            value: requestedService.services?.name ?? "",
          ),
          DisplayItem(
            title: "تاريخ الطلب",
            value: DateFormat("yyyy/MM/dd hh:mm a", "ar")
                .format(DateTime.parse(requestedService.createdAt!))
                .toString(),
          ),
          DisplayItem(
            title: "الوصف",
            value: requestedService.description ?? "",
          ),
          DisplayItem(
            title: "رقم الطابق",
            value: requestedService.buildingNumber ?? "",
          ),
          DisplayItem(
            title: "رقم الغرفة او رقم الاصل",
            value: requestedService.assetNumber ?? "",
          ),
          DisplayItem(
            title: "حالة الطلب",
            value: requestedService.status ?? "",
          ),
        ],
      ),
    );
  }
}

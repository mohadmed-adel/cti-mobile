import 'package:flutter/material.dart';

import '../../../models/requested_services_model.dart';
import '../../active-request-details/active_request_details_screen.dart';

class RequestedServicesCard extends StatelessWidget {
  const RequestedServicesCard({super.key, required this.requestedService});
  final RequestedServiceModel requestedService;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => ActiveRequestDetailsScreen(
                requestedService: requestedService)));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      requestedService.services!.image,
                    ),
                  )),
            ),
            const SizedBox(width: 10),
            Text(requestedService.services!.name),
            const Spacer(),
            Text(requestedService.description ?? ""),
            const Spacer(),
            Text(requestedService.status ?? ""),
          ],
        ),
      ),
    );
  }
}

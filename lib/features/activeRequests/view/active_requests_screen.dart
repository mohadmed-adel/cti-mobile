import 'package:cti/core/shared-widgets/app_bar.dart';
import 'package:flutter/material.dart';

import '../../../core/shared-widgets/app_loader.dart';
import '../models/requested_services_model.dart';
import '../services/active_request_services.dart';

class ActiveRequestsScreen extends StatelessWidget {
  const ActiveRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefualtAppBar(
        title: "الطلبات النشطه",
        showMenuBtn: false,
      ),
      body: FutureBuilder(
        future: ActiveRequestServices.getActiveRequestList(),
        builder: (BuildContext context,
            AsyncSnapshot<List<RequestedServiceModel>> snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const AppLoader();
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else {
            List<RequestedServiceModel> list = snapshot.data ?? [];
            return ListView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return RequestedServicesCard(
                    requestedService: list[index],
                  );
                });
          }
        },
      ),
    );
  }
}

class RequestedServicesCard extends StatelessWidget {
  const RequestedServicesCard({super.key, required this.requestedService});
  final RequestedServiceModel requestedService;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
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
          Text(requestedService.services!.name),
          const Spacer(),
          Text(requestedService.description ?? ""),
        ],
      ),
    );
  }
}

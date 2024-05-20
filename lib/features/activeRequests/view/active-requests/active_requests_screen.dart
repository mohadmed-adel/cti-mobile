import 'package:cti/core/shared-widgets/app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../core/shared-widgets/app_loader.dart';
import '../../models/requested_services_model.dart';
import '../../services/active_request_services.dart';
import 'widgets/requested_services_card.dart';

class ActiveRequestsScreen extends StatelessWidget {
  const ActiveRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefualtAppBar(title: "الطلبات النشطه"),
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

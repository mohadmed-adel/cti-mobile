import 'package:cti/core/constants/app_images.dart';
import 'package:cti/core/constants/colors.dart';
import 'package:cti/features/activeRequests/view/request-new-services/request_new_service_screen.dart';
import 'package:cti/features/services/services-list/models/cate_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/shared-widgets/app_bar.dart';
import '../../../../core/shared-widgets/app_loader.dart';
import '../../../activeRequests/models/services_model.dart';
import '../services/services_list_services.dart';

class CatServicesListScreen extends StatelessWidget {
  const CatServicesListScreen({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefualtAppBar(title: "انشاء طلب جديد"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category.name,
              style: const TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
                child: FutureBuilder(
                    future:
                        ServicesListServeice.getCatServicesList(category.id),
                    builder:
                        (context, AsyncSnapshot<List<ServicesModel>> snapshot) {
                      if (snapshot.connectionState != ConnectionState.done) {
                        return const AppLoader();
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      } else {
                        List<ServicesModel> seervices = snapshot.data ?? [];

                        return seervices.isEmpty
                            ? const Center(
                                child: Text("لا يوجد خدمات في الوقت الحالي"),
                              )
                            : GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0,
                                ),
                                itemCount: seervices.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (ctx) {
                                        return RequestNewServiceScreen(
                                            services: seervices[index]);
                                      }));
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 100,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            image: const DecorationImage(
                                                image:
                                                    AssetImage(AppImages.logo)),
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: AppColors.primary),
                                          ),
                                        ),
                                        Text(
                                          seervices[index].name,
                                          style: const TextStyle(
                                            color: AppColors.primary,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                      }
                    }))
          ],
        ),
      ),
    );
  }
}

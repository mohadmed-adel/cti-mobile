import 'package:cti/core/constants/app_images.dart';
import 'package:cti/core/constants/colors.dart';
import 'package:cti/features/services/services-list/models/cate_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/shared-widgets/app_bar.dart';
import '../../../../core/shared-widgets/app_loader.dart';
import '../services/services_list_services.dart';
import 'cate_services_list_screen.dart';

class CatsListScreen extends StatelessWidget {
  const CatsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefualtAppBar(title: "انشاء طلب جديد"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "الخدمات",
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
                child: FutureBuilder(
                    future: ServicesListServeice.getCatsList(),
                    builder:
                        (context, AsyncSnapshot<List<CategoryModel>> snapshot) {
                      if (snapshot.connectionState != ConnectionState.done) {
                        return const AppLoader();
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      } else {
                        List<CategoryModel> cats = snapshot.data ?? [];

                        return GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                            ),
                            itemCount: cats.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (ctx) => CatServicesListScreen(
                                          category: cats[index])));
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                            image: AssetImage(AppImages.logo)),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: AppColors.primary),
                                      ),
                                    ),
                                    Text(
                                      cats[index].name,
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

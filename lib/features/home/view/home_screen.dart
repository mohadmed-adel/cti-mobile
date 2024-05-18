import 'package:cti/core/constants/app_icons.dart';
import 'package:cti/core/shared-widgets/app_button.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/shared-widgets/app_bar.dart';
import '../../../core/shared-widgets/app_loader.dart';
import '../../activeRequests/view/active-requests/active_requests_screen.dart';
import '../../services/services-list/view/cats_list_screen.dart';
import '../models/user_model.dart';
import '../services/home_services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefualtAppBar(title: "الرئيسية", showArrowBack: false),
      body: FutureBuilder(
          future: HomeServices.getUserInfo(),
          builder: (BuildContext context, AsyncSnapshot<UserModel> snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const AppLoader();
            } else if (snapshot.hasError || snapshot.data?.error != null) {
              return const Center(child: Text("حدث خطأ يرجي المحاولة لاحقاً"));
            } else {
              return ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                children: [
                  const Center(
                    child: Text(
                      "اهلاً بك",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "${snapshot.data?.firstName} ${snapshot.data?.lastName}",
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  AppButton(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const CatsListScreen()));
                    },
                    title: "انشاء طلب",
                  ),
                  AppButton(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const ActiveRequestsScreen()));
                    },
                    title: "الطلبات النشطه",
                  )
                ],
              );
            }
          }),
    );
  }
}

class HomeItem extends StatelessWidget {
  const HomeItem({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
  });
  final String title;
  final Function onTap;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          Image.asset(AppIcons.arrowIcon),
          Text(
            title,
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Image.asset(icon),
        ],
      ),
    );
  }
}

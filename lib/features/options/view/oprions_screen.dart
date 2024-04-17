import 'package:cti/core/constants/app_icons.dart';
import 'package:cti/core/local/storage_services.dart';
import 'package:cti/features/home/view/home_screen.dart';
import 'package:cti/features/login/view/login_screen.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_images.dart';
import '../../../core/constants/colors.dart';
import '../../../core/shared-widgets/app_loader.dart';
import '../../../main.dart';
import '../../home/models/user_model.dart';
import '../../home/services/home_services.dart';

class OptionsScreen extends StatelessWidget {
  const OptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OptionsAppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: [
          OptionsItem(
            title: "الرئيسية",
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => const HomeScreen()));
            },
            icon: AppIcons.homeIcon,
          ),
          OptionsItem(
            title: "اتصل بنا",
            onTap: () {},
            icon: AppIcons.callIcon,
          ),
          OptionsItem(
            title: "خروج",
            onTap: () {
              storageService?.removeKey(StorageKeys.token);

              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => const LoginScreen()));
            },
            icon: AppIcons.exitIcon,
          ),
        ],
      ),
    );
  }
}

class OptionsItem extends StatelessWidget {
  const OptionsItem({
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
    return InkWell(
      onTap: () => onTap(),
      child: Container(
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
            Image.asset(
              icon,
            ),
          ],
        ),
      ),
    );
  }
}

class OptionsAppBar extends StatefulWidget implements PreferredSizeWidget {
  const OptionsAppBar({super.key});

  @override
  State<OptionsAppBar> createState() => _OptionsAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(250);
}

class _OptionsAppBarState extends State<OptionsAppBar> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: HomeServices.getUserInfo(),
        builder: (BuildContext context, AsyncSnapshot<UserModel> snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const AppLoader();
          } else if (snapshot.hasError || snapshot.data?.error != null) {
            return Text("${snapshot.data?.error ?? snapshot.error}");
          }
          return Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.blueAccent,
              image: DecorationImage(
                image: AssetImage(AppImages.barBackgroundImage),
                fit: BoxFit.fitHeight,
              ),
            ),
            child: Column(
              children: [
                const Spacer(),
                Image.asset(
                  AppImages.logo,
                  height: 200,
                ),
                Text(
                  "${snapshot.data?.firstName} ${snapshot.data?.lastName}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
              ],
            ),
          );
        });
  }
}

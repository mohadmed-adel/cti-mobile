import 'package:cti/core/constants/app_icons.dart';
import 'package:cti/features/home/view/home_screen.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_images.dart';
import '../../../core/constants/colors.dart';

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
            onTap: () {},
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
            Image.asset(icon),
          ],
        ),
      ),
    );
  }
}

class OptionsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OptionsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: AppColors.primary,
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
            width: 100,
            height: 100,
          ),
          const Text(
            "Hamoud Turki Alharbi",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(250);
}

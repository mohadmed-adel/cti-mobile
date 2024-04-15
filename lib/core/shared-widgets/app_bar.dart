import 'package:cti/core/constants/colors.dart';
import 'package:cti/features/options/view/oprions_screen.dart';
import 'package:flutter/material.dart';

import '../constants/app_images.dart';

class DefualtAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefualtAppBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: AppColors.primary,
        image: DecorationImage(
          image: AssetImage(AppImages.barBackgroundImage),
          fit: BoxFit.fitHeight,
        ),
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          const Spacer(flex: 3),
          Row(
            children: [
              const Spacer(flex: 1),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => const OptionsScreen()));
                  },
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                  )),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(80);
}

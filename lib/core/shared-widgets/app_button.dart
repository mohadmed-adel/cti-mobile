import 'package:cti/core/constants/colors.dart';
import 'package:cti/core/shared-widgets/app_loader.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? title;

  final bool isLoading;

  const AppButton({
    super.key,
    required this.onTap,
    this.title,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: isLoading
          ? const AppLoader()
          : ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                side: const BorderSide(color: Colors.white, width: 5),
                backgroundColor: AppColors.primary,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                minimumSize: const Size(100, 50),
                fixedSize: const Size(100, 50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (title != null)
                        Text(title!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 20,
                            )),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}

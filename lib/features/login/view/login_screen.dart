import 'package:cti/core/constants/app_images.dart';
import 'package:cti/core/constants/colors.dart';
import 'package:cti/core/local/storage_services.dart';
import 'package:cti/core/shared-widgets/app_button.dart';
import 'package:cti/core/shared-widgets/app_text_form_field.dart';
import 'package:cti/core/shared-widgets/app_toast.dart';
import 'package:cti/features/home/view/home_screen.dart';
import 'package:cti/features/login/services/models/login_response_model.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';
import '../services/login_services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: [
          const SizedBox(height: 20),
          Image.asset(
            AppImages.logo,
            height: 200,
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              "تسجيل الدخول",
              style: TextStyle(
                fontSize: 20,
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(height: 10),
          AppTextFormField(
            onSaved: (value) {},
            label: "اسم المستخدم",
          ),
          const SizedBox(height: 10),
          AppTextFormField(
            onSaved: (value) {},
            label: "كلمة المرور",
          ),
        ],
      ),
      bottomNavigationBar: AppButton(
          isLoading: _isLoading,
          onTap: () async {
            try {
              setState(() {
                _isLoading = true;
              });
              LoginResponseModel loginResponse = await LoginServeice.login(
                  username: "mohamed_adel", password: "Error1033@");

              if (loginResponse.code == 200) {
                storageService?.setValue(
                    key: StorageKeys.token, value: loginResponse.accessToken);

                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (ctx) {
                  return const HomeScreen();
                }));
              } else {
                AppToast.showErrorToast(context, loginResponse.error ?? "");
              }
            } finally {
              setState(() {
                _isLoading = false;
              });
            }
          },
          title: "تسجيل الدخول"),
    );
  }
}

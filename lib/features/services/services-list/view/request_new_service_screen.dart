import 'package:cti/core/shared-widgets/app_bar.dart';
import 'package:cti/features/services/services-list/models/services_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/shared-widgets/app_button.dart';
import '../../../../core/shared-widgets/app_text_form_field.dart';

class RequestNewServiceScreen extends StatefulWidget {
  const RequestNewServiceScreen({super.key, required this.services});
  final ServicesModel services;

  @override
  State<RequestNewServiceScreen> createState() =>
      _RequestNewServiceScreenState();
}

class _RequestNewServiceScreenState extends State<RequestNewServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefualtAppBar(title: "انشاء طلب جديد"),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          AppTextFormField(
            label: "وصف الخدمة",
            onSaved: (value) {},
          ),
          AppTextFormField(
            label: "معرفة الموقع",
            onSaved: (value) {},
          ),
          AppTextFormField(
            label: "اسم المبني او اسم المحظة",
            onSaved: (value) {},
          ),
          AppTextFormField(
            label: "رقم الطابق",
            textInputType: TextInputType.number,
            onSaved: (value) {},
          ),
          AppTextFormField(
            label: "رقم الغرفة او رقم الاصل",
            textInputType: TextInputType.number,
            onSaved: (value) {},
          ),
        ],
      ),
      bottomNavigationBar: AppButton(
        title: "عرض",
        onTap: () {},
      ),
    );
  }
}

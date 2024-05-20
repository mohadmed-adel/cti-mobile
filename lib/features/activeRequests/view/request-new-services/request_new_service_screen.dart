import 'package:cti/core/shared-widgets/app_bar.dart';
import 'package:cti/features/activeRequests/models/services_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/shared-widgets/app_button.dart';
import '../../../../core/shared-widgets/app_text_form_field.dart';
import '../../models/requested_services_model.dart';
import '../../services/active_request_services.dart';

class RequestNewServiceScreen extends StatefulWidget {
  const RequestNewServiceScreen({super.key, required this.services});
  final ServicesModel services;

  @override
  State<RequestNewServiceScreen> createState() =>
      _RequestNewServiceScreenState();
}

class _RequestNewServiceScreenState extends State<RequestNewServiceScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String? des, location, buildingName;
  int? assetNumber, buildingNumber;
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefualtAppBar(title: "انشاء طلب جديد"),
      body: Form(
        key: _key,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: [
            AppTextFormField(
              label: "وصف الخدمة",
              onSaved: (value) {
                des = value;
              },
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "برجاء ادخال وصف الخدمة";
                }
                return null;
              },
            ),
            AppTextFormField(
              label: "الموقع",
              onSaved: (value) {
                location = value;
              },
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "برجاء ادخال الموقع";
                }
                return null;
              },
            ),
            AppTextFormField(
              label: "اسم المبني او اسم المحطه",
              onSaved: (value) {
                buildingName = value;
              },
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "برجاء ادخال اسم المبني او اسم المحطه";
                }
                return null;
              },
            ),
            AppTextFormField(
              label: "رقم الطابق",
              textInputType: TextInputType.number,
              onSaved: (value) {
                if (value != null) {
                  buildingNumber = int.tryParse(value);
                }
              },
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "برجاء ادخال رقم الطابق";
                } else if (int.tryParse(value) == null) {
                  return "يجب إدخال رقم";
                }
                return null;
              },
            ),
            AppTextFormField(
              label: "رقم الغرفة او رقم الاصل",
              textInputType: TextInputType.number,
              onSaved: (value) {
                if (value != null) {
                  assetNumber = int.tryParse(value);
                }
              },
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "برجاء ادخال رقم الغرفه او رقم الاصل";
                } else if (int.tryParse(value) == null) {
                  return "يجب إدخال رقم";
                }
                return null;
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppButton(
        isLoading: _isLoading,
        title: "عرض",
        onTap: () async {
          try {
            if (_key.currentState!.validate()) {
              _key.currentState!.save();
              setState(() {
                _isLoading = true;
              });
              RequestedServiceModel requestedService = RequestedServiceModel(
                serviceId: widget.services.id.toString(),
                description: des!,
                location: location!,
                buildingName: buildingName!,
                buildingNumber: buildingNumber!.toString(),
                assetNumber: assetNumber!.toString(),
              );
              RequestedServiceModel? createdRequestedServiceModel =
                  await ActiveRequestServices.requestNewService(
                      requestedService);
              if (createdRequestedServiceModel != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "تم الطلب بنجاح",
                      textAlign: TextAlign.center,
                    ),
                    backgroundColor: Colors.green,
                  ),
                );
                Navigator.of(context).pop();
              }
            }
          } finally {
            setState(() {
              _isLoading = false;
            });
          }
        },
      ),
    );
  }
}

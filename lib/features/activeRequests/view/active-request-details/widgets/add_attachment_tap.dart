import 'dart:io';

import 'package:cti/core/constants/app_icons.dart';
import 'package:cti/features/activeRequests/services/active_request_services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gallery_saver/gallery_saver.dart';

import '../../../models/requested_services_model.dart';

class AddAttachmentTap extends StatefulWidget {
  const AddAttachmentTap({super.key, required this.requestedService});
  final RequestedServiceModel requestedService;

  @override
  State<AddAttachmentTap> createState() => _AddAttachmentTapState();
}

class _AddAttachmentTapState extends State<AddAttachmentTap> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              uploadImage(widget.requestedService.id!);
            },
            child: Container(
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Spacer(),
                  Image.asset(AppIcons.cameraIcon),
                  const Text("اختار"),
                  const Spacer(),
                ],
              ),
            ),
          ),
          const SizedBox(width: 20),
          if (widget.requestedService.attachment != null)
            InkWell(
              onTap: () {
                downlaodImage();
              },
              child: Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const Spacer(),
                    Image.asset(AppIcons.donwloadIcon),
                    const Text("تحميل"),
                    const Spacer(),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  uploadImage(int id) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      String? url = await ActiveRequestServices.addAttachment(id, file);
      if (url != null) {
        setState(() {
          widget.requestedService.attachment = url;
        });
      }
    } else {
      // User canceled the picker
    }
  }

  downlaodImage() async {
    try {
      await GallerySaver.saveImage(widget.requestedService.attachment!);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "تم  تحميل الصورة بنجاح",
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.green,
        ),
      );
    } on PlatformException catch (error) {
      print(error);
    }
  }
}

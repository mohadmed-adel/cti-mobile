import 'package:cti/core/shared-widgets/app_button.dart';
import 'package:cti/core/shared-widgets/app_text_form_field.dart';
import 'package:cti/features/activeRequests/models/comment_model.dart';
import 'package:cti/features/activeRequests/services/active_request_services.dart';
import 'package:flutter/material.dart';

import '../../../../../core/shared-widgets/app_loader.dart';

class LeaveCommentTap extends StatefulWidget {
  const LeaveCommentTap({super.key, required this.requestedServicesId});
  final int requestedServicesId;

  @override
  State<LeaveCommentTap> createState() => _LeaveCommentTapState();
}

class _LeaveCommentTapState extends State<LeaveCommentTap> {
  bool _isLoading = false;
  String? comment;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Form(
            key: _key,
            child: AppTextFormField(
              onSaved: (value) {
                comment = value;
              },
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "برجاء إدخال التعليق";
                }
                return null;
              },
              fillColor: Colors.white,
              label: "إضف تعليق جديد",
              maxLine: 4,
            ),
          ),
          AppButton(
            isLoading: _isLoading,
            onTap: () async {
              try {
                setState(() {
                  _isLoading = true;
                });
                if (_key.currentState!.validate()) {
                  _key.currentState!.save();
                  CommentModel? commentModel =
                      await ActiveRequestServices.leaveComment(CommentModel(
                          comment: comment!,
                          requestedServices: widget.requestedServicesId));

                  if (commentModel != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "تم التعليق بنجاح",
                          textAlign: TextAlign.center,
                        ),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                }
              } finally {
                setState(() {
                  _isLoading = false;
                });
              }
            },
            title: "تعليق",
          ),
          const Text(
            "التعليقات السابقه",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 15,
            ),
          ),
          FutureBuilder(
              future: ActiveRequestServices.getCommentList(
                  widget.requestedServicesId),
              builder: (BuildContext context,
                  AsyncSnapshot<List<CommentModel>> snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const AppLoader();
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                } else {
                  List<CommentModel> list = snapshot.data ?? [];
                  return Expanded(
                    child: ListView.builder(
                        padding: const EdgeInsets.all(0),
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return CommentCard(
                            comment: list[index],
                          );
                        }),
                  );
                }
              }),
        ],
      ),
    );
  }
}

class CommentCard extends StatelessWidget {
  const CommentCard({super.key, required this.comment});
  final CommentModel comment;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(comment.comment));
  }
}

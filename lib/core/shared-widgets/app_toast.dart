import 'package:cti/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class AppToast {
  static showErrorToast(BuildContext context, String errorMsg) {
    FocusScope.of(context).unfocus();
    showToast(
      errorMsg,
      backgroundColor: AppColors.red,
      context: context,
      duration: const Duration(seconds: 5),
      animation: StyledToastAnimation.scale,
    );
  }

  static showSuccessToast(BuildContext context, String msg) {
    FocusScope.of(context).unfocus();
    showToast(
      msg,
      backgroundColor: AppColors.primary,
      duration: const Duration(seconds: 5),
      context: context,
      animation: StyledToastAnimation.scale,
    );
  }
}

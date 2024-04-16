import 'package:cti/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField(
      {super.key,
      this.label,
      this.textInputType,
      this.maxLine,
      this.focusNode,
      this.nextNode,
      this.validator,
      this.fillColor,
      this.labelText,
      required this.onSaved,
      this.initValue,
      this.inputFormatters,
      this.maxLength});

  final String? label;
  final TextInputType? textInputType;
  final int? maxLine;
  final FocusNode? focusNode;
  final FocusNode? nextNode;
  final String? Function(String? value)? validator;
  final Color? fillColor;
  final String? labelText;
  final Function(String? value) onSaved;
  final String? initValue;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label ?? "",
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 3),
          TextFormField(
            textAlign: TextAlign.start,
            maxLines: maxLine ?? 1,
            maxLength: maxLength,
            focusNode: focusNode,
            onSaved: (value) {
              onSaved(value);
            },
            keyboardType: textInputType ?? TextInputType.text,
            initialValue: initValue,
            onFieldSubmitted: (v) {
              FocusScope.of(context).requestFocus(nextNode);
            },
            inputFormatters: inputFormatters ??
                [FilteringTextInputFormatter.singleLineFormatter],
            validator: (input) {
              if (validator != null) {
                return validator!(input);
              }
              return null;
            },
            decoration: InputDecoration(
              filled: false,
              labelText: labelText,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 15),
              isDense: true,
              counterText: '',
              focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary)),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary)),
              errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red)),
              hintStyle: const TextStyle(),
              errorStyle: const TextStyle(height: 1.5),
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }
}

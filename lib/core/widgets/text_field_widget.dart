// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required this.hintText,
    this.label = '',
    this.suffixIcon,
    this.hidePassword,
    this.textInputAction,
    this.validator,
    this.onChange,
    this.errorText,
    this.labelColor,
    this.hintColor,
    this.isEnabled,
    this.onTap,
    this.controller,
    this.useBorder,
    this.readOnly = false,
    this.disableBorderColor,
    this.contentPadding,
    this.textInputType,
    this.inputFormatters,
    this.maxLine = 1,
    this.minLine = 1,
  }) : super(key: key);

  // Variables
  final String hintText;
  final Widget? suffixIcon;
  final bool? hidePassword;
  final String label;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final String? errorText;
  final Function(String)? onChange;
  final bool? isEnabled;
  final Color? labelColor;
  final Color? hintColor;
  final bool? useBorder;
  final bool? readOnly;
  final int maxLine;
  final int minLine;
  final Color? disableBorderColor;
  final Function()? onTap;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          InkWell(
            onTap: onTap,
            child: TextFormField(
              minLines: minLine,
              maxLines: maxLine,
              inputFormatters: inputFormatters,
              readOnly: readOnly ?? false,
              controller: controller,
              enabled: isEnabled ?? true,
              textInputAction: textInputAction ?? TextInputAction.done,
              keyboardType: textInputType,
              validator: validator,
              onChanged: onChange,
              obscureText: hidePassword ?? false,
              decoration: InputDecoration(
                errorText: errorText,
                errorMaxLines: 1,
                filled: true,
                isDense: true,
                fillColor: Colors.white,
                hoverColor: Colors.white,
                prefixIconColor: Colors.white,
                contentPadding: contentPadding,
                border: useBorder ?? true
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      )
                    : InputBorder.none,
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(),
                  borderRadius: BorderRadius.circular(4),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade700,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                hintText: hintText,
                suffixIcon: suffixIcon,
                hintStyle: TextStyle(
                  color: hintColor ?? Colors.grey,
                ),
              ),
            ),
          )
        ],
      );
}

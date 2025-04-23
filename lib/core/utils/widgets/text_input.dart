import 'package:flutter/material.dart';
import 'package:gemchat/core/utils/extentions/context_extention.dart';

class MyTextInput extends StatelessWidget {
  MyTextInput({
    super.key,
    this.label,
    this.obscureText = false,
    this.autoValidateMode,
    this.validator,
    this.suffixIcon,
    this.keyboardType,
    this.onChange,
    this.hintText,
    this.padding,
    this.borderInputNone = false,
    this.prefixIcon,
    this.customBorder,
    this.onTap,
    this.focusNode,
    this.filled,
    this.filledColor,
    this.hintStyle,
    this.readOnly,
    this.textInputAction,
    this.maxLength,
    this.controller,
  });

  final String? label;
  final String? hintText;
  final AutovalidateMode? autoValidateMode;
  final bool obscureText;
  final bool borderInputNone;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? filled;
  final Color? filledColor;
  final TextInputType? keyboardType;
  final EdgeInsets? padding;
  final TextEditingController? controller;
  String? Function(String?)? onChange;
  final void Function()? onTap;
  final OutlineInputBorder? customBorder;
  final FocusNode? focusNode;
  String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final bool? readOnly;
  final int? maxLength;
  final TextStyle? hintStyle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      obscureText: obscureText,
      autovalidateMode: autoValidateMode,
      textInputAction: textInputAction,
      maxLength: maxLength,
      // style:
      //     TextStyle(fontSize: 16.sp, color: context.colorScheme.onBackground),
      cursorColor: Colors.black,
      textAlignVertical: TextAlignVertical.bottom,
      onTap: onTap,
      readOnly: readOnly ?? false,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        contentPadding: padding,
        filled: filled,
        fillColor: filledColor,
        labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
        label: label != null ? Text(label!) : null,
        hintText: hintText,
        hintStyle: hintStyle ?? TextStyle(fontSize: 14, color: Colors.grey),
        counterText: '',
        border:
            borderInputNone
                ? InputBorder.none
                : customBorder ??
                    UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: context.colorScheme.primary,
                      ),
                    ),

        focusedBorder:
            borderInputNone
                ? InputBorder.none
                : customBorder ??
                    UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: context.colorScheme.primary,
                      ),
                    ),
        enabledBorder:
            borderInputNone
                ? InputBorder.none
                : customBorder ??
                    UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: context.colorScheme.primary,
                      ),
                    ),

        // border:
      ),
      validator: validator,
      onChanged: onChange,
    );
  }
}

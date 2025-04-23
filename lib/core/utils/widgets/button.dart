import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../extentions/context_extention.dart';

class CommonButton extends StatelessWidget {
  final Function() onTap;
  final String btnText;
  final Color? txtColor;
  final double? height;
  final double? width;
  final double? borderRadius;
  final double? fontSize;
  final Color? backgroundColor;
  final BoxBorder? border;
  final FontWeight? fontWeight;
  final bool isIconButton;
  final Widget? icon;
  final bool fittedWidth;
  final EdgeInsets? padding;
  final bool isLoading;
  const CommonButton({
    super.key,
    this.padding,
    required this.onTap,
    required this.btnText,
    this.txtColor,
    this.height,
    this.width,
    this.fittedWidth = false,
    this.fontWeight,
    this.borderRadius,
    this.fontSize,
    this.backgroundColor,
    this.border,
    this.isIconButton = false,
    this.icon,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    if (!isIconButton) {
      return InkWell(
        borderRadius: BorderRadius.circular(borderRadius ?? 16),
        onTap: isLoading ? null : onTap,
        splashFactory: InkSparkle.splashFactory,
        child: Ink(
          height: height ?? 50,
          width: fittedWidth ? null : width ?? context.screenWidth,
          padding: padding,
          decoration: BoxDecoration(
            color: backgroundColor ?? context.colorScheme.primary,
            borderRadius: BorderRadius.circular(borderRadius ?? 16),
            border: border,
          ),
          child: Container(
            alignment: Alignment.center,
            child:
                isLoading
                    ? const SpinKitThreeBounce(color: Colors.white, size: 20)
                    : Text(
                      btnText,
                      style: TextStyle(
                        fontWeight: fontWeight,
                        fontSize: fontSize ?? 18,
                        color: txtColor ?? Colors.white,
                      ),
                    ),
          ),
        ),
      );
    } else {
      return InkWell(
        borderRadius: BorderRadius.circular(borderRadius ?? 16),
        onTap: onTap,
        child: Ink(
          height: height ?? 50,
          width: width ?? context.screenWidth,
          decoration: BoxDecoration(
            color: backgroundColor ?? context.colorScheme.primary,
            borderRadius: BorderRadius.circular(borderRadius ?? 16),
            border: border,
          ),
          child: Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon!,
                Text(
                  btnText,
                  style: TextStyle(
                    fontWeight: fontWeight,
                    fontSize: fontSize ?? 18,
                    color: txtColor ?? Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}

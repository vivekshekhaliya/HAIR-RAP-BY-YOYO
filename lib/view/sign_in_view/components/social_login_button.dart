import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../res/components/custom_text.dart';
import '../../../res/constants/app_colors.dart';

class SocialLoginButton extends StatefulWidget {
  final String text;
  final String name;
  final VoidCallback? onPressed;
  final bool? isLoading;
  final Color? color;
  final Color? backgroundColor;
  const SocialLoginButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading,
    this.backgroundColor,
    required this.name,
    this.color,
  });

  @override
  State<SocialLoginButton> createState() => _SocialLoginButtonState();
}

class _SocialLoginButtonState extends State<SocialLoginButton> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: widget.isLoading ?? false ? null : widget.onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: widget.backgroundColor ?? AppColors.primaryColor,
        disabledBackgroundColor:
            widget.backgroundColor ?? AppColors.primaryColor,
        fixedSize: Size(size.width, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: widget.isLoading ?? false
          ? Center(
              child: LoadingAnimationWidget.horizontalRotatingDots(
                color: AppColors.whiteColor,
                size: 40,
              ),
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(widget.name, height: 24, width: 24),
                const SizedBox(width: 10),
                CustomText(
                  data: widget.text,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: widget.color ?? AppColors.whiteColor,
                ),
              ],
            ),
    );
  }
}

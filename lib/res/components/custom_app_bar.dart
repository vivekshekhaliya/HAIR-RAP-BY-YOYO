import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import 'custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  const CustomAppBar({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.whiteColor,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        splashRadius: 20,
        icon: Center(
          child: Image.asset(
            'assets/small_icon/arrow_left_icon.png',
            height: 24,
            width: 24,
          ),
        ),
      ),
      title: CustomText(
        data: title,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.blackColor,
      ),
      actions: actions ?? [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../res/constants/app_colors.dart';

class HeaderView extends StatefulWidget implements PreferredSizeWidget {
  const HeaderView({super.key});

  @override
  State<HeaderView> createState() => _HeaderViewState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _HeaderViewState extends State<HeaderView> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      elevation: 0,
      backgroundColor: AppColors.whiteColor,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.whiteSmokeColor),
            ),
            child: IconButton(
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
          ),
          const Spacer(),
          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.whiteSmokeColor),
            ),
            child: IconButton(
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              splashRadius: 20,
              icon: Center(
                child: Image.asset(
                  'assets/small_icon/wishlist_icon.png',
                  height: 24,
                  width: 24,
                  color: isFavorite
                      ? AppColors.primaryColor
                      : AppColors.blackColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hair_rep_by_yoyo/res/components/custom_text.dart';
import 'package:hair_rep_by_yoyo/res/constants/app_colors.dart';

import 'package:hair_rep_by_yoyo/res/routes/routes_name.dart';

class HeaderView extends StatefulWidget {
  const HeaderView({super.key});

  @override
  State<HeaderView> createState() => _HeaderViewState();
}

class _HeaderViewState extends State<HeaderView> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Navigator.pushNamed(context, RoutesName.searchLocation);
            },
            child: Row(
              children: [
                Image.asset(
                  'assets/small_icon/location_pin_icon.png',
                  height: 24,
                  width: 24,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        data: 'Location',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.darkGrayColor,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomText(
                            data: 'Bodakdev, Ahmedabad',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackColor,
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_outlined,
                            size: 22,
                            color: AppColors.darkGrayColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 44,
          width: 44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.whiteSmokeColor),
          ),
          child: Center(
            child: Image.asset(
              'assets/small_icon/notification_icon.png',
              height: 24,
              width: 24,
            ),
          ),
        ),
      ],
    );
  }
}

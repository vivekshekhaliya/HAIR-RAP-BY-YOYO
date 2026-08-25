import 'package:flutter/material.dart';
import 'package:hair_rep_by_yoyo/res/components/custom_text.dart';

import '../../../res/constants/app_colors.dart';

import 'package:hair_rep_by_yoyo/res/routes/routes_name.dart';

class UpcomingScheduleCard extends StatefulWidget {
  const UpcomingScheduleCard({super.key});

  @override
  State<UpcomingScheduleCard> createState() => _UpcomingScheduleCardState();
}

class _UpcomingScheduleCardState extends State<UpcomingScheduleCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.whiteColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            offset: const Offset(0, 4),
            blurRadius: 80,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/sebastian_upcoming.png',
                fit: BoxFit.cover,
                height: 78,
                width: 78,
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    data: 'Hair Cut and Spa',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.blackColor,
                  ),
                  const SizedBox(height: 10),
                  CustomText(
                    data: 'YOYO',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackColor,
                  ),
                  CustomText(
                    data: 'Hair Specialist',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.coolGrayColor,
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 36,
                    width: 36,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withAlpha(10),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/small_icon/phone_icon.png',
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: AppColors.pastelGoldColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/small_icon/medal_star_icon.png',
                          height: 12,
                          width: 12,
                        ),
                        const SizedBox(width: 4),
                        CustomText(
                          data: 'Top Rated',
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: AppColors.blackColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.whiteSmokeColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/small_icon/calendar_icon.png',
                  height: 24,
                  width: 24,
                ),
                const SizedBox(width: 8),
                const CustomText(
                  data: 'Monday, 26 May',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                ),
                const Spacer(),
                Image.asset(
                  'assets/small_icon/clock_icon.png',
                  height: 21,
                  width: 22,
                ),
                const SizedBox(width: 8),
                const CustomText(
                  data: '09:00 - 10:00',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

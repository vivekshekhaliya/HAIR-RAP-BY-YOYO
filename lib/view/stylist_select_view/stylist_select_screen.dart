import 'package:flutter/material.dart';
import 'package:hair_rep_by_yoyo/res/components/custom_app_bar.dart';
import 'package:hair_rep_by_yoyo/res/components/custom_app_button.dart';
import 'package:hair_rep_by_yoyo/res/components/custom_text.dart';
import 'package:hair_rep_by_yoyo/res/constants/app_colors.dart';
import 'package:hair_rep_by_yoyo/res/routes/routes_name.dart';

class StylistSelectScreen extends StatefulWidget {
  const StylistSelectScreen({super.key});

  @override
  State<StylistSelectScreen> createState() => _StylistSelectScreenState();
}

class _StylistSelectScreenState extends State<StylistSelectScreen> {
  int _selectedIndex = 2;

  final List<Map<String, dynamic>> _options = [
    {
      'type': 'generic',
      'title': 'Any Stylist',
      'subtitle': 'Next available stylist',
      'image': 'assets/small_icon/user_grp_icon.png',
    },
    {
      'type': 'generic',
      'title': 'Multiple Stylists',
      'subtitle': 'Choose per service',
      'image': 'assets/small_icon/add_user_icon.png',
    },
    {
      'type': 'stylist',
      'title': 'Mohit D.',
      'subtitle': 'Hair Specialist',
      'image': 'assets/images/sebastian_upcoming.png',
      'topRated': true,
    },
    {
      'type': 'stylist',
      'title': 'Amee',
      'subtitle': 'Hair Dresser',
      'image': 'assets/images/sebastian_upcoming.png', // Placeholder
      'topRated': true,
    },
    {
      'type': 'stylist',
      'title': 'Dhrisha G.',
      'subtitle': 'Hair Specialist',
      'image': 'assets/images/sebastian_upcoming.png', // Placeholder
      'topRated': false,
    },
    {
      'type': 'stylist',
      'title': 'Maharshi S.',
      'subtitle': 'Hair Specialist',
      'image': 'assets/images/sebastian_upcoming.png', // Placeholder
      'topRated': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhiteColor,
      appBar: CustomAppBar(title: 'Choose your stylist'),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: _options.length,
        itemBuilder: (context, index) {
          final option = _options[index];
          final isSelected = _selectedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected
                      ? AppColors.primaryColor
                      : Colors.transparent,
                  width: 1,
                ),
                boxShadow: [
                  if (!isSelected)
                    BoxShadow(
                      color: Colors.black.withAlpha(10),
                      offset: const Offset(0, 2),
                      blurRadius: 10,
                      spreadRadius: 0,
                    ),
                ],
              ),
              child: Row(
                children: [
                  // Leading part (Icon or Image)
                  if (option['type'] == 'generic')
                    Container(
                      height: 56,
                      width: 56,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withAlpha(10),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Image.asset(
                          option['image'],
                          height: 24,
                          width: 24,
                        ),
                      ),
                    )
                  else
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        option['image'],
                        height: 56,
                        width: 56,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 56,
                            width: 56,
                            color: AppColors.mediumGrayColor,
                            child: const Icon(
                              Icons.person,
                              color: AppColors.whiteColor,
                            ),
                          );
                        },
                      ),
                    ),

                  const SizedBox(width: 16),

                  // Text part
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          data: option['title'],
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.blackColor,
                        ),
                        const SizedBox(height: 4),
                        CustomText(
                          data: option['subtitle'],
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.darkGrayColor,
                        ),
                      ],
                    ),
                  ),

                  // Trailing part (Top Rated tag)
                  if (option['type'] == 'stylist' && option['topRated'] == true)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.pastelGoldColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/small_icon/medal_star_icon.png',
                            height: 12,
                            width: 12,
                          ),
                          const SizedBox(width: 4),
                          const CustomText(
                            data: 'Top Rated',
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackColor,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: CustomAppButton(
          text: 'Select & Continue',
          onPressed: () {
            Navigator.pushNamed(context, RoutesName.dateTimeSelect);
          },
        ),
      ),
    );
  }
}

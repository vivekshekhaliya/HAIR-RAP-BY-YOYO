import 'package:flutter/material.dart';
import 'package:hair_rep_by_yoyo/res/components/custom_text.dart';
import 'package:hair_rep_by_yoyo/res/constants/app_colors.dart';

class ServicesView extends StatefulWidget {
  const ServicesView({super.key});

  @override
  State<ServicesView> createState() => _ServicesViewState();
}

class _ServicesViewState extends State<ServicesView> {
  int selectedService = 0;

  final List<Map<String, dynamic>> services = [
    {'title': 'Hair Cut', 'icon': 'assets/small_icon/hair_cut_icon.png'},
    {
      'title': 'Hair Styling',
      'icon': 'assets/small_icon/hair_styling_icon.png',
    },
    {'title': 'Nail Art', 'icon': 'assets/small_icon/nail_art_icon.png'},
    {'title': 'Hair Color', 'icon': 'assets/small_icon/hair_dry_icon.png'},
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: services.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final selected = selectedService == index;
          final service = services[index];

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedService = index;
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 6),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: selected ? AppColors.primaryColor : AppColors.whiteColor,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: AppColors.whiteColor),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.blackColor.withAlpha(20),
                    offset: const Offset(0, 1),
                    blurRadius: 3,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Image.asset(
                    service['icon'],
                    height: 16,
                    width: 16,
                    color: selected
                        ? AppColors.whiteColor
                        : AppColors.mediumGrayColor,
                  ),
                  const SizedBox(width: 7),
                  CustomText(
                    data: service['title'],
                    color: selected
                        ? AppColors.whiteColor
                        : AppColors.mediumGrayColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

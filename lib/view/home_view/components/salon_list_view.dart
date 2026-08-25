import 'package:flutter/material.dart';
import 'package:hair_rep_by_yoyo/res/components/custom_text.dart';
import 'package:hair_rep_by_yoyo/res/constants/app_colors.dart';

class SalonListView extends StatefulWidget {
  const SalonListView({super.key});

  @override
  State<SalonListView> createState() => _SalonListViewState();
}

class _SalonListViewState extends State<SalonListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
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
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhlymQvwY5_d0lPVQ_H_LRLo83NasloNDlNUy7v6De6A&s=10',
                  height: 90,
                  width: 90,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          data: 'Hair Rap by YOYO',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.blackColor,
                        ),
                        CustomText(
                          data: '2 km',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.darkGrayColor,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Image.asset(
                          'assets/small_icon/address_pin_icon.png',
                          height: 14,
                          width: 14,
                        ),
                        const SizedBox(width: 4),
                        const Expanded(
                          child: CustomText(
                            data: 'Bodakdev, Ahmedabad',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.darkGrayColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Image.asset(
                          'assets/small_icon/star_icon.png',
                          height: 14,
                          width: 14,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(
                                Icons.star,
                                size: 14,
                                color: Colors.amber,
                              ),
                        ),
                        const SizedBox(width: 4),
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: '4.7 ',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.blackColor,
                                  fontFamily: 'Inter',
                                ),
                              ),
                              TextSpan(
                                text: '(312)',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.darkGrayColor,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

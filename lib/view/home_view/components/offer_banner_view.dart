import 'package:flutter/material.dart';
import 'package:hair_rep_by_yoyo/res/components/custom_text.dart';
import 'package:hair_rep_by_yoyo/res/constants/app_colors.dart';

class OfferBannerView extends StatefulWidget {
  const OfferBannerView({super.key});

  @override
  State<OfferBannerView> createState() => _OfferBannerViewState();
}

class _OfferBannerViewState extends State<OfferBannerView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: double.infinity,
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/images/offer_banner.png',
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Positioned(
            left: 12,
            top: 12,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.raspberryPurpleColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: CustomText(
                data: 'Limited time',
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.whiteColor,
              ),
            ),
          ),
          Positioned(
            left: 12,
            bottom: 12,
            child: Column(
              spacing: 2,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  data: 'Morning Special!',
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: AppColors.whiteColor,
                ),
                CustomText(
                  data: 'Get 20% Off',
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: AppColors.whiteColor,
                ),
                CustomText(
                  data: 'On All Haircuts Between 9-10 AM.',
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: AppColors.whiteColor,
                ),
              ],
            ),
          ),
          Positioned(
            right: 12,
            bottom: 12,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 9),
              decoration: BoxDecoration(
                color: AppColors.whiteSmokeColor,
                borderRadius: BorderRadius.circular(6),
              ),
              child: CustomText(
                data: 'Book Now',
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: AppColors.blackColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hair_rep_by_yoyo/res/components/custom_text.dart';
import 'package:hair_rep_by_yoyo/res/constants/app_colors.dart';
import 'package:hair_rep_by_yoyo/view/home_view/components/categories_view.dart';
import 'package:hair_rep_by_yoyo/view/home_view/components/header_view.dart';
import 'package:hair_rep_by_yoyo/view/home_view/components/offer_banner_view.dart';
import 'package:hair_rep_by_yoyo/view/home_view/components/salon_list_view.dart';
import 'package:hair_rep_by_yoyo/view/home_view/components/search_bar_view.dart';
import 'package:hair_rep_by_yoyo/view/home_view/components/services_view.dart';
import 'package:hair_rep_by_yoyo/view/home_view/components/upcoming_schedule_card.dart';

import '../../res/routes/routes_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhiteColor,
      appBar: AppBar(
        elevation: 0,
        title: HeaderView(),
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.whiteColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchBarView(),

            const SizedBox(height: 12),
            const CategoriesView(),

            const OfferBannerView(),

            const CustomText(
              data: 'Services',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor,
              padding: EdgeInsets.only(left: 16),
            ),
            const SizedBox(height: 6),
            const ServicesView(),

            const SizedBox(height: 10),
            const CustomText(
              data: 'Upcoming Schedule',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor,
              padding: EdgeInsets.only(left: 16),
            ),
            UpcomingScheduleCard(),

            const SizedBox(height: 10),
            Row(
              children: [
                const CustomText(
                  data: 'Salon Location',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackColor,
                  padding: EdgeInsets.only(left: 16),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.mapScreen);
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/small_icon/map_pin_icon.png',
                        height: 16,
                        width: 16,
                      ),
                      const SizedBox(width: 4),
                      const CustomText(
                        data: 'View on Map',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.vividPurpleColor,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
              ],
            ),

            SalonListView(),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

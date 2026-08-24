import 'package:flutter/material.dart';
import 'package:hair_rep_by_yoyo/res/components/custom_text.dart';
import 'package:hair_rep_by_yoyo/res/constants/app_colors.dart';
import 'package:hair_rep_by_yoyo/view/home_view/components/categories_view.dart';
import 'package:hair_rep_by_yoyo/view/home_view/components/header_view.dart';
import 'package:hair_rep_by_yoyo/view/home_view/components/offer_banner_view.dart';
import 'package:hair_rep_by_yoyo/view/home_view/components/search_bar_view.dart';
import 'package:hair_rep_by_yoyo/view/home_view/components/services_view.dart';
import 'package:hair_rep_by_yoyo/view/home_view/components/upcoming_schedule_card.dart';

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
              fontWeight: FontWeight.w700,
              color: AppColors.blackColor,
              padding: EdgeInsets.only(left: 16),
            ),
            const SizedBox(height: 6),
            const ServicesView(),

            const SizedBox(height: 10),
            const CustomText(
              data: 'Upcoming Schedule',
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.blackColor,
              padding: EdgeInsets.only(left: 16),
            ),
            UpcomingScheduleCard(),
          ],
        ),
      ),
    );
  }
}

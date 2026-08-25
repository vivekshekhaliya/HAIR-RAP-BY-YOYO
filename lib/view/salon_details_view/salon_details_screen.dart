import 'package:flutter/material.dart';
import 'package:hair_rep_by_yoyo/res/components/custom_app_button.dart';
import 'package:hair_rep_by_yoyo/res/components/custom_text.dart';
import 'package:hair_rep_by_yoyo/res/constants/app_colors.dart';
import 'package:hair_rep_by_yoyo/view/salon_details_view/components/header_view.dart';

class SalonDetailsScreen extends StatefulWidget {
  const SalonDetailsScreen({super.key});

  @override
  State<SalonDetailsScreen> createState() => _SalonDetailsScreenState();
}

class _SalonDetailsScreenState extends State<SalonDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhiteColor,
      appBar: HeaderView(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/images/offer_banner.png',
                        width: double.infinity,
                        height: 220,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: double.infinity,
                            height: 220,
                            color: AppColors.mediumGrayColor,
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 20),

                    const CustomText(
                      data: 'Hair Rap by YOYO',
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.blackColor,
                    ),

                    const SizedBox(height: 12),

                    _buildDetailRow(
                      name: 'assets/small_icon/address_pin_icon.png',
                      text: 'D-Block, Shivalik, Bodakdev, Ahmedabad',
                    ),

                    const SizedBox(height: 8),

                    _buildDetailRow(
                      name: 'assets/small_icon/time_icon.png',
                      text: '9AM-10PM, Mon -Sun',
                    ),

                    const SizedBox(height: 8),

                    _buildDetailRow(
                      name: 'assets/small_icon/star_icon.png',
                      text: '4.7 (312)',
                    ),

                    const SizedBox(height: 16),

                    const CustomText(
                      data:
                          'Hair Rap by YOYO provides expert haircuts, styling, along with services like facials, cleanups, skincare and makeup to keep you looking your best.',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.darkGrayColor,
                      height: 1.5,
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(
                TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  labelColor: AppColors.primaryColor,
                  unselectedLabelColor: AppColors.darkGrayColor,
                  indicatorColor: AppColors.primaryColor,
                  indicatorSize: TabBarIndicatorSize.label,
                  dividerColor: Colors.transparent,
                  labelStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  tabs: const [
                    Tab(text: 'Hair Cut'),
                    Tab(text: 'Hair Styling'),
                    Tab(text: 'Hair Treatments'),
                    Tab(text: 'Combo'),
                  ],
                ),
              ),
            ),
          ];
        },

        body: TabBarView(
          controller: _tabController,
          children: [
            _buildServicesList(),
            _buildServicesList(),
            _buildServicesList(),
            _buildServicesList(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: CustomAppButton(text: 'Continue (2)'),
      ),
    );
  }

  Widget _buildDetailRow({required String name, required String text}) {
    return Row(
      children: [
        Image.asset(name, height: 18, width: 18),
        const SizedBox(width: 8),
        Expanded(
          child: CustomText(
            data: text,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.darkGrayColor,
          ),
        ),
      ],
    );
  }

  Widget _buildServicesList() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      children: [
        _buildServiceItem(
          title: 'Hair Cut',
          price: '₹800',
          time: '30 Mins',
          isSelected: true,
          selectionColor: AppColors.vividPurpleColor,
        ),
        const SizedBox(height: 12),
        _buildServiceItem(
          title: 'Hair Wash',
          price: '₹500',
          time: '30 Mins',
          isSelected: true,
          selectionColor: Colors.blue,
        ),
      ],
    );
  }

  Widget _buildServiceItem({
    required String title,
    required String price,
    required String time,
    required bool isSelected,
    required Color selectionColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                data: title,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.blackColor,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  CustomText(
                    data: price,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppColors.darkGrayColor,
                  ),
                  const SizedBox(width: 16),
                  const Icon(
                    Icons.access_time,
                    size: 14,
                    color: AppColors.darkGrayColor,
                  ),
                  const SizedBox(width: 4),
                  CustomText(
                    data: time,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.darkGrayColor,
                  ),
                ],
              ),
            ],
          ),
          Icon(
            isSelected ? Icons.check_circle : Icons.circle_outlined,
            color: isSelected ? selectionColor : AppColors.mediumGrayColor,
            size: 24,
          ),
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _SliverAppBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Material(
      color: AppColors.offWhiteColor,
      child: SizedBox(height: tabBar.preferredSize.height, child: tabBar),
    );
  }

  @override
  bool shouldRebuild(covariant _SliverAppBarDelegate oldDelegate) {
    return tabBar != oldDelegate.tabBar;
  }
}

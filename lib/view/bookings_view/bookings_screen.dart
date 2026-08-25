import 'package:flutter/material.dart';
import 'package:hair_rep_by_yoyo/res/components/custom_app_bar.dart';
import 'package:hair_rep_by_yoyo/res/components/custom_app_button.dart';
import 'package:hair_rep_by_yoyo/res/components/custom_text.dart';
import 'package:hair_rep_by_yoyo/res/constants/app_colors.dart';
import 'package:hair_rep_by_yoyo/res/routes/routes_name.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen>
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

  void _showCancelBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.whiteSmokeColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 24),
              const CustomText(
                data: 'Cancel Booking',
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.blackColor,
              ),
              const SizedBox(height: 16),
              const CustomText(
                data: 'Are you sure you want to cancel?',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.blackColor,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const CustomText(
                data:
                    'Canceling your appointment will remove it from your upcoming bookings.',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.darkGrayColor,
                textAlign: TextAlign.center,
                height: 1.5,
              ),
              const SizedBox(height: 32),
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context); // Close bottom sheet
                  _showCancelSuccessDialog(context); // Show success dialog
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.primaryColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const CustomText(
                  data: 'Yes, Cancel Booking',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: 12),
              CustomAppButton(
                text: 'Keep Appointment',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  void _showCancelSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          backgroundColor: AppColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check,
                    color: AppColors.whiteColor,
                    size: 40,
                  ),
                ),
                const SizedBox(height: 24),
                const CustomText(
                  data: 'Booking Canceled',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.blackColor,
                ),
                const SizedBox(height: 12),
                const CustomText(
                  data: 'Your appointment has been successfully canceled.',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.darkGrayColor,
                  textAlign: TextAlign.center,
                  height: 1.5,
                ),
                const SizedBox(height: 24),
                CustomAppButton(
                  text: 'Back to Bookings',
                  onPressed: () {
                    Navigator.pop(context);
                    // Optionally, switch to cancelled tab
                    _tabController.animateTo(2);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhiteColor,
      appBar: const CustomAppBar(title: 'Bookings'),
      body: Column(
        children: [
          Container(
            color: AppColors.whiteColor,
            child: TabBar(
              controller: _tabController,
              labelColor: AppColors.primaryColor,
              unselectedLabelColor: AppColors.mediumGrayColor,
              indicatorColor: AppColors.primaryColor,
              indicatorWeight: 3,
              labelStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: 'Inter',
              ),
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              tabs: const [
                Tab(text: 'Upcoming'),
                Tab(text: 'Completed'),
                Tab(text: 'Cancelled'),
                Tab(text: 'Rebooking'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildUpcomingList(),
                _buildCompletedList(),
                _buildCancelledList(),
                _buildRebookingList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpcomingList() {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: 2,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: _buildBookingCard(
            status: 'Upcoming',
            date: index == 0
                ? 'Sep 10, 2024 - 9:30 AM'
                : 'Sep 28, 2024 - 9:30 AM',
            salonName: 'Hair Rap by YOYO',
            address: 'S.G Highway, Ahmedabad',
            services: 'Services: Hair Cut, Hair Wash',
            onCancel: () => _showCancelBottomSheet(context),
            onAction: () =>
                Navigator.pushNamed(context, RoutesName.receiptScreen),
            actionText: 'View Receipt',
          ),
        );
      },
    );
  }

  Widget _buildCompletedList() {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: 2,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: _buildBookingCard(
            status: 'Completed',
            date: index == 0
                ? 'Sep 5, 2024 - 11:30 AM'
                : 'Aug 15, 2024 - 9:00 AM',
            salonName: index == 0 ? 'CL Salon' : 'Mcolors Beauty Salon',
            address: 'S.G Highway, Ahmedabad',
            services: 'Services: Hair Cut, Hair Wash',
            onAction: () =>
                Navigator.pushNamed(context, RoutesName.receiptScreen),
            actionText: 'View Receipt',
          ),
        );
      },
    );
  }

  Widget _buildCancelledList() {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: 2,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: _buildBookingCard(
            status: 'Cancelled',
            date: index == 0
                ? 'Sep 27, 2024 - 11:30 AM'
                : 'Aug 14, 2024 - 9:00 AM',
            salonName: index == 0 ? 'Hair Rap by YOYO' : 'Mcolors Beauty Salon',
            address: 'S.G Highway, Ahmedabad',
            services: 'Services: Hair Cut, Hair Wash',
          ),
        );
      },
    );
  }

  Widget _buildRebookingList() {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: 2,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: _buildBookingCard(
            status: 'Rebooking',
            date: index == 0
                ? 'Sep 10, 2024 - 9:30 AM'
                : 'Sep 28, 2024 - 9:30 AM',
            salonName: 'Hair Rap by YOYO',
            address: 'S.G Highway, Ahmedabad',
            services: 'Services: Hair Cut, Hair Wash',
            onCancel: () => _showCancelBottomSheet(context),
            onAction: () =>
                Navigator.pushNamed(context, RoutesName.dateTimeSelect),
            actionText: 'Repeat',
          ),
        );
      },
    );
  }

  Widget _buildBookingCard({
    required String status,
    required String date,
    required String salonName,
    required String address,
    required String services,
    VoidCallback? onCancel,
    VoidCallback? onAction,
    String? actionText,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                data: date,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.blackColor,
              ),
              if (status == 'Cancelled')
                const CustomText(
                  data: 'Cancelled',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/offer_banner.png',
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
                    CustomText(
                      data: salonName,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackColor,
                    ),
                    const SizedBox(height: 8),
                    CustomText(
                      data: address,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.darkGrayColor,
                    ),
                    const SizedBox(height: 8),
                    CustomText(
                      data: services,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.darkGrayColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (onCancel != null || onAction != null) ...[
            const SizedBox(height: 16),
            Row(
              children: [
                if (onCancel != null) ...[
                  Expanded(
                    child: OutlinedButton(
                      onPressed: onCancel,
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppColors.primaryColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const CustomText(
                        data: 'Cancel Booking',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                ],
                if (onAction != null)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onAction,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        elevation: 0,
                      ),
                      child: CustomText(
                        data: actionText ?? '',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

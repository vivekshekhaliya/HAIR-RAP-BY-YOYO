import 'package:flutter/material.dart';
import 'package:hair_rep_by_yoyo/res/components/custom_app_bar.dart';
import 'package:hair_rep_by_yoyo/res/components/custom_app_button.dart';
import 'package:hair_rep_by_yoyo/res/components/custom_text.dart';
import 'package:hair_rep_by_yoyo/res/constants/app_colors.dart';
import 'package:hair_rep_by_yoyo/res/routes/routes_name.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String _selectedPaymentMethod = 'online';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhiteColor,
      appBar: const CustomAppBar(title: 'Booking summary'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            _buildSalonInfoCard(),
            const SizedBox(height: 24),
            _buildSectionTitle('Booking details'),
            const SizedBox(height: 16),
            _buildBookingDetails(),
            const SizedBox(height: 24),
            const Divider(
              color: AppColors.whiteSmokeColor,
              thickness: 1,
              height: 1,
            ),
            const SizedBox(height: 24),
            _buildSectionTitle('Payment'),
            const SizedBox(height: 16),
            _buildPaymentOptions(),
            const SizedBox(height: 24),
            const Divider(
              color: AppColors.whiteSmokeColor,
              thickness: 1,
              height: 1,
            ),
            const SizedBox(height: 24),
            _buildSectionTitle('Pricing Details'),
            const SizedBox(height: 16),
            _buildPricingDetails(),
            const SizedBox(height: 32),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: CustomAppButton(
          text: 'Proceed',
          onPressed: () {
            Navigator.pushNamed(context, RoutesName.paymentScreen);
          },
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomText(
        data: title,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.blackColor,
      ),
    );
  }

  Widget _buildSalonInfoCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            offset: const Offset(0, 4),
            blurRadius: 20,
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: CustomText(
                        data: 'Hair Rap by YOYO',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blackColor,
                      ),
                    ),
                    CustomText(
                      data: '2 km',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.darkGrayColor,
                    ),
                  ],
                ),
                const SizedBox(height: 6),
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
                const SizedBox(height: 6),
                Row(
                  children: [
                    Image.asset(
                      'assets/small_icon/star_icon.png',
                      height: 14,
                      width: 14,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.star, size: 14, color: Colors.amber),
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
  }

  Widget _buildBookingDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            data: 'Date',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.blackColor,
          ),
          const SizedBox(height: 4),
          const CustomText(
            data: 'Wed, Sep 10 at 9:30 AM',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.darkGrayColor,
          ),
          const SizedBox(height: 16),
          const CustomText(
            data: 'Stylist',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.blackColor,
          ),
          const SizedBox(height: 4),
          const CustomText(
            data: 'Any stylist - 40 Mins',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.darkGrayColor,
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentOptions() {
    return Column(
      children: [
        _buildPaymentOptionTile(
          title: 'Pay Online Now',
          subtitle: 'Secure your booking instantly',
          value: 'online',
        ),
        const SizedBox(height: 16),
        _buildPaymentOptionTile(
          title: 'Pay at Salon',
          subtitle: 'Settle payment after your appointment',
          value: 'salon',
        ),
      ],
    );
  }

  Widget _buildPaymentOptionTile({
    required String title,
    required String subtitle,
    required String value,
  }) {
    final isSelected = _selectedPaymentMethod == value;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPaymentMethod = value;
        });
      },
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    data: title,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.blackColor,
                  ),
                  const SizedBox(height: 4),
                  CustomText(
                    data: subtitle,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: AppColors.darkGrayColor,
                  ),
                ],
              ),
            ),
            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: isSelected
                  ? AppColors.primaryColor
                  : AppColors.darkGrayColor,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPricingDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _buildPricingRow('Hair Cut', '₹900'),
          const SizedBox(height: 12),
          _buildPricingRow('Hair Wash', '₹200'),
          const SizedBox(height: 12),
          _buildPricingRow('Discount', '₹30.00'),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                data: 'Total',
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.blackColor,
              ),
              const CustomText(
                data: '₹1070.00',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.blackColor,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPricingRow(String title, String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          data: title,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.darkGrayColor,
        ),
        CustomText(
          data: amount,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.darkGrayColor,
        ),
      ],
    );
  }
}

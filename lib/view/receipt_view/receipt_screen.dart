import 'package:flutter/material.dart';
import 'package:hair_rep_by_yoyo/res/components/custom_app_bar.dart';
import 'package:hair_rep_by_yoyo/res/components/custom_app_button.dart';
import 'package:hair_rep_by_yoyo/res/components/custom_text.dart';
import 'package:hair_rep_by_yoyo/res/constants/app_colors.dart';

class ReceiptScreen extends StatelessWidget {
  const ReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhiteColor,
      appBar: const CustomAppBar(title: 'Receipt'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          bottom: 100,
          top: 20,
          left: 20,
          right: 20,
        ),
        child: Column(
          children: [
            // QR Code
            Center(
              child: Image.asset(
                'assets/images/qr_code.png',
                height: 200,
                width: 200,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 16),
            const CustomText(
              data: 'Scan this QR code at the salon for\nquick check-in.',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor,
              textAlign: TextAlign.center,
              height: 1.5,
            ),
            const SizedBox(height: 32),

            // Booking Details Card
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(10),
                    offset: const Offset(0, 4),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildDetailRow('Salon', 'Hair Rap by YOYO'),
                  const SizedBox(height: 16),
                  _buildDetailRow('Customer Name', 'Mohit D.'),
                  const SizedBox(height: 16),
                  _buildDetailRow('Phone', '+91 9256736591'),
                  const SizedBox(height: 16),
                  _buildDetailRow('Booking Date', 'September 10, 2024'),
                  const SizedBox(height: 16),
                  _buildDetailRow('Booking Time', '9:30 AM'),
                  const SizedBox(height: 16),
                  _buildDetailRow('Stylist', 'Any'),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Pricing Details Card
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(10),
                    offset: const Offset(0, 4),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildDetailRow('Hair Cut', '₹900'),
                  const SizedBox(height: 16),
                  _buildDetailRow('Hair Wash', '₹200'),
                  const SizedBox(height: 16),
                  _buildDetailRow('Discount', '₹30.00'),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
        child: CustomAppButton(text: 'Download Receipt', onPressed: () {}),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          data: title,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.blackColor,
        ),
        CustomText(
          data: value,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.darkGrayColor,
        ),
      ],
    );
  }
}

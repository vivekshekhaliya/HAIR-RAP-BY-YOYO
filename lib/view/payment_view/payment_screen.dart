import 'package:flutter/material.dart';
import 'package:hair_rep_by_yoyo/res/components/custom_app_bar.dart';
import 'package:hair_rep_by_yoyo/res/components/custom_app_button.dart';
import 'package:hair_rep_by_yoyo/res/components/custom_text.dart';
import 'package:hair_rep_by_yoyo/res/constants/app_colors.dart';
import 'package:hair_rep_by_yoyo/res/routes/routes_name.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _selectedMethod =
      'credit_card'; // 'credit_card', 'apple_pay', 'google_pay'
  String _selectedCard = 'mastercard'; // 'mastercard', 'visa'
  bool _isAddingCard = false;

  void _showProcessingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                        strokeWidth: 4,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          AppColors.primaryColor,
                        ),
                        backgroundColor: AppColors.primaryColor.withAlpha(50),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const CustomText(
                  data: 'Processing Your Payment...',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackColor,
                ),
                const SizedBox(height: 8),
                CustomText(
                  data: 'Please wait while we complete your\ntransaction.',
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: AppColors.darkGrayColor,
                  textAlign: TextAlign.center,
                  height: 1.5,
                ),
              ],
            ),
          ),
        );
      },
    );

    // Simulate network request
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context); // Close processing dialog
      // Let's assume success for now. You can toggle this for testing.
      _showSuccessDialog();
    });
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                    color: AppColors.raspberryPurpleColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check,
                    color: AppColors.whiteColor,
                    size: 36,
                  ),
                ),
                const SizedBox(height: 20),
                const CustomText(
                  data: 'Your salon appointment is\nconfirmed!',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.blackColor,
                  textAlign: TextAlign.center,
                  height: 1.3,
                ),
                const SizedBox(height: 12),
                CustomText(
                  data:
                      'Thank you for your payment. We look\nforward to seeing you soon.',
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: AppColors.darkGrayColor,
                  textAlign: TextAlign.center,
                  height: 1.5,
                ),
                const SizedBox(height: 24),
                CustomAppButton(
                  text: 'View Receipt',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 12),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      RoutesName.bottomNavigationBarScreen,
                      (route) => false,
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.primaryColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const CustomText(
                    data: 'Back to Home',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showFailedDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                    color: AppColors.brightRedColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.close,
                    color: AppColors.whiteColor,
                    size: 36,
                  ),
                ),
                const SizedBox(height: 20),
                const CustomText(
                  data: 'Payment Failed',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.blackColor,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                CustomText(
                  data:
                      'We couldn\'t process your payment.\nPlease check your card details or try\nanother payment method.',
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: AppColors.darkGrayColor,
                  textAlign: TextAlign.center,
                  height: 1.5,
                ),
                const SizedBox(height: 24),
                CustomAppButton(
                  text: 'Try Again',
                  onPressed: () {
                    Navigator.pop(context); // close dialog
                    _showProcessingDialog();
                  },
                ),
                const SizedBox(height: 12),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context); // close dialog
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.primaryColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const CustomText(
                    data: 'Change Payment Method',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                  ),
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
      appBar: const CustomAppBar(title: 'Select payment method'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 100),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              _buildCreditCardOption(),
              const SizedBox(height: 16),
              _buildSimpleOption(
                title: 'Apple Pay',
                value: 'apple_pay',
                trailing: Image.asset(
                  'assets/small_icon/apple_pay_icon.png',
                  width: 42,
                  height: 25,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 16),
              _buildSimpleOption(
                title: 'Google Pay',
                value: 'google_pay',
                trailing: Image.asset(
                  'assets/small_icon/google_pay_icon.png',
                  width: 42,
                  height: 25,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: CustomAppButton(
          text: _isAddingCard ? 'Save Card' : 'Pay Now',
          onPressed: () {
            if (_isAddingCard) {
              setState(() {
                _isAddingCard = false;
              });
            } else {
              _showProcessingDialog();
            }
          },
        ),
      ),
    );
  }

  Widget _buildSimpleOption({
    required String title,
    required String value,
    required Widget trailing,
  }) {
    final isSelected = _selectedMethod == value;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedMethod = value;
          _isAddingCard = false;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
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
        child: Row(
          children: [
            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: isSelected
                  ? AppColors.primaryColor
                  : AppColors.mediumGrayColor,
              size: 24,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CustomText(
                data: title,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.blackColor,
              ),
            ),
            trailing,
          ],
        ),
      ),
    );
  }

  Widget _buildCreditCardOption() {
    final isSelected = _selectedMethod == 'credit_card';

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedMethod = 'credit_card';
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(16),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  isSelected
                      ? Icons.radio_button_checked
                      : Icons.radio_button_unchecked,
                  color: isSelected
                      ? AppColors.primaryColor
                      : AppColors.mediumGrayColor,
                  size: 24,
                ),
                const SizedBox(width: 12),
                const CustomText(
                  data: 'Credit/ Debit Card',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                ),
              ],
            ),
            if (isSelected) ...[
              const SizedBox(height: 20),
              _buildSavedCard(
                logo: 'assets/small_icon/master_card_icon.png',
                number: '**** 2345',
                value: 'mastercard',
              ),
              const SizedBox(height: 16),
              _buildSavedCard(
                logo: 'assets/small_icon/visa_card_icon.png',
                number: '**** 3456',
                value: 'visa',
              ),
              const SizedBox(height: 20),
              if (!_isAddingCard)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isAddingCard = true;
                    });
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.add,
                        color: AppColors.primaryColor,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      const CustomText(
                        data: 'Add Card',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),
                    ],
                  ),
                )
              else
                _buildAddCardForm(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSavedCard({
    required String logo,
    required String number,
    required String value,
  }) {
    final isSelected = _selectedCard == value;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCard = value;
          _isAddingCard = false;
        });
      },
      child: Row(
        children: [
          Image.asset(logo, width: 40, height: 25, fit: BoxFit.fill),
          const SizedBox(width: 16),
          Expanded(
            child: CustomText(
              data: number,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.blackColor,
            ),
          ),
          Icon(
            isSelected
                ? Icons.radio_button_checked
                : Icons.radio_button_unchecked,
            color: isSelected
                ? AppColors.primaryColor
                : AppColors.mediumGrayColor,
            size: 24,
          ),
        ],
      ),
    );
  }

  Widget _buildAddCardForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomText(
              data: 'Add New Card',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _isAddingCard = false;
                });
              },
              child: const Icon(
                Icons.close,
                color: AppColors.blackColor,
                size: 20,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildTextField('Card Number'),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: _buildTextField('MM/YY')),
            const SizedBox(width: 12),
            Expanded(child: _buildTextField('CVC')),
          ],
        ),
        const SizedBox(height: 12),
        _buildTextField('Card Holder Name'),
      ],
    );
  }

  Widget _buildTextField(String hint) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.whiteSmokeColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: const TextStyle(
            color: AppColors.mediumGrayColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: 'Inter',
          ),
        ),
      ),
    );
  }
}

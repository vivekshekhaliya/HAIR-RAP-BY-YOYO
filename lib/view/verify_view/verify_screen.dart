import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hair_rep_by_yoyo/res/components/custom_app_button.dart';
import 'package:hair_rep_by_yoyo/res/components/custom_text.dart';
import 'package:hair_rep_by_yoyo/res/constants/app_colors.dart';
import 'package:pinput/pinput.dart';

import '../../res/routes/routes_name.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final TextEditingController _otpController = TextEditingController();
  bool _isOtpError = false;

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  void _verifyOtp() {
    final otp = _otpController.text.trim();

    if (otp.length != 4 || otp != '1234') {
      setState(() {
        _isOtpError = true;
      });
      return;
    }

    // Correct OTP
    setState(() {
      _isOtpError = false;
    });

    Navigator.pushNamed(context, RoutesName.bottomNavigationBarScreen);
  }

  @override
  Widget build(BuildContext context) {
    final insent = MediaQuery.of(context).padding;
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.secondaryColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: insent.top),
            CustomText(
              data: 'Verify Your Identity',
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.blackColor,
            ),

            const SizedBox(height: 20),

            CustomText(
              data:
                  'We’ve sent a 4-digit code to 071*****05\nPlease enter it below.',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.darkGrayColor,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 24),
            Pinput(
              length: 4,
              controller: _otpController,
              autofocus: true,
              obscureText: false,
              cursor: Container(
                height: 20,
                width: 2,
                color: AppColors.primaryColor,
              ),
              defaultPinTheme: PinTheme(
                height: 56,
                width: 48,
                textStyle: TextStyle(fontSize: 22, color: AppColors.blackColor),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: _isOtpError
                      ? AppColors.brightRedColor.withAlpha(20)
                      : AppColors.whiteSmokeColor,
                  border: Border.all(
                    color: _isOtpError
                        ? AppColors.brightRedColor
                        : AppColors.whiteSmokeColor,
                  ),
                ),
              ),

              focusedPinTheme: PinTheme(
                height: 56,
                width: 48,
                textStyle: TextStyle(fontSize: 22, color: AppColors.whiteColor),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppColors.primaryColor),
                ),
              ),

              onChanged: (value) {
                if (_isOtpError) {
                  setState(() {
                    _isOtpError = false;
                  });
                }
              },
            ),

            // Error message
            if (_isOtpError) ...[
              const SizedBox(height: 24),
              CustomText(
                data: 'The code you entered is incorrect.\nPlease try again.',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.brightRedColor,
                textAlign: TextAlign.center,
              ),
            ],

            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  data: 'Didn’t receive a code? ',
                  color: AppColors.darkGrayColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                CustomText(
                  data: 'Resend',
                  color: AppColors.primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),

            const Spacer(),
            CustomAppButton(text: 'Continue', onPressed: _verifyOtp),
            SizedBox(height: insent.bottom),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hair_rep_by_yoyo/res/components/custom_app_text_input.dart';
import 'package:hair_rep_by_yoyo/res/components/custom_text.dart';
import 'package:hair_rep_by_yoyo/res/routes/routes_name.dart';
import 'package:hair_rep_by_yoyo/view/sign_in_view/components/social_login_button.dart';

import '../../res/components/custom_app_button.dart';
import '../../res/constants/app_colors.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _loginController = TextEditingController();

  final FocusNode _loginFocusNode = FocusNode();

  bool _isFocused = false;

  @override
  void initState() {
    super.initState();

    _loginFocusNode.addListener(() {
      if (_loginFocusNode.hasFocus && !_isFocused) {
        setState(() {
          _isFocused = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _loginFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final insent = MediaQuery.of(context).padding;
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Image.asset(
                _isFocused
                    ? 'assets/images/sign-in_view_two.png'
                    : 'assets/images/sign-in_view_one.png',
                key: ValueKey(_isFocused),
                height: size.height,
                width: size.width,
                fit: BoxFit.fill,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    data: 'Book Your Perfect\nLook in Minutes!',
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                    letterSpacing: 0.6,
                  ),

                  const SizedBox(height: 30),
                  CustomAppTextInput(
                    focusNode: _loginFocusNode,
                    controller: _loginController,
                    hintText: 'Enter your email or phone number.',
                    keyboardType: TextInputType.numberWithOptions(),
                  ),

                  const SizedBox(height: 24),
                  CustomAppButton(
                    text: 'Continue',
                    onPressed: () {
                      Navigator.pushNamed(context, RoutesName.verify);
                    },
                  ),

                  const SizedBox(height: 20),
                  Center(
                    child: CustomText(
                      data: 'Or',
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),

                  SocialLoginButton(
                    text: 'Continue with Apple',
                    name: 'assets/small_icon/apple_icon.png',
                    backgroundColor: AppColors.blackColor,
                    onPressed: () {
                      Navigator.pushNamed(context, RoutesName.verify);
                    },
                  ),

                  const SizedBox(height: 20),

                  SocialLoginButton(
                    text: 'Continue with Google',
                    name: 'assets/small_icon/google_icon.png',
                    color: AppColors.blackColor,
                    backgroundColor: AppColors.whiteColor,
                    onPressed: () {
                      Navigator.pushNamed(context, RoutesName.verify);
                    },
                  ),

                  SizedBox(height: insent.bottom + 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

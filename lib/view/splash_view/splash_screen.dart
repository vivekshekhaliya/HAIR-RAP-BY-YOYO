import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hair_rep_by_yoyo/res/constants/app_colors.dart';

import '../../res/routes/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _startAnimation = false;

  @override
  void initState() {
    super.initState();
    
    // Start animation slightly after render
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _startAnimation = true;
      });
    });

    // Increased delay from 2s to 3s to allow the animation to play
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;

      Navigator.pushReplacementNamed(context, RoutesName.signIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: AppColors.secondaryColor,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );

    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/splash_bg_view.png',
            height: size.height,
            width: size.width,
          ),
          AnimatedScale(
            duration: const Duration(milliseconds: 1200),
            curve: Curves.easeOutBack,
            scale: _startAnimation ? 1.0 : 0.4,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 1200),
              curve: Curves.easeIn,
              opacity: _startAnimation ? 1.0 : 0.0,
              child: Image.asset(
                'assets/icons/app_icon.png',
                height: 100,
                width: size.width / 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

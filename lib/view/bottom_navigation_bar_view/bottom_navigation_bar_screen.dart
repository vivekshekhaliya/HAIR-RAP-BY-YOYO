import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hair_rep_by_yoyo/view/home_view/home_screen.dart';
import 'package:hair_rep_by_yoyo/view/bookings_view/bookings_screen.dart';
import '../../res/components/custom_text.dart';
import '../../res/constants/app_colors.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen>
    with WidgetsBindingObserver {
  int _selectedIndex = 0;

  final List<Map<String, String>> _items = [
    {"icon": "assets/small_icon/home_tab_bar_icon.png", "label": "Home"},
    {
      "icon": "assets/small_icon/bookings_tab_bar_icon.png",
      "label": "Bookings",
    },
    {"icon": "assets/small_icon/bot_tab_bar_icon.png", "label": "AI Bot"},
    {
      "icon": "assets/small_icon/favourites_tab_bar_icon.png",
      "label": "Favourites",
    },
    {"icon": "assets/small_icon/profile_tab_bar_icon.png", "label": "Profile"},
  ];

  final List<Widget> _pages = const [
    HomeScreen(),
    BookingsScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
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
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: AppColors.blackColor.withAlpha(20),
              offset: const Offset(0, -4),
              blurRadius: 12,
              spreadRadius: 0,
            ),
          ],
        ),
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_items.length, (index) {
            final bool isSelected = _selectedIndex == index;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              width: size.width / 6,
              padding: EdgeInsets.fromLTRB(0, 14, 0, padding.bottom),
              child: InkWell(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedScale(
                      scale: 1.10,
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeOut,
                      child: Image.asset(
                        _items[index]["icon"]!,
                        height: 22,
                        color: isSelected
                            ? AppColors.vividPurpleColor
                            : AppColors.darkGrayColor,
                        colorBlendMode: BlendMode.srcIn,
                      ),
                    ),

                    const SizedBox(height: 8),

                    AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeOut,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w500,
                        color: isSelected
                            ? AppColors.vividPurpleColor
                            : AppColors.darkGrayColor,
                      ),
                      child: CustomText(
                        data: _items[index]["label"]!,
                        fontSize: 12,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w500,
                        color: isSelected
                            ? AppColors.vividPurpleColor
                            : AppColors.darkGrayColor,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

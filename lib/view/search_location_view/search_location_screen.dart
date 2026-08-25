import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hair_rep_by_yoyo/res/components/custom_app_bar.dart';
import 'package:hair_rep_by_yoyo/res/components/custom_text.dart';
import 'package:hair_rep_by_yoyo/res/constants/app_colors.dart';

class SearchLocationScreen extends StatefulWidget {
  const SearchLocationScreen({super.key});

  @override
  State<SearchLocationScreen> createState() => _SearchLocationScreenState();
}

class _SearchLocationScreenState extends State<SearchLocationScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> _recentLocations = [
    {'title': 'S.G Highway', 'subtitle': ''},
    {'title': 'Thaltej', 'subtitle': 'Ahmedabad, Gujarat.'},
    {'title': 'Bodakdev', 'subtitle': 'Ahmedabad, Gujarat.'},
    {'title': 'Sola', 'subtitle': 'Ahmedabad, Gujarat.'},
    {'title': 'Gota', 'subtitle': 'Ahmedabad, Gujarat.'},
    {'title': 'Vastral', 'subtitle': 'Ahmedabad, Gujarat.'},
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar(title: 'Search Location'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            // Search Bar
            TextFormField(
              controller: _searchController,
              textInputAction: TextInputAction.done,
              style: GoogleFonts.inter(
                color: AppColors.blackColor,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
              keyboardAppearance: Brightness.dark,
              onFieldSubmitted: (value) {
                FocusScope.of(context).unfocus(); // closes keyboard
              },
              decoration: InputDecoration(
                hintText: "Enter address or city name",
                hintStyle: GoogleFonts.inter(
                  color: AppColors.mediumGrayColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),

                counterText: "",
                prefixStyle: GoogleFonts.inter(
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),

                errorStyle: GoogleFonts.inter(
                  color: AppColors.mediumGrayColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),

                filled: true,
                fillColor: AppColors.whiteSmokeColor,

                prefixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(width: 12),
                    Image.asset(
                      'assets/small_icon/search_icon.png',
                      height: 22,
                      width: 22,
                    ),
                  ],
                ),

                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.whiteSmokeColor),
                ),

                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.whiteSmokeColor),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.whiteSmokeColor),
                ),

                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.whiteSmokeColor),
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.whiteSmokeColor),
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Recent Locations Title
            const CustomText(
              data: 'Recent Locations',
              color: AppColors.blackColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 16),
            // Recent Locations List
            Expanded(
              child: ListView.builder(
                itemCount: _recentLocations.length,
                itemBuilder: (context, index) {
                  final location = _recentLocations[index];
                  return GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/small_icon/location_pin_icon.png',
                            height: 24,
                            width: 24,
                            color: AppColors.blackColor,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  data: location['title'] ?? '',
                                  color: AppColors.blackColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                                if (location['subtitle']!.isNotEmpty) ...[
                                  const SizedBox(height: 4),
                                  CustomText(
                                    data: location['subtitle'] ?? '',
                                    color: AppColors.mediumGrayColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ],
                            ),
                          ),
                          Image.asset(
                            'assets/small_icon/close_icon.png',
                            height: 12,
                            width: 12,
                            color: AppColors.blackColor,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

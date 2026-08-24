import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../res/constants/app_colors.dart';

class SearchBarView extends StatefulWidget {
  const SearchBarView({super.key});

  @override
  State<SearchBarView> createState() => _SearchBarViewState();
}

class _SearchBarViewState extends State<SearchBarView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(16, 10, 16, 8),
      child: TextFormField(
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
          hintText: "Search “Salon, Specialist...”",
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
          fillColor: AppColors.whiteColor,

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

          suffixIcon: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {},
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                icon: Image.asset(
                  'assets/small_icon/filter_icon.png',
                  height: 24,
                  width: 24,
                ),
              ),
              const SizedBox(width: 12),
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
    );
  }
}

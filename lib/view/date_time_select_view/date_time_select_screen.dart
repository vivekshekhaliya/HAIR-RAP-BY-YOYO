import 'package:flutter/material.dart';
import 'package:hair_rep_by_yoyo/res/components/custom_app_bar.dart';
import 'package:hair_rep_by_yoyo/res/components/custom_app_button.dart';
import 'package:hair_rep_by_yoyo/res/components/custom_text.dart';
import 'package:hair_rep_by_yoyo/res/constants/app_colors.dart';
import 'package:hair_rep_by_yoyo/res/routes/routes_name.dart';

class DateTimeSelectScreen extends StatefulWidget {
  const DateTimeSelectScreen({super.key});

  @override
  State<DateTimeSelectScreen> createState() => _DateTimeSelectScreenState();
}

class _DateTimeSelectScreenState extends State<DateTimeSelectScreen> {
  int _selectedDateIndex = 1; // Default selected: WED, Sep 10
  int _selectedTimeIndex = 1; // Default selected: 9:30 AM

  final List<Map<String, String>> _dates = [
    {'day': 'TUE', 'date': 'Sep 9', 'time': '40 mins'},
    {'day': 'WED', 'date': 'Sep 10', 'time': '40 mins'},
    {'day': 'THU', 'date': 'Sep 11', 'time': '40 mins'},
  ];

  final List<Map<String, dynamic>> _times = [
    {'time': '9:00 AM', 'discount': '20% Off'},
    {'time': '9:30 AM', 'discount': '20% Off'},
    {'time': '10:00 AM', 'discount': null},
    {'time': '10:30 AM', 'discount': null},
    {'time': '11:00 AM', 'discount': null},
    {'time': '11:30 AM', 'discount': null},
    {'time': '12:00 PM', 'discount': null},
    {'time': '12:30 PM', 'discount': null},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhiteColor,
      appBar: const CustomAppBar(title: 'Date and time'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          bottom: 100,
        ), // padding for bottom button
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const CustomText(
              data: 'Select Date',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor,
              padding: EdgeInsets.symmetric(horizontal: 20),
            ),
            const SizedBox(height: 16),
            _buildDateSelector(),
            const SizedBox(height: 32),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CustomText(
                data: 'Select Time',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.blackColor,
              ),
            ),
            const SizedBox(height: 16),
            _buildTimeSelector(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: CustomAppButton(
          text: 'Confirm Appointment',
          onPressed: () {
            Navigator.pushNamed(context, RoutesName.checkoutScreen);
          },
        ),
      ),
    );
  }

  Widget _buildDateSelector() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: _dates.length + 1, // +1 for "More dates"
        itemBuilder: (context, index) {
          if (index == _dates.length) {
            // More dates button
            return Container(
              width: 70,
              margin: const EdgeInsets.only(right: 12),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/small_icon/calendar_icon.png',
                    height: 24,
                    width: 24,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.calendar_month,
                      color: AppColors.blackColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const CustomText(
                    data: 'More\ndates',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackColor,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }

          final date = _dates[index];
          final isSelected = index == _selectedDateIndex;

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedDateIndex = index;
              });
            },
            child: Container(
              width: 70,
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.whiteColor : AppColors.whiteColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected
                      ? AppColors.primaryColor
                      : Colors.transparent,
                  width: 1,
                ),
                boxShadow: [
                  if (!isSelected)
                    BoxShadow(
                      color: Colors.black.withAlpha(10),
                      offset: const Offset(0, 4),
                      blurRadius: 10,
                    ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    data: date['day'],
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: isSelected
                        ? AppColors.primaryColor
                        : AppColors.mediumGrayColor,
                  ),
                  const SizedBox(height: 4),
                  CustomText(
                    data: date['date'],
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isSelected
                        ? AppColors.primaryColor
                        : AppColors.blackColor,
                  ),
                  const SizedBox(height: 4),
                  CustomText(
                    data: date['time'],
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: isSelected
                        ? AppColors.primaryColor
                        : AppColors.mediumGrayColor,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTimeSelector() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: List.generate(_times.length, (index) {
          final timeObj = _times[index];
          final isSelected = index == _selectedTimeIndex;

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedTimeIndex = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected
                      ? AppColors.primaryColor
                      : Colors.transparent,
                  width: 1,
                ),
                boxShadow: [
                  if (!isSelected)
                    BoxShadow(
                      color: Colors.black.withAlpha(10),
                      offset: const Offset(0, 2),
                      blurRadius: 10,
                    ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    data: timeObj['time'],
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackColor,
                  ),
                  if (timeObj['discount'] != null)
                    CustomText(
                      data: timeObj['discount'],
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.emeraldGreenColor,
                    ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

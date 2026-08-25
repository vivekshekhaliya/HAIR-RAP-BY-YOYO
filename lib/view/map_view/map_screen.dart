import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hair_rep_by_yoyo/res/components/custom_app_bar.dart';
import 'package:hair_rep_by_yoyo/res/components/custom_app_button.dart';
import 'package:hair_rep_by_yoyo/res/components/custom_text.dart';
import 'package:hair_rep_by_yoyo/res/constants/app_colors.dart';
import 'package:hair_rep_by_yoyo/res/routes/routes_name.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  String _selectedSortBy = 'Nearest';
  String _selectedServiceAvailability = 'All';
  bool _isMapLoading = true;

  final List<String> _sortByOptions = [
    'Nearest',
    'Top Rated',
    'Price low to high',
    'Price high to low',
  ];

  late GoogleMapController mapController;
  final LatLng _center = const LatLng(23.0225, 72.5714); // Ahmedabad center

  final List<String> _serviceAvailabilityOptions = [
    'All',
    'Male only',
    'Female Only',
  ];

  void _showFiltersBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              decoration: const BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: AppColors.silverGrayColor,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const CustomText(
                    data: 'Filters',
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: AppColors.blackColor,
                  ),
                  const SizedBox(height: 24),
                  const CustomText(
                    data: 'Sort by',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor,
                  ),
                  const SizedBox(height: 12),
                  ..._sortByOptions.map((option) {
                    final isSelected = _selectedSortBy == option;
                    return GestureDetector(
                      onTap: () {
                        setModalState(() {
                          _selectedSortBy = option;
                        });
                        setState(() {
                          _selectedSortBy = option;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            Icon(
                              isSelected
                                  ? Icons.radio_button_checked
                                  : Icons.radio_button_unchecked,
                              color: isSelected
                                  ? AppColors.primaryColor
                                  : AppColors.blackColor,
                              size: 20,
                            ),
                            const SizedBox(width: 12),
                            CustomText(
                              data: option,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.blackColor,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 24),
                  const CustomText(
                    data: 'Service Availability',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor,
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 12,
                    children: _serviceAvailabilityOptions.map((option) {
                      final isSelected = _selectedServiceAvailability == option;
                      return GestureDetector(
                        onTap: () {
                          setModalState(() {
                            _selectedServiceAvailability = option;
                          });
                          setState(() {
                            _selectedServiceAvailability = option;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.primaryColor
                                : AppColors.whiteSmokeColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: CustomText(
                            data: option,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: isSelected
                                ? AppColors.whiteColor
                                : AppColors.mediumGrayColor,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 32),
                  CustomAppButton(
                    text: 'Apply',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Map View'),
      body: Stack(
        children: [
          // Google Map
          Positioned.fill(
            child: GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
                // Add a small delay to ensure map has started rendering before hiding loader
                Future.delayed(const Duration(milliseconds: 500), () {
                  if (mounted) {
                    setState(() {
                      _isMapLoading = false;
                    });
                  }
                });
              },
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 14.0,
              ),
              zoomControlsEnabled: false,
              myLocationButtonEnabled: false,
              markers: {
                Marker(
                  markerId: const MarkerId('salon_1'),
                  position: const LatLng(23.0225, 72.5714),
                  infoWindow: const InfoWindow(title: 'Hair Rap by YOYO'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueBlue,
                  ),
                ),
                Marker(
                  markerId: const MarkerId('salon_2'),
                  position: const LatLng(23.0300, 72.5800),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueBlue,
                  ),
                ),
                Marker(
                  markerId: const MarkerId('salon_3'),
                  position: const LatLng(23.0150, 72.5600),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueBlue,
                  ),
                ),
              },
            ),
          ),

          if (_isMapLoading)
            const Positioned.fill(
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
            ),

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
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
                              'assets/small_icon/address_pin_icon.png',
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
                          borderSide: BorderSide(
                            color: AppColors.whiteSmokeColor,
                          ),
                        ),

                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: AppColors.whiteSmokeColor,
                          ),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: AppColors.whiteSmokeColor,
                          ),
                        ),

                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: AppColors.whiteSmokeColor,
                          ),
                        ),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: AppColors.whiteSmokeColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  InkWell(
                    onTap: _showFiltersBottomSheet,
                    child: Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.whiteSmokeColor),
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/small_icon/map_filter_icon.png',
                          height: 24,
                          width: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom Horizontal List
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 240,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: _buildSalonCard(index),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSalonCard(int index) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RoutesName.salonDetails);
      },
      child: Container(
        width: 300,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(20),
              offset: const Offset(0, 4),
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Salon Image
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/offer_banner.png',
                    height: 130,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    height: 36,
                    width: 36,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor.withAlpha(100),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/small_icon/wishlist_icon.png',
                        height: 20,
                        width: 20,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Details
            const SizedBox(height: 14),
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
            const SizedBox(height: 8),
            Row(
              children: [
                Image.asset(
                  'assets/small_icon/address_pin_icon.png',
                  height: 16,
                  width: 16,
                ),
                const SizedBox(width: 4),
                const Expanded(
                  child: CustomText(
                    data: 'S.G Highway, Ahmedabad',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.darkGrayColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Image.asset(
                  'assets/small_icon/star_icon.png',
                  height: 16,
                  width: 16,
                ),
                const SizedBox(width: 4),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: '4.7 ',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColors.blackColor,
                          fontFamily: 'Inter',
                        ),
                      ),
                      TextSpan(
                        text: '(312)',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
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
    );
  }
}

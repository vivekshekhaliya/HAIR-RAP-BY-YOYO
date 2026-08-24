import 'package:flutter/material.dart';
import 'package:hair_rep_by_yoyo/res/components/custom_text.dart';
import 'package:hair_rep_by_yoyo/res/constants/app_colors.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  final List<Map<String, dynamic>> categories = [
    {'title': 'Haircut', 'image': 'assets/small_icon/haircut_icon.png'},
    {'title': 'Coloring', 'image': 'assets/small_icon/coloring_icon.png'},
    {'title': 'Spa', 'image': 'assets/small_icon/spa_icon.png'},
    {'title': 'Makeup', 'image': 'assets/small_icon/makeup_icon.png'},
    {'title': 'Styling', 'image': 'assets/small_icon/styling_icon.png'},
    {'title': 'Coloring', 'image': 'assets/small_icon/coloring_icon.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 74,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final item = categories[index];

          return SizedBox(
            width: 66,
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: Image.asset(
                    item['image'],
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) {
                      return Container(
                        color: Colors.grey.shade200,
                        child: const Icon(
                          Icons.image_outlined,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 7),
                CustomText(
                  data: item['title'],
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

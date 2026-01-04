import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfinder_app/core/theming/app_colors.dart';
import 'package:petfinder_app/core/theming/app_text_styles.dart';

class CategoriesList extends StatelessWidget {
  final String selectedCategory;
  final Function(String) onCategorySelected;

  const CategoriesList({
    Key? key,
    required this.selectedCategory,
    required this.onCategorySelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = ['All', 'Cats', 'Dogs', 'Birds', 'Fish', 'Reptiles'];

    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w),
      child: SizedBox(
        height:48.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          separatorBuilder: (context, index) => SizedBox(width: 12.w),
          itemBuilder: (context, index) {
            final category = categories[index];
            final isSelected = category == selectedCategory;

            return GestureDetector(
              onTap: () => onCategorySelected(category),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal:19.w),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primaryColor : AppColors.white2,
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: Center(
                  child: Text(
                    category,
                    style: AppTextStyles.font14PrimarySemibold.copyWith(
                      color: isSelected ? AppColors.white : AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
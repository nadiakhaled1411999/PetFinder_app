import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfinder_app/core/constants/app_assets.dart';
import 'package:petfinder_app/core/helpers/spacing.dart';
import 'package:petfinder_app/core/theming/app_colors.dart';
import 'package:petfinder_app/core/theming/app_text_styles.dart';

class PetCard extends StatelessWidget {
  final String name;
  final String gender;
  final String age;
  final String distance;
  final String imagePath;
  final bool isFavorite;
  final VoidCallback onFavoritePressed;

  const PetCard({
    Key? key,
    required this.name,
    required this.gender,
    required this.age,
    required this.distance,
    required this.imagePath,
    required this.isFavorite,
    required this.onFavoritePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Pet Image
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Container(
              width: 120.w,
              height: 130.h,
              decoration: BoxDecoration(
                color: AppColors.white2,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(
                  AppAssets.cat,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          horizontalSpace(16),

          // Pet Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: AppTextStyles.font20BlackBold,
                    ),
                    Padding(
                      padding:  EdgeInsets.only(right: 8.w),
                      child: GestureDetector(
                          onTap: onFavoritePressed,
                          child: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color:
                                isFavorite ? Colors.red : AppColors.primaryColor,
                            size: 24.sp,
                          ),
                        ),
                    ),

                  ],
                ),
                verticalSpace(4),
                Text(
                  gender,
                  style: AppTextStyles.font14Grey3Regular,
                ),
                verticalSpace(4),
                Text(
                  age,
                  style: AppTextStyles.font14Grey3Regular,
                ),
                verticalSpace(8),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 16.sp,
                    ),
                    horizontalSpace(4),
                    Text(
                      distance,
                      style: AppTextStyles.font14Grey3Regular,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Favorite Button
        ],
      ),
    );
  }
}

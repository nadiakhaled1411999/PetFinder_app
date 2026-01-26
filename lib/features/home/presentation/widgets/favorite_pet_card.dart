import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfinder_app/core/helpers/spacing.dart';
import 'package:petfinder_app/core/theming/app_colors.dart';
import 'package:petfinder_app/core/theming/app_text_styles.dart';
import 'package:petfinder_app/features/home/domain/models/pet.dart';

class FavoritePetCard extends StatelessWidget {
  final Pet pet;
  final VoidCallback onFavoritePressed;
  final VoidCallback onTap;

  const FavoritePetCard({
    super.key,
    required this.pet,
    required this.onFavoritePressed,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20.r),
                    ),
                    child: Image.asset(
                      pet.imagePath,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 8.h,
                    right: 8.w,
                    child: GestureDetector(
                      onTap: onFavoritePressed,
                      child: Container(
                        width: 32.w,
                        height: 32.h,
                        decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.favorite,
                          color: AppColors.white,
                          size: 18.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(pet.name, style: AppTextStyles.font18BlackBold),
                  verticalSpace(4),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.red, size: 14.sp),
                      horizontalSpace(4),
                      Expanded(
                        child: Text(
                          pet.distance,
                          style: AppTextStyles.font12Grey3Regular,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

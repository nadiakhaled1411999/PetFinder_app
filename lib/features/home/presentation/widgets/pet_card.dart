import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfinder_app/core/helpers/spacing.dart';
import 'package:petfinder_app/core/routing/routes.dart';
import 'package:petfinder_app/core/theming/app_colors.dart';
import 'package:petfinder_app/core/theming/app_text_styles.dart';
import 'package:petfinder_app/features/home/domain/models/pet.dart';

 class PetCard extends StatelessWidget {
  final Pet pet;
  final VoidCallback onFavoritePressed;

  const PetCard({
    super.key,
    required this.pet,
    required this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.petDetailsScreen,
          arguments: pet,
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4.h),
        height: 160.h,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 4,
              offset: const Offset(1, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(
                  pet.imagePath,
                  width: 100.w,
                  height: 140.h,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            horizontalSpace(16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(pet.name,
                          style: AppTextStyles.font18BlackBold),
                      GestureDetector(
                        onTap: onFavoritePressed,
                        child: Icon(
                          pet.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: pet.isFavorite
                              ? Colors.red
                              : AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(4),
                  Text(pet.gender,
                      style: AppTextStyles.font12Grey3Regular),
                  verticalSpace(4),
                  Text(pet.age,
                      style: AppTextStyles.font12Grey3Regular),
                  verticalSpace(8),
                  Row(
                    children: [
                      Icon(Icons.location_on,
                          color: Colors.red, size: 16.sp),
                      horizontalSpace(4),
                      Text(pet.distance,
                          style: AppTextStyles.font12Grey3Regular),
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

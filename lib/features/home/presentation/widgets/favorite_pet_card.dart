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
        height: 212.h,
        width: 160.w,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white2,
                    borderRadius: BorderRadius.circular(16.r),
                    image: DecorationImage(
                      image: AssetImage(pet.imagePath),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              verticalSpace(17),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Row(
                  children: [
                    Text(pet.name, style: AppTextStyles.font16BlackBold),
                    const Spacer(),
                    GestureDetector(
                      onTap: onFavoritePressed,
                      child: Container(
                        width: 28.w,
                        height: 35.h,
                        decoration: const BoxDecoration(
                          color: AppColors.white2,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Icon(
                          Icons.favorite,
                          color: AppColors.primaryColor,
                          size: 18.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpace(2.5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Row(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

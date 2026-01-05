import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfinder_app/core/helpers/spacing.dart';
import 'package:petfinder_app/core/routing/routes.dart';
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
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.petDetailsScreen,
          arguments: {
            'name': name,
            'gender': gender,
            'age': age,
            'weight': '10 kg',
            'distance': distance,
            'price': '\$95',
            'about':
                "Tom is a playful and loyal Golden Retriever who loves being around people.He’s 1 years old, full of energy, and always ready for a game of fetch.Tom enjoys morning walks, belly rubs, and taking long naps after playtime.He’s gentle with kids, gets along well with other pets, and makes the perfect family companion.",
            'imagePath': imagePath,
            'isFavorite': isFavorite,
          },
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
              child: Container(
                width: 100.w,
                height: 140.h,
                decoration: BoxDecoration(
                  color: AppColors.white2,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            horizontalSpace(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(name, style: AppTextStyles.font18BlackBold),
                      Padding(
                        padding: EdgeInsets.only(right: 8.w),
                        child: GestureDetector(
                          onTap: onFavoritePressed,
                          child: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite
                                ? Colors.red
                                : AppColors.primaryColor,
                            size: 24.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(4),
                  Text(gender, style: AppTextStyles.font12Grey3Regular),
                  verticalSpace(4),
                  Text(age, style: AppTextStyles.font12Grey3Regular),
                  verticalSpace(8),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.red, size: 16.sp),
                      horizontalSpace(4),
                      Text(distance, style: AppTextStyles.font12Grey3Regular),
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfinder_app/core/helpers/spacing.dart';
import 'package:petfinder_app/core/theming/app_colors.dart';
import 'package:petfinder_app/core/theming/app_text_styles.dart';

class GetStartedButton extends StatelessWidget {
  final VoidCallback onTap;

  const GetStartedButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 297.w,
        height: 56.h,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(28.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryColor.withOpacity(0.3),
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.pets,
              color: AppColors.white,
              size: 24.sp,
            ),
            horizontalSpace(8),
            Text(
              'Get started',
              style: AppTextStyles.font18WhiteSemiBold,
            ),
          ],
        ),
      ),
    );
  }
}
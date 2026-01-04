import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfinder_app/core/helpers/spacing.dart';
import 'package:petfinder_app/core/theming/app_colors.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: AppColors.grey0,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          horizontalSpace(16),
          Icon(
            Icons.search,
            color: AppColors.grey2,
            size: 24.sp,
          ),
          horizontalSpace(12),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: AppColors.grey2,
                  fontSize: 16.sp,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          Icon(
              Icons.tune,
              color: AppColors.grey3,
              size: 20.sp,
            ),

          horizontalSpace(8),
        ],
      ),
    );
  }
}
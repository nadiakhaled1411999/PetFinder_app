import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfinder_app/core/helpers/spacing.dart';
import 'package:petfinder_app/core/routing/routes.dart';
import 'package:petfinder_app/core/theming/app_colors.dart';
import 'package:petfinder_app/core/theming/app_text_styles.dart';
import 'package:petfinder_app/features/home/domain/models/pet.dart';

class PetDetailsScreen extends StatefulWidget {
  final Pet pet;

  const PetDetailsScreen({
    super.key,
    required this.pet,
  });

  @override
  State<PetDetailsScreen> createState() => _PetDetailsScreenState();
}

class _PetDetailsScreenState extends State<PetDetailsScreen> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.pet.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildImageSection(),
                    verticalSpace(24),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.pet.name,
                                  style: AppTextStyles.font20BlackBold,
                                ),
                                verticalSpace(8),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.red,
                                      size: 20.sp,
                                    ),
                                    horizontalSpace(4),
                                    Text(
                                      widget.pet.distance,
                                      style:
                                          AppTextStyles.font16Grey2Regular,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Text(
                            widget.pet.price,
                            style: AppTextStyles.font20BlackBold.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(24),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        children: [
                          Expanded(
                            child:
                                _buildInfoCard('Gender', widget.pet.gender),
                          ),
                          horizontalSpace(12),
                          Expanded(
                            child: _buildInfoCard('Age', widget.pet.age),
                          ),
                          horizontalSpace(12),
                          Expanded(
                            child:
                                _buildInfoCard('Weight', widget.pet.weight),
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(32),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'About:',
                            style: AppTextStyles.font20BlackBold,
                          ),
                          verticalSpace(12),
                          Text(
                            widget.pet.about,
                            style: AppTextStyles.font16Grey2Regular.copyWith(
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildAdoptButton(),
    );
  }

  Widget _buildImageSection() {
    return Container(
      height: 390.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white2,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32.r),
          bottomRight: Radius.circular(32.r),
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: Image.asset(
              widget.pet.imagePath,
              height: 320.h,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: 16.h,
            left: 20.w,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.primaryColor,
                size: 20.sp,
              ),
            ),
          ),
          Positioned(
            top: 16.h,
            right: 20.w,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isFavorite = !isFavorite;
                  widget.pet.isFavorite = isFavorite;
                });
              },
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: AppColors.primaryColor,
                size: 24.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String title, String value) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.white2,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: AppTextStyles.font16BlackBold,
          ),
          verticalSpace(4),
          Text(
            value,
            style: AppTextStyles.font14Grey2Regular,
          ),
        ],
      ),
    );
  }

  Widget _buildAdoptButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.favoritesScreen,
            (route) => false,
          );
        },
        child: Container(
          height: 66.h,
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
          child: Center(
            child: Text(
              'Adopt me',
              style: AppTextStyles.font18WhiteMedium,
            ),
          ),
        ),
      ),
    );
  }
}
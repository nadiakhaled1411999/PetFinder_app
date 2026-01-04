import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfinder_app/core/helpers/spacing.dart';
import 'package:petfinder_app/core/theming/app_colors.dart';
import 'package:petfinder_app/core/theming/app_text_styles.dart';

class PetDetailsScreen extends StatefulWidget {
  final String name;
  final String gender;
  final String age;
  final String weight;
  final String distance;
  final String price;
  final String about;
  final String imagePath;
  final bool isFavorite;

  const PetDetailsScreen({
    Key? key,
    required this.name,
    required this.gender,
    required this.age,
    required this.weight,
    required this.distance,
    required this.price,
    required this.about,
    required this.imagePath,
    this.isFavorite = false,
  }) : super(key: key);

  @override
  State<PetDetailsScreen> createState() => _PetDetailsScreenState();
}

class _PetDetailsScreenState extends State<PetDetailsScreen> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
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
                    // Pet Image with Back & Favorite Buttons
                    _buildImageSection(),

                    verticalSpace(24),

                    // Pet Name, Distance & Price
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
                                  widget.name,
                                  style: AppTextStyles.font32BlackBold,
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
                                      widget.distance,
                                      style: AppTextStyles.font16Grey2Regular,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Text(
                            widget.price,
                            style: AppTextStyles.font32BlackBold.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),

                    verticalSpace(24),

                    // Gender, Age, Weight Info Cards
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        children: [
                          Expanded(
                            child: _buildInfoCard('Gender', widget.gender),
                          ),
                          horizontalSpace(12),
                          Expanded(
                            child: _buildInfoCard('Age', widget.age),
                          ),
                          horizontalSpace(12),
                          Expanded(
                            child: _buildInfoCard('Weight', widget.weight),
                          ),
                        ],
                      ),
                    ),

                    verticalSpace(32),

                    // About Section
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'About:',
                            style: AppTextStyles.font24BlackBold,
                          ),
                          verticalSpace(12),
                          Text(
                            widget.about,
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
      // Adopt Me Button
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
          // Pet Image
          Center(
            child: Image.asset(
              widget.imagePath,
              height: 350.h,
              fit: BoxFit.contain,
            ),
          ),

          // Back Button
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

          // Favorite Button
          Positioned(
            top: 16.h,
            right: 20.w,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isFavorite = !isFavorite;
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
            style: AppTextStyles.font18BlackBold,
          ),
          verticalSpace(4),
          Text(
            value,
            style: AppTextStyles.font16Grey2Regular,
          ),
        ],
      ),
    );
  }

  Widget _buildAdoptButton() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          // Handle Adopt action
        },
        child: Container(
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

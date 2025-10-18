import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfinder_app/core/constants/app_assets.dart';
import 'package:petfinder_app/core/helpers/spacing.dart';
import 'package:petfinder_app/core/routing/routes.dart';
import 'package:petfinder_app/core/theming/app_colors.dart';
import 'package:petfinder_app/core/theming/app_text_styles.dart';
import 'package:petfinder_app/features/onboarding/presentation/widgets/get_started_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Image.asset(
                AppAssets.dogAndCat,
                height: 305.h,
                fit: BoxFit.contain,
              ),

              verticalSpace(10),

              Text(
                'Find Your Best Companion With Us',
                style: AppTextStyles.font32BlackBold,
                textAlign: TextAlign.center,
              ),

              verticalSpace(10),

              Text(
                'Join & discover the best suitable pets as\nper your preferences in your location',
                style: AppTextStyles.font16GreyRegular,
                textAlign: TextAlign.center,
              ),

              verticalSpace(50),

              GetStartedButton(
                onTap: () {
                  Navigator.pushReplacementNamed(
                    context,
                    Routes.homeScreen,
                  );
                },
              ),

              // verticalSpace(40),
            ],
          ),
        ),
      ),
    );
  }
}

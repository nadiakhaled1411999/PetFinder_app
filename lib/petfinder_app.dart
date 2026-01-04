import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfinder_app/core/routing/app_router.dart';
import 'package:petfinder_app/core/theming/app_colors.dart';
import 'package:petfinder_app/core/theming/font_family.dart';
import 'package:petfinder_app/features/splash/presentation/view/splash_screen.dart';

class  PetFinderApp extends StatelessWidget {
  const  PetFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
       final PetFinderAppRouter router = PetFinderAppRouter();
    return  ScreenUtilInit(
      designSize: const Size(375, 956),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
         fontFamily:FontFamilies.interFamily ,
          primaryColor: AppColors.primaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
          home: const SplashScreen(),
          onGenerateRoute: router.generateRoute,
        );
      },
    );
  }
}
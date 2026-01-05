import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfinder_app/core/helpers/spacing.dart';
import 'package:petfinder_app/core/routing/routes.dart';
import 'package:petfinder_app/core/theming/app_colors.dart';
import 'package:petfinder_app/core/theming/app_text_styles.dart';
import 'package:petfinder_app/features/home/presentation/widgets/bottom_nav_bar.dart';
import 'package:petfinder_app/features/home/presentation/widgets/categories_list.dart';
import 'package:petfinder_app/features/home/presentation/widgets/favorite_pet_card.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Text(
                'Your Favorite Pets',
                style: AppTextStyles.font32BlackBold,
              ),
            ),

            // Categories
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: CategoriesList(
                selectedCategory: selectedCategory,
                onCategorySelected: (category) {
                  setState(() {
                    selectedCategory = category;
                  });
                },
              ),
            ),

            verticalSpace(24),

            // Favorites Grid
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.h,
                  childAspectRatio: 0.75,
                ),
                itemCount: 3, // dummy data
                itemBuilder: (context, index) {
                  return FavoritePetCard(
                    name: _getDummyFavorites()[index]['name']!,
                    distance: _getDummyFavorites()[index]['distance']!,
                    imagePath: _getDummyFavorites()[index]['image']!,
                    onFavoritePressed: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.homeScreen,
              (route) => false,
            );
          }
        },
      ),
    );
  }

  List<Map<String, String>> _getDummyFavorites() {
    return [
      {
        'name': 'Joli',
        'distance': '1.6 km away',
        'image': 'cat',

      },
      {
        'name': 'Oliver',
        'distance': '2 km away',
        'image': 'sunny',
      },
      {
        'name': 'Tom',
        'distance': '2.7 km away',
        'image': 'dog2',
      },
    ];
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfinder_app/core/helpers/spacing.dart';
import 'package:petfinder_app/core/theming/app_colors.dart';
import 'package:petfinder_app/core/theming/app_text_styles.dart';
import 'package:petfinder_app/features/home/data/models/pets_dummy_data.dart';
import 'package:petfinder_app/features/home/presentation/view/pet_details_screen.dart';
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
    final favorites = petsDummyData
        .where((pet) => pet.isFavorite)
        .toList();

    final filteredFavorites = selectedCategory == 'All'
        ? favorites
        : favorites
            .where((pet) => pet.category == selectedCategory)
            .toList();

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Text(
                'Your Favorite Pets',
                style: AppTextStyles.font32BlackBold,
              ),
            ),

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

            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.h,
                  childAspectRatio: 0.75,
                ),
                itemCount: filteredFavorites.length,
                itemBuilder: (context, index) {
                  final pet = filteredFavorites[index];

                  return FavoritePetCard(
                    pet: pet,
                    onFavoritePressed: () {
                      setState(() {
                        pet.isFavorite = false;
                      });
                    },
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PetDetailsScreen(pet: pet),
                        ),
                      );
                    },
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
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}

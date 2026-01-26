import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfinder_app/core/helpers/spacing.dart';
import 'package:petfinder_app/core/routing/routes.dart';
import 'package:petfinder_app/core/theming/app_text_styles.dart';
import 'package:petfinder_app/features/home/data/models/pets_dummy_data.dart';
import 'package:petfinder_app/features/home/presentation/view/pet_details_screen.dart';
import 'package:petfinder_app/features/home/presentation/widgets/bottom_nav_bar.dart';
import 'package:petfinder_app/features/home/presentation/widgets/categories_list.dart';
import 'package:petfinder_app/features/home/presentation/widgets/home_app_bar.dart';
import 'package:petfinder_app/features/home/presentation/widgets/pet_card.dart';
import 'package:petfinder_app/features/home/presentation/widgets/search_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    final pets = selectedCategory == 'All'
        ? petsDummyData
        : petsDummyData.where((p) => p.category == selectedCategory).toList();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const HomeAppBar(),
            verticalSpace(20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const SearchBarWidget(),
            ),
            verticalSpace(20),
            Padding(
              padding: EdgeInsets.only(left: 0.w),
              child: Text(
                'Categories',
                style: AppTextStyles.font20BlackBold,
              ),
            ),
            verticalSpace(14),
            CategoriesList(
              selectedCategory: selectedCategory,
              onCategorySelected: (category) {
                setState(() {
                  selectedCategory = category;
                });
              },
            ),
            verticalSpace(24),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 10.h,
                ),
                itemCount: pets.length,
                itemBuilder: (context, index) {
                  final pet = pets[index];
                  return PetCard(
                    pet: pet,
                    onFavoritePressed: () {
                      setState(() {
                        pet.isFavorite = !pet.isFavorite;
                        Navigator.pushNamed(
                          context,
                          Routes.petDetailsScreen,
                          arguments: petsDummyData[index],
                        );
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.pushNamed(
              context,
              Routes.favoritesScreen,
            );
          }
        },
      ),
    );
  }
}

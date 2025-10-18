import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfinder_app/core/helpers/spacing.dart';
import 'package:petfinder_app/core/theming/app_text_styles.dart';
import 'package:petfinder_app/features/home/presentation/widgets/bottom_nav_bar.dart';
import 'package:petfinder_app/features/home/presentation/widgets/categories_list.dart';
import 'package:petfinder_app/features/home/presentation/widgets/home_app_bar.dart';
import 'package:petfinder_app/features/home/presentation/widgets/pet_card.dart';
import 'package:petfinder_app/features/home/presentation/widgets/search_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // App Bar
            const HomeAppBar(),

            verticalSpace(20),

            // Search Bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const SearchBarWidget(),
            ),

            verticalSpace(20),

            // Categories
            Expanded(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16.w),
                        child: Text(
                          'Categories',
                          style: AppTextStyles.font24BlackBold,
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
                    ],
                  ),

                  verticalSpace(24),

                  // Pets List
                  Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.only(
                        left: 20.w,
                        right: 20.w,
                        bottom: 20.h,
                      ),

                      itemCount: 4, // dummy data
                      separatorBuilder: (context, index) => verticalSpace(16),
                      itemBuilder: (context, index) {
                        return PetCard(
                          name: _getDummyPets()[index]['name']!,
                          gender: _getDummyPets()[index]['gender']!,
                          age: _getDummyPets()[index]['age']!,
                          distance: _getDummyPets()[index]['distance']!,
                          imagePath: _getDummyPets()[index]['image']!,
                          isFavorite: false,
                          onFavoritePressed: () {},
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 0),
    );
  }

  // Dummy Data
  List<Map<String, String>> _getDummyPets() {
    return [
      {
        'name': 'Joli',
        'gender': 'Female',
        'age': '5 Months Old',
        'distance': '1.6 km away',
        'image': 'cat',
      },
      {
        'name': 'Tom',
        'gender': 'Male',
        'age': '1 year Old',
        'distance': '2.7 km away',
        'image': 'dog2',
      },
      {
        'name': 'Oliver',
        'gender': 'Male & Female',
        'age': '3 Months Old',
        'distance': '2 km away',
        'image': 'sunny',
      },
      {
        'name': 'Shelly',
        'gender': 'Female',
        'age': '1.5 year Old',
        'distance': '3 km away',
        'image': 'dog',
      },
    ];
  }
}

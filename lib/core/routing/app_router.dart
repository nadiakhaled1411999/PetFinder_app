import 'package:flutter/material.dart';
import 'package:petfinder_app/core/routing/routes.dart';
import 'package:petfinder_app/features/home/presentation/view/favorites_screen.dart';
import 'package:petfinder_app/features/home/presentation/view/home_screen.dart';
import 'package:petfinder_app/features/home/presentation/view/pet_details_screen.dart';
import 'package:petfinder_app/features/onboarding/presentation/view/onboarding_screen.dart';
import 'package:petfinder_app/features/splash/presentation/view/splash_screen.dart';

class PetFinderAppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
            builder: (context) => const OnboardingScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      case Routes.petDetailsScreen:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => PetDetailsScreen(
            name: args['name'],
            gender: args['gender'],
            age: args['age'],
            weight: args['weight'],
            distance: args['distance'],
            price: args['price'],
            about: args['about'],
            imagePath: args['imagePath'],
            isFavorite: args['isFavorite'] ?? false,
          ),
        );
      case Routes.favoritesScreen:
        return MaterialPageRoute(
          builder: (context) => const FavoritesScreen(),
        );

      default:
        return null;
    }
  }
}
// // The code snippet is a class named AppRouter that contains a method
// generateRoute which determines the route to be displayed based
// on the provided settings.
// The method generateRoute takes a settings object as input.
// It checks the name property of the settings object using a switch statement.
// If the name matches Routes.onBoardingScreen, it returns a
// MaterialPageRoute with a screen.
// If the name matches Routes.loginScreen, it returns a
// MaterialPageRoute with a screen.
// If no match is found, it returns a MaterialPageRoute with a Scaffold
// displaying a message indicating the route name that was not defined.

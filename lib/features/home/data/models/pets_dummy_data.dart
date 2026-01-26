import 'package:petfinder_app/core/constants/app_assets.dart';
import 'package:petfinder_app/features/home/domain/models/pet.dart';

List<Pet> petsDummyData = [
  Pet(
    id: 1,
    name: 'Joli',
    gender: 'Female',
    age: '5 Months Old',
    weight: '4 kg',
    distance: '1.6 km away',
    price: '\$70',
    category: 'Cats',
    imagePath: AppAssets.cat,
    about: 'Cute and calm cat.',
  ),
  Pet(
    id: 2,
    name: 'Tom',
    gender: 'Male',
    age: '1 Year Old',
    weight: '10 kg',
    distance: '2.7 km away',
    price: '\$95',
    category: 'Dogs',
    imagePath: AppAssets.dog2,
    about: 'Friendly and playful dog.',
  ),
];

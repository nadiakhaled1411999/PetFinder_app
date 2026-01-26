class Pet {
  final int id;
  final String name;
  final String gender;
  final String age;
  final String weight;
  final String distance;
  final String price;
  final String about;
  final String imagePath;
  final String category;
  bool isFavorite;

  Pet({
    required this.id,
    required this.name,
    required this.gender,
    required this.age,
    required this.weight,
    required this.distance,
    required this.price,
    required this.about,
    required this.imagePath,
    required this.category,
    this.isFavorite = false,
  });
}

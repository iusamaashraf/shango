class CategoryModel {
  String? imagePath;
  String? name;
  CategoryModel({
    required this.imagePath,
    required this.name,
  });
}

List<CategoryModel> categoryList = [
  CategoryModel(
    imagePath: 'assets/images/selling.png',
    name: 'Seller',
  ),
  CategoryModel(
    imagePath: 'assets/images/PngItem_1689982.png',
    name: 'Buyer',
  ),
  CategoryModel(
    imagePath: 'assets/images/rent.png',
    name: 'Rent',
  ),
];

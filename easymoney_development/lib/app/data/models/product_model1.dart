class ProductModel {
  final String title;
  final String category;
  final String description;
  final int price;
  final List<String> images;

  ProductModel({
    required this.title,
    required this.category,
    required this.description,
    required this.price,
    required this.images,
  });
}
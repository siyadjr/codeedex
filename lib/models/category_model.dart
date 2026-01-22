class CategoryModel {
  final int id;
  final String name;
  final String image;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    final category = json['category'];
    return CategoryModel(
      id: category['id'],
      name: category['name'] ?? '',
      image: category['image'] ?? '',
    );
  }
}

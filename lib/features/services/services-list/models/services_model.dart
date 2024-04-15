class ServicesModel {
  final int id;
  final String name;
  final String image;
  final String? description;
  final int categoryId;
  ServicesModel({
    required this.id,
    required this.image,
    required this.name,
    this.description,
    required this.categoryId,
  });

  factory ServicesModel.fromJson(Map<String, dynamic> json) {
    return ServicesModel(
      id: json['id'],
      image: json['image'],
      name: json['name'],
      description: json['description'],
      categoryId: json['category'],
    );
  }
}
